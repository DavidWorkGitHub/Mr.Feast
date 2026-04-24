<script>
  let { data } = $props()

  const packages = [
    { id: 1, name: 'Classic Birthday Bash', type: 'birthday', price: 299, maxGuests: 30, description: 'Fun finger foods, birthday cake and soft drinks. Perfect for all ages.' },
    { id: 2, name: 'Premium Birthday Celebration', type: 'birthday', price: 599, maxGuests: 60, description: 'A 3-course meal with dedicated servers and a custom cake.' },
    { id: 3, name: 'Family Gathering Package', type: 'family', price: 399, maxGuests: 50, description: 'Hearty home-style cooking with mains, sides and dessert.' },
    { id: 4, name: 'Grand Family Feast', type: 'family', price: 749, maxGuests: 100, description: 'A lavish buffet spread for large family occasions.' },
    { id: 5, name: 'Elegant Wedding Reception', type: 'wedding', price: 2499, maxGuests: 100, description: 'A 4-course dinner with wine service and wedding cake.' },
    { id: 6, name: 'Luxury Wedding Experience', type: 'wedding', price: 4999, maxGuests: 200, description: 'Bespoke menu, champagne reception and full table service.' }
  ]
</script>

<svelte:head>
  <title>FeastDay Catering</title>
</svelte:head>

<!-- Hero -->
<section class="hero">
  <div class="hero-text">
    <div class="hero-tag">🎉 PROFESSIONAL EVENT CATERING</div>
    <h1>WE MAKE EVERY EVENT<br/><span>DELICIOUS</span></h1>
    <p>Birthdays · Family Parties · Weddings<br/>Fresh food, expert service, unforgettable events.</p>
    <div class="hero-btns">
      <a href="/packages" class="btn-primary">VIEW PACKAGES</a>
      <a href="/register" class="btn-secondary">BOOK NOW</a>
    </div>
  </div>
  <div class="hero-image">
    <div class="hero-img-placeholder">
      <span>🍽️</span>
    </div>
  </div>
</section>

<!-- Event Types -->
<section class="event-types">
  <div class="inner">
    <a href="/packages?type=birthday" class="type-card birthday">
      <div class="type-icon">🎂</div>
      <h3>BIRTHDAYS</h3>
      <p>All ages, all sizes</p>
    </a>
    <a href="/packages?type=family" class="type-card family">
      <div class="type-icon">👨‍👩‍👧‍👦</div>
      <h3>FAMILY PARTIES</h3>
      <p>Reunions & gatherings</p>
    </a>
    <a href="/packages?type=wedding" class="type-card wedding">
      <div class="type-icon">💍</div>
      <h3>WEDDINGS</h3>
      <p>Elegant & memorable</p>
    </a>
  </div>
</section>

<!-- Featured Packages -->
<section class="featured">
  <div class="inner">
    <h2>POPULAR PACKAGES</h2>
    <div class="pkg-grid">
      {#each packages.slice(0, 3) as pkg}
        <a href="/packages/{pkg.id}" class="pkg-card">
          <div class="pkg-type">{pkg.type.toUpperCase()}</div>
          <h3>{pkg.name}</h3>
          <p>{pkg.description}</p>
          <div class="pkg-footer">
            <span class="pkg-price">From £{pkg.price}</span>
            <span class="pkg-guests">Up to {pkg.maxGuests} guests</span>
          </div>
          <div class="pkg-cta">ORDER NOW →</div>
        </a>
      {/each}
    </div>
    <div class="view-all">
      <a href="/packages" class="btn-primary">VIEW ALL PACKAGES</a>
    </div>
  </div>
</section>

<!-- Why Us -->
<section class="why">
  <div class="inner">
    <div class="why-text">
      <h2>WHY CHOOSE FEASTDAY?</h2>
      <p>We've been feeding happy families and celebrating couples since 2015. Over 500 events catered, zero disappointments.</p>
      <ul>
        <li>✅ Fresh locally sourced ingredients</li>
        <li>✅ Experienced professional chefs</li>
        <li>✅ Full setup and cleanup included</li>
        <li>✅ Dietary requirements catered for</li>
        <li>✅ Flexible packages for any budget</li>
      </ul>
      <a href="/register" class="btn-primary">GET STARTED</a>
    </div>
    <div class="why-stats">
      <div class="stat">
        <div class="stat-num">500+</div>
        <div class="stat-label">Events Catered</div>
      </div>
      <div class="stat">
        <div class="stat-num">12+</div>
        <div class="stat-label">Years Experience</div>
      </div>
      <div class="stat">
        <div class="stat-num">98%</div>
        <div class="stat-label">Happy Customers</div>
      </div>
      <div class="stat">
        <div class="stat-num">6</div>
        <div class="stat-label">Package Options</div>
      </div>
    </div>
  </div>
</section>

<style>
  .inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 2rem;
  }

  /* HERO */
  .hero {
    background: #fce4e4;
    padding: 4rem 3rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 2rem;
    min-height: 500px;
  }

  .hero-text {
    max-width: 600px;
  }

  .hero-tag {
    background: #e63946;
    color: white;
    display: inline-block;
    padding: 0.3rem 1rem;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 700;
    letter-spacing: 1px;
    margin-bottom: 1.5rem;
  }

  .hero h1 {
    font-size: 5rem;
    line-height: 0.95;
    margin-bottom: 1.5rem;
    color: #111;
  }

  .hero h1 span {
    color: #e63946;
  }

  .hero p {
    font-size: 1.1rem;
    color: #555;
    margin-bottom: 2rem;
    line-height: 1.6;
  }

  .hero-btns {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
  }

  .hero-image {
    flex-shrink: 0;
  }

  .hero-img-placeholder {
    width: 350px;
    height: 350px;
    background: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 8rem;
    box-shadow: 0 10px 40px rgba(0,0,0,0.1);
  }

  .btn-primary {
    background: #111;
    color: white;
    padding: 0.9rem 2rem;
    border-radius: 4px;
    font-weight: 700;
    font-size: 0.9rem;
    letter-spacing: 1px;
    display: inline-block;
    transition: background 0.2s;
  }

  .btn-primary:hover {
    background: #e63946;
  }

  .btn-secondary {
    background: #e63946;
    color: white;
    padding: 0.9rem 2rem;
    border-radius: 4px;
    font-weight: 700;
    font-size: 0.9rem;
    letter-spacing: 1px;
    display: inline-block;
    transition: background 0.2s;
  }

  .btn-secondary:hover {
    background: #c1121f;
  }

  /* EVENT TYPES */
  .event-types {
    background: #111;
    padding: 3rem 0;
  }

  .event-types .inner {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
  }

  .type-card {
    background: #1e1e1e;
    border-radius: 12px;
    padding: 2.5rem;
    text-align: center;
    color: white;
    transition: background 0.2s, transform 0.2s;
    display: block;
  }

  .type-card:hover {
    background: #e63946;
    transform: translateY(-4px);
  }

  .type-icon {
    font-size: 3rem;
    margin-bottom: 1rem;
  }

  .type-card h3 {
    font-size: 1.8rem;
    margin-bottom: 0.5rem;
    color: white;
  }

  .type-card p {
    color: #aaa;
    font-size: 0.9rem;
  }

  .type-card:hover p {
    color: rgba(255,255,255,0.8);
  }

  /* PACKAGES */
  .featured {
    padding: 4rem 0;
    background: #f9f9f9;
  }

  .featured h2 {
    font-size: 3rem;
    margin-bottom: 2rem;
    text-align: center;
  }

  .pkg-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
  }

  .pkg-card {
    background: white;
    border-radius: 12px;
    padding: 2rem;
    display: block;
    color: #111;
    border: 2px solid transparent;
    transition: border-color 0.2s, transform 0.2s;
    box-shadow: 0 2px 12px rgba(0,0,0,0.06);
  }

  .pkg-card:hover {
    border-color: #e63946;
    transform: translateY(-4px);
  }

  .pkg-type {
    background: #fce4e4;
    color: #e63946;
    display: inline-block;
    padding: 0.2rem 0.8rem;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 700;
    letter-spacing: 1px;
    margin-bottom: 1rem;
  }

  .pkg-card h3 {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 1.6rem;
    margin-bottom: 0.5rem;
  }

  .pkg-card p {
    color: #666;
    font-size: 0.9rem;
    margin-bottom: 1.5rem;
    line-height: 1.5;
  }

  .pkg-footer {
    display: flex;
    justify-content: space-between;
    margin-bottom: 1rem;
    font-size: 0.85rem;
  }

  .pkg-price {
    font-weight: 700;
    color: #e63946;
    font-size: 1.1rem;
  }

  .pkg-guests {
    color: #888;
  }

  .pkg-cta {
    font-weight: 700;
    font-size: 0.85rem;
    letter-spacing: 1px;
    color: #111;
  }

  .view-all {
    text-align: center;
    margin-top: 1rem;
  }

  /* WHY US */
  .why {
    padding: 4rem 0;
    background: white;
  }

  .why .inner {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 4rem;
    align-items: center;
  }

  .why h2 {
    font-size: 3rem;
    margin-bottom: 1rem;
  }

  .why-text p {
    color: #555;
    margin-bottom: 1.5rem;
    line-height: 1.7;
  }

  .why-text ul {
    list-style: none;
    margin-bottom: 2rem;
  }

  .why-text li {
    padding: 0.5rem 0;
    font-size: 0.95rem;
    border-bottom: 1px solid #f0f0f0;
  }

  .why-stats {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.5rem;
  }

  .stat {
    background: #111;
    color: white;
    border-radius: 12px;
    padding: 2rem;
    text-align: center;
  }

  .stat-num {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 3rem;
    color: #e63946;
    line-height: 1;
  }

  .stat-label {
    font-size: 0.85rem;
    color: #aaa;
    margin-top: 0.5rem;
  }
</style>
