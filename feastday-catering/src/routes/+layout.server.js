export async function load({ cookies }) {
  const session = cookies.get('session')
  if (!session) return { user: null }

  try {
    const user = JSON.parse(Buffer.from(session, 'base64').toString())
    return { user }
  } catch {
    return { user: null }
  }
}
