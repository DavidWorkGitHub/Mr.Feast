<svelte:head><title>About — FeastDay Catering</title></svelte:head>

<section class="hero">
  <h1>ABOUT FEASTDAY</h1>
  <p>Feeding families and celebrating love since 2015</p>
</section>

<section class="story">
  <div class="inner">
    <div class="story-text">
      <h2>OUR STORY</h2>
      <p>FeastDay Catering was founded in 2015 by Chef Maria and James Donovan after years of catering private events across the city. What started as a small family operation has grown into one of the most trusted catering companies in the region.</p>
      <p>We believe that great food brings people together. Whether it's a child's first birthday, a family reunion, or the most important day of your life — we treat every event with the same passion and attention to detail.</p>
      <p>Every dish we serve is made with fresh, locally sourced ingredients. We work closely with local farmers and suppliers to ensure quality in every bite.</p>
    </div>
    <div class="story-image">
      <div class="img-placeholder">👨‍🍳</div>
    </div>
  </div>
</section>

<section class="stats">
  <div class="inner">
    <div class="stat"><div class="num">500+</div><div class="label">Events Catered</div></div>
    <div class="stat"><div class="num">12+</div><div class="label">Years Experience</div></div>
    <div class="stat"><div class="num">98%</div><div class="label">Happy Customers</div></div>
    <div class="stat"><div class="num">15</div><div class="label">Team Members</div></div>
  </div>
</section>

<section class="team">
  <div class="inner">
    <h2>MEET THE TEAM</h2>
    <div class="team-grid">
      <div class="member">
        <div class="avatar">👩‍🍳</div>
        <h3>Maria Donovan</h3>
        <div class="role">Head Chef & Co-founder</div>
        <p>15 years of culinary experience. Trained in Paris, passionate about fresh local ingredients.</p>
      </div>
      <div class="member">
        <div class="avatar">👨‍💼</div>
        <h3>James Donovan</h3>
        <div class="role">Operations & Co-founder</div>
        <p>Ensures every event runs perfectly from setup to cleanup. Your stress-free guarantee.</p>
      </div>
      <div class="member">
        <div class="avatar">👩‍🎂</div>
        <h3>Sophie Clarke</h3>
        <div class="role">Pastry Chef</div>
        <p>Award-winning cake designer. Creates stunning custom cakes for every occasion.</p>
      </div>
    </div>
  </div>
</section>

<section class="values">
  <div class="inner">
    <h2>OUR VALUES</h2>
    <div class="values-grid">
      <div class="value"><div class="v-icon">🌱</div><h3>FRESH & LOCAL</h3><p>We source all ingredients from local farms and suppliers within 50 miles.</p></div>
      <div class="value"><div class="v-icon">❤️</div><h3>PASSION</h3><p>Every dish is made with care. We treat your event like our own celebration.</p></div>
      <div class="value"><div class="v-icon">✨</div><h3>QUALITY</h3><p>No shortcuts. Premium ingredients, expert preparation, perfect presentation.</p></div>
      <div class="value"><div class="v-icon">🤝</div><h3>RELIABILITY</h3><p>We show up on time, every time. Your event is always our top priority.</p></div>
    </div>
  </div>
</section>

<section class="cta">
  <h2>READY TO WORK WITH US?</h2>
  <p>Browse our packages and book your event today</p>
  <div class="cta-btns">
    <a href="/packages" class="btn-primary">VIEW PACKAGES</a>
    <a href="/register" class="btn-secondary">REGISTER NOW</a>
  </div>
</section>

<style>
  .hero { background: #111; color: white; padding: 4rem 3rem; text-align: center; }
  .hero h1 { font-size: 4rem; color: #e63946; margin-bottom: 0.5rem; }
  .hero p { color: #aaa; font-size: 1.1rem; }
  .inner { max-width: 1200px; margin: 0 auto; padding: 0 2rem; }
  .story { padding: 5rem 0; background: white; }
  .story .inner { display: grid; grid-template-columns: 1fr 1fr; gap: 4rem; align-items: center; }
  .story h2 { font-size: 2.5rem; margin-bottom: 1.5rem; }
  .story-text p { color: #555; line-height: 1.8; margin-bottom: 1rem; }
  .img-placeholder { width: 300px; height: 300px; background: #fce4e4; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 7rem; margin: 0 auto; }
  .stats { background: #e63946; padding: 3rem 0; }
  .stats .inner { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1rem; text-align: center; }
  .stat .num { font-family: 'Bebas Neue', sans-serif; font-size: 3.5rem; color: white; }
  .stat .label { color: rgba(255,255,255,0.8); font-size: 0.9rem; font-weight: 600; }
  .team { padding: 5rem 0; background: #f9f9f9; }
  .team h2 { font-size: 2.5rem; margin-bottom: 2rem; text-align: center; }
  .team-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; }
  .member { background: white; border-radius: 12px; padding: 2rem; text-align: center; box-shadow: 0 2px 12px rgba(0,0,0,0.06); }
  .avatar { font-size: 4rem; margin-bottom: 1rem; }
  .member h3 { font-size: 1.3rem; margin-bottom: 0.3rem; }
  .role { color: #e63946; font-size: 0.85rem; font-weight: 700; letter-spacing: 1px; margin-bottom: 1rem; }
  .member p { color: #666; font-size: 0.9rem; line-height: 1.5; }
  .values { padding: 5rem 0; background: white; }
  .values h2 { font-size: 2.5rem; margin-bottom: 2rem; text-align: center; }
  .values-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.5rem; }
  .value { background: #f9f9f9; border-radius: 12px; padding: 2rem; text-align: center; }
  .v-icon { font-size: 2.5rem; margin-bottom: 1rem; }
  .value h3 { font-size: 1.1rem; margin-bottom: 0.5rem; }
  .value p { color: #666; font-size: 0.85rem; line-height: 1.5; }
  .cta { background: #111; color: white; padding: 5rem 2rem; text-align: center; }
  .cta h2 { font-size: 3rem; color: #e63946; margin-bottom: 0.5rem; }
  .cta p { color: #aaa; margin-bottom: 2rem; }
  .cta-btns { display: flex; gap: 1rem; justify-content: center; }
  .btn-primary { background: white; color: #111; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-primary:hover { background: #e63946; color: white; }
  .btn-secondary { background: #e63946; color: white; padding: 0.9rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn-secondary:hover { background: #c1121f; }
</style>
