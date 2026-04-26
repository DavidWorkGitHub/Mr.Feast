import pg from 'pg'
const { Pool } = pg

const connectionString = process.env.DATABASE_URL

console.log('Connecting to:', connectionString ? connectionString.replace(/:([^:@]+)@/, ':****@') : 'NO URL FOUND')

const pool = new Pool({
  connectionString,
  ssl: { rejectUnauthorized: false }
})

pool.connect((err, client, release) => {
  if (err) console.error('❌ DB connection error:', err.message)
  else { console.log('✅ Database connected!'); release() }
})

export default pool
