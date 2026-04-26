import pg from 'pg'

const { Pool } = pg

const pool = new Pool({
  connectionString: 'postgresql://postgres:nXgPCQEyQPmCgaCtUyFoviqqfAxXJTRe@shuttle.proxy.rlwy.net:38618/railway',
  ssl: { rejectUnauthorized: false }
})

pool.connect((err, client, release) => {
  if (err) {
    console.error('❌ DB connection error:', err.message)
  } else {
    console.log('✅ Database connected!')
    release()
  }
})

export default pool
