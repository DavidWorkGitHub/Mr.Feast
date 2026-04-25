<script>
  let { form } = $props()
</script>

<svelte:head><title>Login — FeastDay Catering</title></svelte:head>

<section class="page">
  <div class="box">
    <div class="logo">🎉</div>
    <h1>WELCOME BACK</h1>
    <p>Login to manage your bookings</p>

    {#if form?.error}
      <div class="error">{form.error}</div>
    {/if}

    <form method="POST">
      <div class="field">
        <label for="email">EMAIL ADDRESS</label>
        <input type="email" id="email" name="email" placeholder="you@example.com" required />
      </div>
      <div class="field">
        <label for="password">PASSWORD</label>
        <input type="password" id="password" name="password" placeholder="Your password" required />
      </div>
      <button type="submit" class="btn-submit">LOGIN</button>
    </form>

    <p class="switch">Don't have an account? <a href="/register">Register here</a></p>
  </div>
</section>

<style>
  .page { min-height: 80vh; display: flex; align-items: center; justify-content: center; background: #f9f9f9; padding: 2rem; }
  .box { background: white; border-radius: 16px; padding: 3rem; width: 100%; max-width: 420px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); text-align: center; }
  .logo { font-size: 3rem; margin-bottom: 1rem; }
  .box h1 { font-size: 2rem; margin-bottom: 0.5rem; }
  .box > p { color: #888; font-size: 0.95rem; margin-bottom: 2rem; }
  .error { background: #fce4e4; color: #e63946; padding: 0.8rem; border-radius: 8px; font-size: 0.9rem; margin-bottom: 1rem; }
  form { text-align: left; }
  .field { margin-bottom: 1.2rem; }
  label { display: block; font-size: 0.75rem; font-weight: 700; letter-spacing: 1px; color: #333; margin-bottom: 0.4rem; }
  input { width: 100%; padding: 0.8rem 1rem; border: 2px solid #f0f0f0; border-radius: 8px; font-size: 0.95rem; font-family: 'Inter', sans-serif; transition: border-color 0.2s; outline: none; }
  input:focus { border-color: #e63946; }
  .btn-submit { width: 100%; background: #111; color: white; border: none; padding: 1rem; border-radius: 8px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; cursor: pointer; transition: background 0.2s; font-family: 'Inter', sans-serif; margin-top: 0.5rem; }
  .btn-submit:hover { background: #e63946; }
  .switch { margin-top: 1.5rem; color: #888; font-size: 0.9rem; }
  .switch a { color: #e63946; font-weight: 700; }
</style>
