<script>
  let name = $state('')
  let email = $state('')
  let password = $state('')
  let confirm = $state('')
  let error = $state('')
  let loading = $state(false)

  async function handleSubmit() {
    if (password !== confirm) { error = 'Passwords do not match'; return }
    if (password.length < 6) { error = 'Password must be at least 6 characters'; return }
    loading = true
    error = ''
    const res = await fetch('/register', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, email, password })
    })
    if (res.ok) {
      window.location.href = '/'
    } else {
      const data = await res.json()
      error = data.message || 'Registration failed'
    }
    loading = false
  }
</script>

<svelte:head><title>Register — FeastDay Catering</title></svelte:head>

<section class="page">
  <div class="box">
    <div class="logo">🎉</div>
    <h1>CREATE ACCOUNT</h1>
    <p>Register to book your event</p>

    {#if error}
      <div class="error">{error}</div>
    {/if}

    <div class="form">
      <div class="field">
        <label>FULL NAME</label>
        <input type="text" bind:value={name} placeholder="Your full name" />
      </div>
      <div class="field">
        <label>EMAIL ADDRESS</label>
        <input type="email" bind:value={email} placeholder="you@example.com" />
      </div>
      <div class="field">
        <label>PASSWORD</label>
        <input type="password" bind:value={password} placeholder="Min. 6 characters" />
      </div>
      <div class="field">
        <label>CONFIRM PASSWORD</label>
        <input type="password" bind:value={confirm} placeholder="Repeat your password" />
      </div>
      <button onclick={handleSubmit} disabled={loading} class="btn-submit">
        {loading ? 'CREATING ACCOUNT...' : 'CREATE ACCOUNT'}
      </button>
    </div>

    <p class="switch">Already have an account? <a href="/login">Login here</a></p>
  </div>
</section>

<style>
  .page { min-height: 80vh; display: flex; align-items: center; justify-content: center; background: #f9f9f9; padding: 2rem; }
  .box { background: white; border-radius: 16px; padding: 3rem; width: 100%; max-width: 420px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); text-align: center; }
  .logo { font-size: 3rem; margin-bottom: 1rem; }
  .box h1 { font-size: 2rem; margin-bottom: 0.5rem; }
  .box > p { color: #888; font-size: 0.95rem; margin-bottom: 2rem; }
  .error { background: #fce4e4; color: #e63946; padding: 0.8rem; border-radius: 8px; font-size: 0.9rem; margin-bottom: 1rem; }
  .form { text-align: left; }
  .field { margin-bottom: 1.2rem; }
  label { display: block; font-size: 0.75rem; font-weight: 700; letter-spacing: 1px; color: #333; margin-bottom: 0.4rem; }
  input { width: 100%; padding: 0.8rem 1rem; border: 2px solid #f0f0f0; border-radius: 8px; font-size: 0.95rem; font-family: 'Inter', sans-serif; transition: border-color 0.2s; outline: none; }
  input:focus { border-color: #e63946; }
  .btn-submit { width: 100%; background: #111; color: white; border: none; padding: 1rem; border-radius: 8px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; cursor: pointer; transition: background 0.2s; font-family: 'Inter', sans-serif; margin-top: 0.5rem; }
  .btn-submit:hover { background: #e63946; }
  .btn-submit:disabled { opacity: 0.6; cursor: not-allowed; }
  .switch { margin-top: 1.5rem; color: #888; font-size: 0.9rem; }
  .switch a { color: #e63946; font-weight: 700; }
</style>
