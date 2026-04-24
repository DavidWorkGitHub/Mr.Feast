import pool from './db.js'

export async function createBooking(userId, packageId, eventDate, guestCount, notes) {
  const result = await pool.query(
    'INSERT INTO bookings (user_id, package_id, event_date, guest_count, notes) VALUES ($1, $2, $3, $4, $5) RETURNING *',
    [userId, packageId, eventDate, guestCount, notes]
  )
  return result.rows[0]
}

export async function getBookingsByUser(userId) {
  const result = await pool.query(
    `SELECT bookings.*, packages.name as package_name, packages.type, packages.price
     FROM bookings 
     JOIN packages ON bookings.package_id = packages.id
     WHERE bookings.user_id = $1
     ORDER BY bookings.created_at DESC`,
    [userId]
  )
  return result.rows
}

export async function getAllBookings() {
  const result = await pool.query(
    `SELECT bookings.*, packages.name as package_name, users.name as user_name, users.email
     FROM bookings
     JOIN packages ON bookings.package_id = packages.id
     JOIN users ON bookings.user_id = users.id
     ORDER BY bookings.created_at DESC`
  )
  return result.rows
}

export async function updateBookingStatus(id, status) {
  const result = await pool.query(
    'UPDATE bookings SET status = $1 WHERE id = $2 RETURNING *',
    [status, id]
  )
  return result.rows[0]
}