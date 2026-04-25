import pool from '$lib/server/db.js'
import { json } from '@sveltejs/kit'

export async function GET() {
  try {
    const result = await pool.query('SELECT * FROM packages ORDER BY type, price')
    return json(result.rows)
  } catch {
    return json({ error: 'Failed to fetch packages' }, { status: 500 })
  }
}
