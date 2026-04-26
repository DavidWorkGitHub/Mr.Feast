<script>
  let { children, data } = $props()
</script>

<svelte:head>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
</svelte:head>

<nav>
  <div class="nav-brand">
    <a href="/">FEASTDAY<span>CATERING</span></a>
  </div>
  <div class="nav-links">
    <a href="/">HOME</a>
    <a href="/packages">MENU</a>
    <a href="/about">ABOUT</a>
    {#if data?.user}
      <a href="/bookings">MY BOOKINGS</a>
      {#if data.user.role === 'admin'}
        <a href="/admin">ADMIN</a>
      {/if}
      <form method="POST" action="/logout">
        <button type="submit" class="btn-nav">LOGOUT</button>
      </form>
    {:else}
      <a href="/login">LOGIN</a>
      <a href="/register" class="btn-nav">BOOK NOW</a>
    {/if}
  </div>
</nav>

<main>
  {@render children()}
</main>

<footer>
  <div class="footer-inner">
    <div class="footer-brand">FEASTDAY CATERING</div>
    <div class="footer-links">
      <a href="/packages">Packages</a>
      <a href="/about">About</a>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    </div>
    <p>© 2026 FeastDay Catering · Birthdays · Family Parties · Weddings</p>
  </div>
</footer>

<style>
  :global(*) { margin: 0; padding: 0; box-sizing: border-box; }
  :global(body) { font-family: 'Inter', sans-serif; background: #fff; color: #111; }
  :global(a) { text-decoration: none; color: inherit; }
  :global(h1, h2, h3) { font-family: 'Bebas Neue', sans-serif; letter-spacing: 1px; }
  nav { background: #fff; padding: 1rem 3rem; display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #111; position: sticky; top: 0; z-index: 100; }
  .nav-brand a { font-family: 'Bebas Neue', sans-serif; font-size: 1.8rem; color: #e63946; letter-spacing: 2px; }
  .nav-brand span { color: #111; margin-left: 4px; }
  .nav-links { display: flex; gap: 2rem; align-items: center; }
  .nav-links a { font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; color: #111; transition: color 0.2s; }
  .nav-links a:hover { color: #e63946; }
  .btn-nav { background: #111; color: white !important; padding: 0.6rem 1.4rem; border-radius: 4px; transition: background 0.2s !important; border: none; font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; cursor: pointer; font-family: 'Inter', sans-serif; }
  .btn-nav:hover { background: #e63946 !important; }
  form { margin: 0; padding: 0; }
  main { min-height: calc(100vh - 120px); }
  footer { background: #111; color: #fff; padding: 2rem 3rem; }
  .footer-inner { max-width: 1200px; margin: 0 auto; display: flex; flex-direction: column; gap: 1rem; align-items: center; text-align: center; }
  .footer-brand { font-family: 'Bebas Neue', sans-serif; font-size: 1.5rem; color: #e63946; letter-spacing: 2px; }
  .footer-links { display: flex; gap: 2rem; }
  .footer-links a { color: #aaa; font-size: 0.9rem; transition: color 0.2s; }
  .footer-links a:hover { color: white; }
  footer p { color: #666; font-size: 0.85rem; }
</style>
