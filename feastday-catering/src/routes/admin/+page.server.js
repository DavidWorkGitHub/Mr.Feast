import pool from '$lib/server/db.js'
import { redirect } from '@sveltejs/kit'

export async function load({ cookies }) {
  const session = cookies.get('session')
  if (!session) throw redirect(303, '/login')

  const user = JSON.parse(Buffer.from(session, 'base64').toString())
  if (user.role !== 'admin') throw redirect(303, '/')

  const bookings = await pool.query(
    `SELECT bookings.*, packages.name as package_name, packages.price,
     users.name as user_name, users.email as user_email
     FROM bookings
     JOIN packages ON bookings.package_id = packages.id
     JOIN users ON bookings.user_id = users.id
     ORDER BY bookings.created_at DESC`
  )

  const stats = await pool.query(`
    SELECT 
      COUNT(*) as total_bookings,
      COUNT(CASE WHEN status = 'pending' THEN 1 END) as pending,
      COUNT(CASE WHEN status = 'confirmed' THEN 1 END) as confirmed,
      COALESCE(SUM(packages.price), 0) as total_value
    FROM bookings
    JOIN packages ON bookings.package_id = packages.id
  `)

  return { user, bookings: bookings.rows, stats: stats.rows[0] }
}

export const actions = {
  updateStatus: async ({ request, cookies }) => {
    const session = cookies.get('session')
    if (!session) throw redirect(303, '/login')

    const user = JSON.parse(Buffer.from(session, 'base64').toString())
    if (user.role !== 'admin') throw redirect(303, '/')

    const data = await request.formData()
    const bookingId = data.get('bookingId')
    const status = data.get('status')

    await pool.query('UPDATE bookings SET status = $1 WHERE id = $2', [status, bookingId])
    throw redirect(303, '/admin')
  }
}
