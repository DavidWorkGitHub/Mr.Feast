<svelte:head><title>Birthday Catering — FeastDay</title></svelte:head>

<section class="hero">
  <div class="hero-inner">
    <div class="tag">🎂 BIRTHDAY CATERING</div>
    <h1>MAKE THEIR DAY <span>UNFORGETTABLE</span></h1>
    <p>From kids parties to milestone celebrations — we bring the food, you enjoy the fun.</p>
    <div class="btns">
      <a href="/packages?type=birthday" class="btn-primary">VIEW BIRTHDAY PACKAGES</a>
      <a href="/register" class="btn-secondary">BOOK NOW</a>
    </div>
  </div>
  <div class="hero-emoji">🎂</div>
</section>

<section class="packages">
  <div class="inner">
    <h2>BIRTHDAY PACKAGES</h2>
    <div class="grid">
      <div class="card">
        <div class="card-top red">
          <div class="price">£299</div>
          <div class="guests">Up to 30 guests</div>
        </div>
        <div class="card-body">
          <h3>Classic Birthday Bash</h3>
          <p>Fun finger foods, birthday cake and soft drinks. Perfect for all ages and budgets.</p>
          <ul>
            <li>✓ Finger food buffet</li>
            <li>✓ Birthday cake</li>
            <li>✓ Soft drinks</li>
            <li>✓ Paper plates & napkins</li>
            <li>✓ Setup & cleanup</li>
          </ul>
          <a href="/packages/1" class="btn">VIEW & BOOK</a>
        </div>
      </div>

      <div class="card featured">
        <div class="badge">MOST POPULAR</div>
        <div class="card-top dark">
          <div class="price">£599</div>
          <div class="guests">Up to 60 guests</div>
        </div>
        <div class="card-body">
          <h3>Premium Birthday Celebration</h3>
          <p>A full 3-course sit-down meal with dedicated servers and a stunning custom cake.</p>
          <ul>
            <li>✓ 3-course sit-down meal</li>
            <li>✓ Custom birthday cake</li>
            <li>✓ Dedicated servers</li>
            <li>✓ Table decorations</li>
            <li>✓ Setup & cleanup</li>
          </ul>
          <a href="/packages/2" class="btn">VIEW & BOOK</a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="why">
  <div class="inner">
    <h2>WHY CHOOSE US FOR BIRTHDAYS?</h2>
    <div class="reasons">
      <div class="reason"><div class="r-icon">🎈</div><h3>ALL AGES</h3><p>From first birthdays to 100th — we cater for every milestone.</p></div>
      <div class="reason"><div class="r-icon">🍰</div><h3>CUSTOM CAKES</h3><p>Our pastry chef creates stunning custom cakes for every occasion.</p></div>
      <div class="reason"><div class="r-icon">😌</div><h3>STRESS FREE</h3><p>We handle setup and cleanup so you can enjoy every moment.</p></div>
      <div class="reason"><div class="r-icon">🥗</div><h3>DIETARY NEEDS</h3><p>Vegetarian, vegan, gluten-free — we cater for everyone.</p></div>
    </div>
  </div>
</section>

<section class="cta">
  <h2>READY TO PLAN THE PERFECT BIRTHDAY?</h2>
  <p>Get in touch today and we'll make it happen</p>
  <a href="/register" class="btn-primary">BOOK NOW</a>
</section>

<style>
  .hero { background: #fce4e4; padding: 5rem 3rem; display: flex; justify-content: space-between; align-items: center; gap: 2rem; }
  .tag { background: #e63946; color: white; display: inline-block; padding: 0.3rem 1rem; border-radius: 20px; font-size: 0.8rem; font-weight: 700; letter-spacing: 1px; margin-bottom: 1.5rem; }
  .hero h1 { font-size: 4.5rem; line-height: 0.95; margin-bottom: 1.5rem; color: #111; }
  .hero h1 span { color: #e63946; }
  .hero p { color: #555; font-size: 1.1rem; margin-bottom: 2rem; line-height: 1.6; max-width: 500px; }
  .btns { display: flex; gap: 1rem; flex-wrap: wrap; }
  .hero-emoji { font-size: 10rem; }
  .btn-primary { background: #111; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-primary:hover { background: #e63946; }
  .btn-secondary { background: #e63946; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-secondary:hover { background: #c1121f; }
  .inner { max-width: 1100px; margin: 0 auto; padding: 0 2rem; }
  .packages { padding: 5rem 0; background: #f9f9f9; }
  .packages h2 { font-size: 2.5rem; margin-bottom: 2rem; text-align: center; }
  .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; }
  .card { background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.08); position: relative; }
  .card.featured { border: 3px solid #e63946; }
  .badge { position: absolute; top: 1rem; right: 1rem; background: #e63946; color: white; font-size: 0.7rem; font-weight: 700; padding: 0.3rem 0.7rem; border-radius: 20px; letter-spacing: 1px; }
  .card-top { padding: 2rem; text-align: center; }
  .card-top.red { background: #e63946; }
  .card-top.dark { background: #111; }
  .price { font-family: 'Bebas Neue', sans-serif; font-size: 3.5rem; color: white; line-height: 1; }
  .guests { color: rgba(255,255,255,0.7); font-size: 0.85rem; }
  .card-body { padding: 2rem; }
  .card-body h3 { font-size: 1.4rem; margin-bottom: 0.5rem; }
  .card-body p { color: #666; font-size: 0.9rem; margin-bottom: 1rem; line-height: 1.5; }
  .card-body ul { list-style: none; margin-bottom: 1.5rem; }
  .card-body li { padding: 0.4rem 0; font-size: 0.85rem; color: #444; border-bottom: 1px solid #f5f5f5; }
  .btn { background: #111; color: white; padding: 0.7rem 1.5rem; border-radius: 4px; font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn:hover { background: #e63946; }
  .why { padding: 5rem 0; background: white; }
  .why h2 { font-size: 2.5rem; text-align: center; margin-bottom: 2rem; }
  .reasons { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; }
  .reason { text-align: center; padding: 2rem; background: #f9f9f9; border-radius: 12px; }
  .r-icon { font-size: 2.5rem; margin-bottom: 1rem; }
  .reason h3 { font-size: 1.1rem; margin-bottom: 0.5rem; }
  .reason p { color: #666; font-size: 0.85rem; line-height: 1.5; }
  .cta { background: #111; color: white; padding: 5rem 2rem; text-align: center; }
  .cta h2 { font-size: 2.5rem; color: #e63946; margin-bottom: 0.5rem; }
  .cta p { color: #aaa; margin-bottom: 2rem; }
</style>
