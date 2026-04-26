import pg from 'pg'
const { Pool } = pg

console.log('DATABASE_URL exists:', !!process.env.DATABASE_URL)

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.DATABASE_URL ? { rejectUnauthorized: false } : false
})

pool.connect((err, client, release) => {
  if (err) console.error('❌ DB connection error:', err.message)
  else { console.log('✅ Database connected!'); release() }
})

export default pool
