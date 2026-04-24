import pool from './db.js'

export async function getAllPackages() {
  const result = await pool.query('SELECT * FROM packages ORDER BY type, price')
  return result.rows
}

export async function getPackageById(id) {
  const result = await pool.query('SELECT * FROM packages WHERE id = $1', [id])
  return result.rows[0]
}

export async function getPackagesByType(type) {
  const result = await pool.query('SELECT * FROM packages WHERE type = $1', [type])
  return result.rows
}