import pg from 'pg'
const { Pool } = pg

const pool = new Pool(
  process.env.DATABASE_URL
    ? {
        connectionString: process.env.DATABASE_URL,
        ssl: { rejectUnauthorized: false }
      }
    : {
        host: 'localhost',
        port: 5432,
        database: 'feastday',
        user: 'postgres',
        password: 'feastday123'
      }
)

pool.connect((err, client, release) => {
  if (err) console.error('❌ DB connection error:', err.message)
  else { console.log('✅ Database connected!'); release() }
})

export default pool
