import pool from './db.js'
import bcrypt from 'bcryptjs'
 
export async function getUserByEmail(email) {
  const result = await pool.query('SELECT * FROM users WHERE email = $1', [email])
  return result.rows[0]
}
 
export async function createUser(name, email, password) {
  const hashed = await bcrypt.hash(password, 10)
  const result = await pool.query(
    'INSERT INTO users (name, email, password, role) VALUES ($1, $2, $3, $4) RETURNING *',
    [name, email, hashed, 'customer']
  )
  return result.rows[0]
}
 
export async function verifyPassword(plainPassword, hashedPassword) {
  return bcrypt.compare(plainPassword, hashedPassword)
}
 