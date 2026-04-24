<script>
  const allPackages = [
    { id: 1, name: 'Classic Birthday Bash', type: 'birthday', price: 299, maxGuests: 30, description: 'Fun finger foods, birthday cake and soft drinks. Perfect for all ages.', includes: ['Finger food buffet', 'Birthday cake', 'Soft drinks', 'Paper plates & napkins', 'Setup & cleanup'] },
    { id: 2, name: 'Premium Birthday Celebration', type: 'birthday', price: 599, maxGuests: 60, description: 'A 3-course meal with dedicated servers and a custom cake.', includes: ['3-course sit-down meal', 'Custom birthday cake', 'Dedicated servers', 'Table decorations', 'Setup & cleanup'] },
    { id: 3, name: 'Family Gathering Package', type: 'family', price: 399, maxGuests: 50, description: 'Hearty home-style cooking with mains, sides and dessert.', includes: ['Buffet-style mains', 'Selection of sides', 'Dessert table', 'Soft drinks', 'Setup & cleanup'] },
    { id: 4, name: 'Grand Family Feast', type: 'family', price: 749, maxGuests: 100, description: 'A lavish buffet spread for large family occasions.', includes: ['Extended buffet menu', 'Hot & cold dishes', 'Dessert selection', 'Soft drinks & juice', 'Full setup & cleanup'] },
    { id: 5, name: 'Elegant Wedding Reception', type: 'wedding', price: 2499, maxGuests: 100, description: 'A 4-course dinner with wine service and wedding cake.', includes: ['4-course dinner', 'Wine & drinks service', 'Wedding cake', 'Dedicated staff', 'Full setup & cleanup'] },
    { id: 6, name: 'Luxury Wedding Experience', type: 'wedding', price: 4999, maxGuests: 200, description: 'Bespoke menu, champagne reception and full table service.', includes: ['Bespoke custom menu', 'Champagne reception', 'Full table service', 'Wedding cake', 'Premium setup & cleanup'] }
  ]

  const typeIcons = { birthday: '🎂', family: '👨‍👩‍👧‍👦', wedding: '💍' }
  let selectedType = $state('all')
  let filtered = $derived(selectedType === 'all' ? allPackages : allPackages.filter(p => p.type === selectedType))
</script>

<svelte:head><title>Packages — FeastDay Catering</title></svelte:head>

<section class="hero">
  <h1>OUR PACKAGES</h1>
  <p>Choose the perfect catering package for your event</p>
</section>

<section class="content">
  <div class="filters">
    <button class:active={selectedType === 'all'} onclick={() => selectedType = 'all'}>ALL</button>
    <button class:active={selectedType === 'birthday'} onclick={() => selectedType = 'birthday'}>🎂 BIRTHDAYS</button>
    <button class:active={selectedType === 'family'} onclick={() => selectedType = 'family'}>👨‍👩‍👧‍👦 FAMILY</button>
    <button class:active={selectedType === 'wedding'} onclick={() => selectedType = 'wedding'}>💍 WEDDINGS</button>
  </div>

  <div class="category-links">
    <a href="/birthdays" class="cat-link birthday">🎂 Birthday Catering →</a>
    <a href="/family" class="cat-link family">👨‍👩‍👧‍👦 Family Parties →</a>
    <a href="/weddings" class="cat-link wedding">💍 Wedding Catering →</a>
  </div>

  <div class="pkg-grid">
    {#each filtered as pkg}
      <div class="pkg-card">
        <div class="pkg-icon">{typeIcons[pkg.type]}</div>
        <div class="pkg-type">{pkg.type.toUpperCase()}</div>
        <h3>{pkg.name}</h3>
        <p>{pkg.description}</p>
        <ul class="includes">
          {#each pkg.includes as item}
            <li>✓ {item}</li>
          {/each}
        </ul>
        <div class="pkg-footer">
          <div>
            <div class="price">£{pkg.price}</div>
            <div class="guests">Up to {pkg.maxGuests} guests</div>
          </div>
          <a href="/packages/{pkg.id}" class="btn">VIEW & BOOK</a>
        </div>
      </div>
    {/each}
  </div>
</section>

<style>
  .hero { background: #111; color: white; padding: 4rem 3rem; text-align: center; }
  .hero h1 { font-size: 4rem; color: #e63946; margin-bottom: 0.5rem; }
  .hero p { color: #aaa; font-size: 1.1rem; }
  .content { max-width: 1200px; margin: 0 auto; padding: 3rem 2rem; }
  .filters { display: flex; gap: 1rem; margin-bottom: 1.5rem; flex-wrap: wrap; }
  .filters button { background: #f0f0f0; border: none; padding: 0.6rem 1.5rem; border-radius: 4px; font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; cursor: pointer; transition: all 0.2s; font-family: 'Inter', sans-serif; }
  .filters button:hover, .filters button.active { background: #e63946; color: white; }
  .category-links { display: flex; gap: 1rem; margin-bottom: 2.5rem; flex-wrap: wrap; }
  .cat-link { padding: 0.6rem 1.2rem; border-radius: 4px; font-weight: 700; font-size: 0.85rem; transition: all 0.2s; }
  .cat-link.birthday { background: #fce4e4; color: #e63946; }
  .cat-link.birthday:hover { background: #e63946; color: white; }
  .cat-link.family { background: #e8f5e9; color: #2e7d32; }
  .cat-link.family:hover { background: #2e7d32; color: white; }
  .cat-link.wedding { background: #f3e5f5; color: #6a1b9a; }
  .cat-link.wedding:hover { background: #6a1b9a; color: white; }
  .pkg-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 1.5rem; }
  .pkg-card { background: white; border-radius: 12px; padding: 2rem; border: 2px solid #f0f0f0; transition: border-color 0.2s, transform 0.2s; box-shadow: 0 2px 12px rgba(0,0,0,0.05); }
  .pkg-card:hover { border-color: #e63946; transform: translateY(-4px); }
  .pkg-icon { font-size: 2.5rem; margin-bottom: 0.5rem; }
  .pkg-type { background: #fce4e4; color: #e63946; display: inline-block; padding: 0.2rem 0.8rem; border-radius: 20px; font-size: 0.75rem; font-weight: 700; letter-spacing: 1px; margin-bottom: 0.8rem; }
  .pkg-card h3 { font-size: 1.5rem; margin-bottom: 0.5rem; }
  .pkg-card p { color: #666; font-size: 0.9rem; margin-bottom: 1rem; line-height: 1.5; }
  .includes { list-style: none; margin-bottom: 1.5rem; }
  .includes li { padding: 0.3rem 0; font-size: 0.85rem; color: #444; border-bottom: 1px solid #f5f5f5; }
  .pkg-footer { display: flex; justify-content: space-between; align-items: center; }
  .price { font-size: 1.6rem; font-weight: 700; color: #e63946; font-family: 'Bebas Neue', sans-serif; }
  .guests { font-size: 0.8rem; color: #888; }
  .btn { background: #111; color: white; padding: 0.7rem 1.2rem; border-radius: 4px; font-weight: 700; font-size: 0.8rem; letter-spacing: 1px; transition: background 0.2s; }
  .btn:hover { background: #e63946; }
</style>
