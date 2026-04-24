<svelte:head><title>Family Party Catering — FeastDay</title></svelte:head>

<section class="hero">
  <div class="hero-inner">
    <div class="tag">👨‍👩‍👧‍👦 FAMILY PARTY CATERING</div>
    <h1>FOOD THAT BRINGS <span>FAMILIES TOGETHER</span></h1>
    <p>Reunions, anniversaries, christenings — hearty home-style food for everyone at the table.</p>
    <div class="btns">
      <a href="/packages?type=family" class="btn-primary">VIEW FAMILY PACKAGES</a>
      <a href="/register" class="btn-secondary">BOOK NOW</a>
    </div>
  </div>
  <div class="hero-emoji">👨‍👩‍👧‍👦</div>
</section>

<section class="occasions">
  <div class="inner">
    <h2>PERFECT FOR ANY FAMILY OCCASION</h2>
    <div class="occ-grid">
      <div class="occ"><div class="occ-icon">🏠</div><h3>Reunions</h3><p>Bring the whole family together with a spread everyone will love.</p></div>
      <div class="occ"><div class="occ-icon">🎊</div><h3>Anniversaries</h3><p>Celebrate your milestone with a meal as special as the occasion.</p></div>
      <div class="occ"><div class="occ-icon">👶</div><h3>Christenings</h3><p>Welcome the newest family member with a beautiful celebration.</p></div>
      <div class="occ"><div class="occ-icon">🎓</div><h3>Graduations</h3><p>Celebrate academic achievements with food the whole family enjoys.</p></div>
    </div>
  </div>
</section>

<section class="packages">
  <div class="inner">
    <h2>FAMILY PACKAGES</h2>
    <div class="grid">
      <div class="card">
        <div class="card-top red">
          <div class="price">£399</div>
          <div class="guests">Up to 50 guests</div>
        </div>
        <div class="card-body">
          <h3>Family Gathering Package</h3>
          <p>Hearty home-style cooking perfect for medium-sized family gatherings.</p>
          <ul>
            <li>✓ Buffet-style mains</li>
            <li>✓ Selection of sides</li>
            <li>✓ Dessert table</li>
            <li>✓ Soft drinks</li>
            <li>✓ Setup & cleanup</li>
          </ul>
          <a href="/packages/3" class="btn">VIEW & BOOK</a>
        </div>
      </div>

      <div class="card featured">
        <div class="badge">BEST FOR LARGE GROUPS</div>
        <div class="card-top dark">
          <div class="price">£749</div>
          <div class="guests">Up to 100 guests</div>
        </div>
        <div class="card-body">
          <h3>Grand Family Feast</h3>
          <p>A lavish buffet spread for large family occasions with hot and cold dishes.</p>
          <ul>
            <li>✓ Extended buffet menu</li>
            <li>✓ Hot & cold dishes</li>
            <li>✓ Dessert selection</li>
            <li>✓ Soft drinks & juice</li>
            <li>✓ Full setup & cleanup</li>
          </ul>
          <a href="/packages/4" class="btn">VIEW & BOOK</a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="why">
  <div class="inner">
    <h2>WHY FAMILIES LOVE US</h2>
    <div class="reasons">
      <div class="reason"><div class="r-icon">🥘</div><h3>HEARTY FOOD</h3><p>Home-style cooking that reminds everyone of grandma's kitchen.</p></div>
      <div class="reason"><div class="r-icon">👴</div><h3>ALL GENERATIONS</h3><p>Menus designed to satisfy everyone from toddlers to grandparents.</p></div>
      <div class="reason"><div class="r-icon">🥗</div><h3>DIETARY NEEDS</h3><p>We cater for vegetarian, vegan, gluten-free and all allergies.</p></div>
      <div class="reason"><div class="r-icon">💰</div><h3>GREAT VALUE</h3><p>Flexible packages to suit every family budget without compromise.</p></div>
    </div>
  </div>
</section>

<section class="cta">
  <h2>PLANNING A FAMILY GATHERING?</h2>
  <p>Let us take care of the food so you can enjoy the moment</p>
  <a href="/register" class="btn-primary">BOOK NOW</a>
</section>

<style>
  .hero { background: #e8f5e9; padding: 5rem 3rem; display: flex; justify-content: space-between; align-items: center; gap: 2rem; }
  .tag { background: #2e7d32; color: white; display: inline-block; padding: 0.3rem 1rem; border-radius: 20px; font-size: 0.8rem; font-weight: 700; letter-spacing: 1px; margin-bottom: 1.5rem; }
  .hero h1 { font-size: 4rem; line-height: 0.95; margin-bottom: 1.5rem; color: #111; }
  .hero h1 span { color: #2e7d32; }
  .hero p { color: #555; font-size: 1.1rem; margin-bottom: 2rem; line-height: 1.6; max-width: 500px; }
  .btns { display: flex; gap: 1rem; flex-wrap: wrap; }
  .hero-emoji { font-size: 10rem; }
  .btn-primary { background: #111; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-primary:hover { background: #2e7d32; }
  .btn-secondary { background: #2e7d32; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-secondary:hover { background: #1b5e20; }
  .inner { max-width: 1100px; margin: 0 auto; padding: 0 2rem; }
  .occasions { padding: 5rem 0; background: #111; }
  .occasions h2 { font-size: 2.5rem; color: white; text-align: center; margin-bottom: 2rem; }
  .occ-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; }
  .occ { background: #1e1e1e; border-radius: 12px; padding: 2rem; text-align: center; transition: background 0.2s; }
  .occ:hover { background: #2e7d32; }
  .occ-icon { font-size: 2.5rem; margin-bottom: 1rem; }
  .occ h3 { color: white; font-size: 1.2rem; margin-bottom: 0.5rem; }
  .occ p { color: #aaa; font-size: 0.85rem; line-height: 1.5; }
  .occ:hover p { color: rgba(255,255,255,0.8); }
  .packages { padding: 5rem 0; background: #f9f9f9; }
  .packages h2 { font-size: 2.5rem; margin-bottom: 2rem; text-align: center; }
  .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; }
  .card { background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.08); position: relative; }
  .card.featured { border: 3px solid #2e7d32; }
  .badge { position: absolute; top: 1rem; right: 1rem; background: #2e7d32; color: white; font-size: 0.7rem; font-weight: 700; padding: 0.3rem 0.7rem; border-radius: 20px; letter-spacing: 1px; }
  .card-top { padding: 2rem; text-align: center; }
  .card-top.red { background: #2e7d32; }
  .card-top.dark { background: #111; }
  .price { font-family: 'Bebas Neue', sans-serif; font-size: 3.5rem; color: white; line-height: 1; }
  .guests { color: rgba(255,255,255,0.7); font-size: 0.85rem; }
  .card-body { padding: 2rem; }
  .card-body h3 { font-size: 1.4rem; margin-bottom: 0.5rem; }
  .card-body p { color: #666; font-size: 0.9rem; margin-bottom: 1rem; line-height: 1.5; }
  .card-body ul { list-style: none; margin-bottom: 1.5rem; }
  .card-body li { padding: 0.4rem 0; font-size: 0.85rem; color: #444; border-bottom: 1px solid #f5f5f5; }
  .btn { background: #111; color: white; padding: 0.7rem 1.5rem; border-radius: 4px; font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn:hover { background: #2e7d32; }
  .why { padding: 5rem 0; background: white; }
  .why h2 { font-size: 2.5rem; text-align: center; margin-bottom: 2rem; }
  .reasons { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; }
  .reason { text-align: center; padding: 2rem; background: #f9f9f9; border-radius: 12px; }
  .r-icon { font-size: 2.5rem; margin-bottom: 1rem; }
  .reason h3 { font-size: 1.1rem; margin-bottom: 0.5rem; }
  .reason p { color: #666; font-size: 0.85rem; line-height: 1.5; }
  .cta { background: #111; color: white; padding: 5rem 2rem; text-align: center; }
  .cta h2 { font-size: 2.5rem; color: #2e7d32; margin-bottom: 0.5rem; }
  .cta p { color: #aaa; margin-bottom: 2rem; }
</style>
