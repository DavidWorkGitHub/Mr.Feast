import pg from 'pg'
const { Pool } = pg

const pool = new Pool({
  host: 'localhost',
  port: 5432,
  database: 'feastday',
  user: 'postgres',
  password: ''
})

pool.connect((err, client, release) => {
  if (err) console.error('❌ DB connection error:', err.message)
  else { console.log('✅ Database connected!'); release() }
})

export default pool
