import { redirect } from '@sveltejs/kit'
import pool from '$lib/server/db.js'

export async function load({ cookies }) {
  const session = cookies.get('session')
  if (!session) throw redirect(303, '/login')

  const user = JSON.parse(Buffer.from(session, 'base64').toString())

  const result = await pool.query(
    `SELECT bookings.*, packages.name as package_name, packages.price, packages.type
     FROM bookings
     JOIN packages ON bookings.package_id = packages.id
     WHERE bookings.user_id = $1
     ORDER BY bookings.created_at DESC`,
    [user.id]
  )

  return { user, bookings: result.rows }
}
