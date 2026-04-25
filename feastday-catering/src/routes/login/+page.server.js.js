import { fail, redirect } from '@sveltejs/kit'
import pool from '$lib/server/db.js'
import bcrypt from 'bcryptjs'

export const actions = {
  default: async ({ request, cookies }) => {
    const data = await request.formData()
    const email = data.get('email')
    const password = data.get('password')

    if (!email || !password) {
      return fail(400, { error: 'Please fill in all fields' })
    }

    const result = await pool.query('SELECT * FROM users WHERE email = $1', [email])
    const user = result.rows[0]

    if (!user) {
      return fail(400, { error: 'Invalid email or password' })
    }

    const valid = await bcrypt.compare(password, user.password)
    if (!valid) {
      return fail(400, { error: 'Invalid email or password' })
    }

    const sessionData = JSON.stringify({ id: user.id, name: user.name, email: user.email, role: user.role })
    cookies.set('session', Buffer.from(sessionData).toString('base64'), {
      path: '/',
      httpOnly: true,
      maxAge: 60 * 60 * 24 * 7
    })

    throw redirect(303, '/')
  }
}
