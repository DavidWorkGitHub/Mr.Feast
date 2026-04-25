import { fail, redirect } from '@sveltejs/kit'
import pool from '$lib/server/db.js'
import bcrypt from 'bcryptjs'

export const actions = {
  default: async ({ request, cookies }) => {
    const data = await request.formData()
    const name = data.get('name')
    const email = data.get('email')
    const password = data.get('password')
    const confirm = data.get('confirm')

    if (!name || !email || !password || !confirm) {
      return fail(400, { error: 'Please fill in all fields' })
    }

    if (password !== confirm) {
      return fail(400, { error: 'Passwords do not match' })
    }

    if (password.length < 6) {
      return fail(400, { error: 'Password must be at least 6 characters' })
    }

    const existing = await pool.query('SELECT * FROM users WHERE email = $1', [email])
    if (existing.rows.length > 0) {
      return fail(400, { error: 'Email already registered' })
    }

    const hashed = await bcrypt.hash(password, 10)
    const result = await pool.query(
      'INSERT INTO users (name, email, password, role) VALUES ($1, $2, $3, $4) RETURNING *',
      [name, email, hashed, 'customer']
    )
    const user = result.rows[0]

    const sessionData = JSON.stringify({ id: user.id, name: user.name, email: user.email, role: user.role })
    cookies.set('session', Buffer.from(sessionData).toString('base64'), {
      path: '/',
      httpOnly: true,
      maxAge: 60 * 60 * 24 * 7
    })

    throw redirect(303, '/')
  }
}
