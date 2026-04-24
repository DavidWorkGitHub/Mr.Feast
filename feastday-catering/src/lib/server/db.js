import pg from 'pg'
 
const { Pool } = pg
 
const pool = new Pool({
  host: 'localhost',
  port: 5432,
  database: 'feastday',
  user: 'postgres',
  password: 'MrBeast6000'
})
 
// Test the connection on startup
pool.connect((err, client, release) => {
  if (err) {
    console.error('❌ Database connection error:', err.message)
  } else {
    console.log('✅ Database connected successfully!')
    release()
  }
})
 
export default pool