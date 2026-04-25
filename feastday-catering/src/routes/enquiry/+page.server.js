import pool from '$lib/server/db.js'
import { fail, redirect } from '@sveltejs/kit'

export async function load({ cookies }) {
  const session = cookies.get('session')
  if (!session) throw redirect(303, '/login')
  
  const user = JSON.parse(Buffer.from(session, 'base64').toString())
  const packages = await pool.query('SELECT * FROM packages ORDER BY type, price')
  
  return { user, packages: packages.rows }
}

export const actions = {
  default: async ({ request, cookies }) => {
    const session = cookies.get('session')
    if (!session) throw redirect(303, '/login')
    
    const user = JSON.parse(Buffer.from(session, 'base64').toString())
    const data = await request.formData()
    
    const packageId = data.get('packageId')
    const eventDate = data.get('eventDate')
    const guestCount = data.get('guestCount')
    const notes = data.get('notes')

    if (!packageId || !eventDate || !guestCount) {
      return fail(400, { error: 'Please fill in all required fields' })
    }

    await pool.query(
      'INSERT INTO bookings (user_id, package_id, event_date, guest_count, notes) VALUES ($1, $2, $3, $4, $5)',
      [user.id, packageId, eventDate, guestCount, notes || '']
    )

    throw redirect(303, '/bookings')
  }
}
