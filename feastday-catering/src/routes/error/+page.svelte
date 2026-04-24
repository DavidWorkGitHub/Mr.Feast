<script>
  import { page } from '$app/stores'
</script>

<svelte:head>
  <title>404 — FeastDay Catering</title>
</svelte:head>

<section class="error-page">
  <div class="error-inner">
    <div class="error-emoji">🍽️</div>
    <h1>404</h1>
    <h2>PAGE NOT FOUND</h2>
    <p>Looks like this page went missing — just like the last slice of cake.</p>
    <div class="btns">
      <a href="/" class="btn-primary">GO HOME</a>
      <a href="/packages" class="btn-secondary">VIEW PACKAGES</a>
    </div>
  </div>
</section>

<style>
  .error-page { min-height: 80vh; display: flex; align-items: center; justify-content: center; background: #f9f9f9; text-align: center; padding: 2rem; }
  .error-inner { max-width: 500px; }
  .error-emoji { font-size: 5rem; margin-bottom: 1rem; }
  h1 { font-family: 'Bebas Neue', sans-serif; font-size: 8rem; color: #e63946; line-height: 1; margin-bottom: 0; }
  h2 { font-size: 2rem; margin-bottom: 1rem; color: #111; }
  p { color: #888; font-size: 1rem; margin-bottom: 2rem; line-height: 1.6; }
  .btns { display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; }
  .btn-primary { background: #111; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-primary:hover { background: #e63946; }
  .btn-secondary { background: #e63946; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-secondary:hover { background: #c1121f; }
</style>
