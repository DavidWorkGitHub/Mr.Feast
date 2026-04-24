<svelte:head><title>Wedding Catering — FeastDay</title></svelte:head>

<section class="hero">
  <div class="hero-inner">
    <div class="tag">💍 WEDDING CATERING</div>
    <h1>YOUR PERFECT DAY <span>DESERVES PERFECT FOOD</span></h1>
    <p>Elegant menus, flawless service and stunning cakes — we make your wedding day truly unforgettable.</p>
    <div class="btns">
      <a href="/packages?type=wedding" class="btn-primary">VIEW WEDDING PACKAGES</a>
      <a href="/register" class="btn-secondary">ENQUIRE NOW</a>
    </div>
  </div>
  <div class="hero-emoji">💍</div>
</section>

<section class="experience">
  <div class="inner">
    <h2>THE FEASTDAY WEDDING EXPERIENCE</h2>
    <div class="steps">
      <div class="step"><div class="step-num">01</div><h3>CONSULTATION</h3><p>We meet with you to understand your vision, preferences and dietary requirements.</p></div>
      <div class="step"><div class="step-num">02</div><h3>MENU DESIGN</h3><p>Our chef creates a bespoke menu tailored perfectly to your taste and style.</p></div>
      <div class="step"><div class="step-num">03</div><h3>TASTING</h3><p>You come in for a private tasting session to approve every dish before the big day.</p></div>
      <div class="step"><div class="step-num">04</div><h3>YOUR BIG DAY</h3><p>We arrive early, set up perfectly and deliver flawless service throughout.</p></div>
    </div>
  </div>
</section>

<section class="packages">
  <div class="inner">
    <h2>WEDDING PACKAGES</h2>
    <div class="grid">
      <div class="card">
        <div class="card-top gold">
          <div class="price">£2,499</div>
          <div class="guests">Up to 100 guests</div>
        </div>
        <div class="card-body">
          <h3>Elegant Wedding Reception</h3>
          <p>A sophisticated wedding catering experience with a refined 4-course dinner.</p>
          <ul>
            <li>✓ 4-course sit-down dinner</li>
            <li>✓ Wine & drinks service</li>
            <li>✓ Wedding cake</li>
            <li>✓ Dedicated staff</li>
            <li>✓ Full setup & cleanup</li>
          </ul>
          <a href="/packages/5" class="btn">VIEW & BOOK</a>
        </div>
      </div>

      <div class="card featured">
        <div class="badge">ULTIMATE PACKAGE</div>
        <div class="card-top dark">
          <div class="price">£4,999</div>
          <div class="guests">Up to 200 guests</div>
        </div>
        <div class="card-body">
          <h3>Luxury Wedding Experience</h3>
          <p>The ultimate wedding catering — completely bespoke, utterly unforgettable.</p>
          <ul>
            <li>✓ Bespoke custom menu</li>
            <li>✓ Champagne reception</li>
            <li>✓ Full table service</li>
            <li>✓ Tiered wedding cake</li>
            <li>✓ Premium setup & cleanup</li>
          </ul>
          <a href="/packages/6" class="btn">VIEW & BOOK</a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="testimonials">
  <div class="inner">
    <h2>HAPPY COUPLES</h2>
    <div class="reviews">
      <div class="review">
        <div class="stars">⭐⭐⭐⭐⭐</div>
        <p>"FeastDay made our wedding day absolutely perfect. The food was incredible and the staff were so professional. Every single guest complimented the meal."</p>
        <div class="couple">— Emma & James, June 2025</div>
      </div>
      <div class="review">
        <div class="stars">⭐⭐⭐⭐⭐</div>
        <p>"We chose the Luxury package and it was worth every penny. The champagne reception was stunning and the wedding cake was a work of art."</p>
        <div class="couple">— Sophie & Daniel, August 2025</div>
      </div>
      <div class="review">
        <div class="stars">⭐⭐⭐⭐⭐</div>
        <p>"From the first consultation to the last bite, FeastDay were outstanding. They handled everything so we could just enjoy our special day."</p>
        <div class="couple">— Maria & Tom, September 2025</div>
      </div>
    </div>
  </div>
</section>

<section class="cta">
  <h2>START PLANNING YOUR DREAM WEDDING</h2>
  <p>Get in touch today for a free consultation</p>
  <div class="btns">
    <a href="/register" class="btn-primary">ENQUIRE NOW</a>
    <a href="/packages?type=wedding" class="btn-outline">VIEW PACKAGES</a>
  </div>
</section>

<style>
  .hero { background: #f3e5f5; padding: 5rem 3rem; display: flex; justify-content: space-between; align-items: center; gap: 2rem; }
  .tag { background: #6a1b9a; color: white; display: inline-block; padding: 0.3rem 1rem; border-radius: 20px; font-size: 0.8rem; font-weight: 700; letter-spacing: 1px; margin-bottom: 1.5rem; }
  .hero h1 { font-size: 3.5rem; line-height: 0.95; margin-bottom: 1.5rem; color: #111; }
  .hero h1 span { color: #6a1b9a; }
  .hero p { color: #555; font-size: 1.1rem; margin-bottom: 2rem; line-height: 1.6; max-width: 500px; }
  .btns { display: flex; gap: 1rem; flex-wrap: wrap; }
  .hero-emoji { font-size: 10rem; }
  .btn-primary { background: #111; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-primary:hover { background: #6a1b9a; }
  .btn-secondary { background: #6a1b9a; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-secondary:hover { background: #4a148c; }
  .btn-outline { background: transparent; color: white; border: 2px solid white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: all 0.2s; }
  .btn-outline:hover { background: white; color: #111; }
  .inner { max-width: 1100px; margin: 0 auto; padding: 0 2rem; }
  .experience { padding: 5rem 0; background: #111; }
  .experience h2 { font-size: 2.5rem; color: white; text-align: center; margin-bottom: 3rem; }
  .steps { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 2rem; }
  .step { text-align: center; }
  .step-num { font-family: 'Bebas Neue', sans-serif; font-size: 4rem; color: #6a1b9a; line-height: 1; margin-bottom: 0.5rem; }
  .step h3 { color: white; font-size: 1.1rem; margin-bottom: 0.5rem; }
  .step p { color: #aaa; font-size: 0.85rem; line-height: 1.5; }
  .packages { padding: 5rem 0; background: #f9f9f9; }
  .packages h2 { font-size: 2.5rem; margin-bottom: 2rem; text-align: center; }
  .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; }
  .card { background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.08); position: relative; }
  .card.featured { border: 3px solid #6a1b9a; }
  .badge { position: absolute; top: 1rem; right: 1rem; background: #6a1b9a; color: white; font-size: 0.7rem; font-weight: 700; padding: 0.3rem 0.7rem; border-radius: 20px; letter-spacing: 1px; }
  .card-top { padding: 2rem; text-align: center; }
  .card-top.gold { background: linear-gradient(135deg, #6a1b9a, #9c27b0); }
  .card-top.dark { background: #111; }
  .price { font-family: 'Bebas Neue', sans-serif; font-size: 3.5rem; color: white; line-height: 1; }
  .guests { color: rgba(255,255,255,0.7); font-size: 0.85rem; }
  .card-body { padding: 2rem; }
  .card-body h3 { font-size: 1.4rem; margin-bottom: 0.5rem; }
  .card-body p { color: #666; font-size: 0.9rem; margin-bottom: 1rem; line-height: 1.5; }
  .card-body ul { list-style: none; margin-bottom: 1.5rem; }
  .card-body li { padding: 0.4rem 0; font-size: 0.85rem; color: #444; border-bottom: 1px solid #f5f5f5; }
  .btn { background: #111; color: white; padding: 0.7rem 1.5rem; border-radius: 4px; font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn:hover { background: #6a1b9a; }
  .testimonials { padding: 5rem 0; background: white; }
  .testimonials h2 { font-size: 2.5rem; text-align: center; margin-bottom: 2rem; }
  .reviews { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; }
  .review { background: #f9f9f9; border-radius: 12px; padding: 2rem; border-left: 4px solid #6a1b9a; }
  .stars { font-size: 1.2rem; margin-bottom: 1rem; }
  .review p { color: #555; font-size: 0.9rem; line-height: 1.6; margin-bottom: 1rem; font-style: italic; }
  .couple { font-size: 0.85rem; font-weight: 700; color: #6a1b9a; }
  .cta { background: #111; color: white; padding: 5rem 2rem; text-align: center; }
  .cta h2 { font-size: 2.5rem; color: #6a1b9a; margin-bottom: 0.5rem; }
  .cta p { color: #aaa; margin-bottom: 2rem; }
  .cta .btns { justify-content: center; }
</style>
