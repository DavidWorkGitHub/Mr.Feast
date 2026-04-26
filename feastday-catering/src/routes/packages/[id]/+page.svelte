<script>
  import { page } from '$app/stores'

  const allPackages = [
    { id: 1, name: 'Classic Birthday Bash', type: 'birthday', price: 299, maxGuests: 30, description: 'Fun finger foods, birthday cake and soft drinks. Perfect for all ages.', includes: ['Finger food buffet', 'Birthday cake', 'Soft drinks', 'Paper plates & napkins', 'Setup & cleanup'], details: 'Our Classic Birthday Bash is perfect for casual birthday celebrations. We bring everything you need for a fun, stress-free party.' },
    { id: 2, name: 'Premium Birthday Celebration', type: 'birthday', price: 599, maxGuests: 60, description: 'A 3-course meal with dedicated servers and a custom cake.', includes: ['3-course sit-down meal', 'Custom birthday cake', 'Dedicated servers', 'Table decorations', 'Setup & cleanup'], details: 'Elevate your birthday with a full sit-down dining experience. Our chefs prepare a stunning 3-course meal tailored to your preferences.' },
    { id: 3, name: 'Family Gathering Package', type: 'family', price: 399, maxGuests: 50, description: 'Hearty home-style cooking with mains, sides and dessert.', includes: ['Buffet-style mains', 'Selection of sides', 'Dessert table', 'Soft drinks', 'Setup & cleanup'], details: 'Perfect for reunions and family get-togethers. We bring the warmth of home cooking with a hearty buffet spread.' },
    { id: 4, name: 'Grand Family Feast', type: 'family', price: 749, maxGuests: 100, description: 'A lavish buffet spread for large family occasions.', includes: ['Extended buffet menu', 'Hot & cold dishes', 'Dessert selection', 'Soft drinks & juice', 'Full setup & cleanup'], details: 'For those big family moments that deserve a real celebration. Our Grand Family Feast delivers an extensive spread.' },
    { id: 5, name: 'Elegant Wedding Reception', type: 'wedding', price: 2499, maxGuests: 100, description: 'A 4-course dinner with wine service and wedding cake.', includes: ['4-course dinner', 'Wine & drinks service', 'Wedding cake', 'Dedicated staff', 'Full setup & cleanup'], details: 'Your wedding day deserves perfection. Our Elegant Wedding Reception package delivers a refined dining experience.' },
    { id: 6, name: 'Luxury Wedding Experience', type: 'wedding', price: 4999, maxGuests: 200, description: 'Bespoke menu, champagne reception and full table service.', includes: ['Bespoke custom menu', 'Champagne reception', 'Full table service', 'Wedding cake', 'Premium setup & cleanup'], details: 'The ultimate wedding catering experience. We work with you to create a completely bespoke menu.' }
  ]

  const typeIcons = { birthday: '🎂', family: '👨‍👩‍👧‍👦', wedding: '💍' }
  let id = $derived(Number($page.params.id))
  let pkg = $derived(allPackages.find(p => p.id === id))
</script>

<svelte:head>
  <title>{pkg ? pkg.name : 'Package'} — FeastDay Catering</title>
</svelte:head>

{#if pkg}
  <section class="hero">
    <div class="hero-inner">
      <a href="/packages" class="back">← BACK TO PACKAGES</a>
      <div class="pkg-type">{pkg.type.toUpperCase()}</div>
      <h1>{pkg.name}</h1>
      <p>{pkg.description}</p>
    </div>
    <div class="hero-icon">{typeIcons[pkg.type]}</div>
  </section>

  <section class="content">
    <div class="left">
      <div class="card">
        <h2>WHAT'S INCLUDED</h2>
        <ul>
          {#each pkg.includes as item}
            <li>✓ {item}</li>
          {/each}
        </ul>
      </div>
      <div class="card">
        <h2>ABOUT THIS PACKAGE</h2>
        <p>{pkg.details}</p>
      </div>
    </div>

    <div class="right">
      <div class="booking-box">
        <div class="price">£{pkg.price}</div>
        <div class="guests">Up to {pkg.maxGuests} guests</div>
        <hr />
        <p>Ready to book this package for your event?</p>
        <a href="/enquiry" class="btn-book">BOOK THIS PACKAGE</a>
        <p class="note">You'll need an account to complete your booking</p>
      </div>

      <div class="info-box">
        <h3>NEED HELP?</h3>
        <p>📞 01234 567890</p>
        <p>✉️ hello@feastday.com</p>
        <p>Mon–Fri, 9am–6pm</p>
      </div>
    </div>
  </section>
{:else}
  <section class="notfound">
    <h1>PACKAGE NOT FOUND</h1>
    <a href="/packages" class="btn">VIEW ALL PACKAGES</a>
  </section>
{/if}

<style>
  .hero { background: #111; color: white; padding: 4rem 3rem; display: flex; justify-content: space-between; align-items: center; gap: 2rem; }
  .hero-inner { max-width: 600px; }
  .back { color: #aaa; font-size: 0.85rem; font-weight: 700; letter-spacing: 1px; display: inline-block; margin-bottom: 1.5rem; transition: color 0.2s; }
  .back:hover { color: #e63946; }
  .pkg-type { background: #e63946; color: white; display: inline-block; padding: 0.2rem 0.8rem; border-radius: 20px; font-size: 0.75rem; font-weight: 700; letter-spacing: 1px; margin-bottom: 1rem; }
  .hero h1 { font-size: 3.5rem; color: white; margin-bottom: 1rem; }
  .hero p { color: #aaa; font-size: 1rem; line-height: 1.6; }
  .hero-icon { font-size: 8rem; }
  .content { max-width: 1200px; margin: 3rem auto; padding: 0 2rem; display: grid; grid-template-columns: 1fr 350px; gap: 2rem; }
  .card { background: white; border-radius: 12px; padding: 2rem; margin-bottom: 1.5rem; box-shadow: 0 2px 12px rgba(0,0,0,0.06); }
  .card h2 { font-size: 1.5rem; margin-bottom: 1rem; }
  .card ul { list-style: none; }
  .card ul li { padding: 0.6rem 0; border-bottom: 1px solid #f5f5f5; font-size: 0.95rem; color: #444; }
  .card p { color: #555; line-height: 1.7; }
  .booking-box { background: #111; color: white; border-radius: 12px; padding: 2rem; margin-bottom: 1.5rem; text-align: center; }
  .price { font-family: 'Bebas Neue', sans-serif; font-size: 4rem; color: #e63946; line-height: 1; }
  .guests { color: #aaa; font-size: 0.9rem; margin-bottom: 1rem; }
  .booking-box hr { border-color: #333; margin: 1rem 0; }
  .booking-box p { color: #aaa; font-size: 0.9rem; margin-bottom: 1rem; }
  .btn-book { background: #e63946; color: white; padding: 1rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; display: block; transition: background 0.2s; }
  .btn-book:hover { background: #c1121f; }
  .note { font-size: 0.75rem !important; color: #666 !important; margin-top: 0.5rem !important; }
  .info-box { background: white; border-radius: 12px; padding: 1.5rem; box-shadow: 0 2px 12px rgba(0,0,0,0.06); }
  .info-box h3 { font-size: 1.2rem; margin-bottom: 1rem; }
  .info-box p { color: #555; font-size: 0.9rem; margin-bottom: 0.5rem; }
  .notfound { text-align: center; padding: 6rem 2rem; }
  .btn { background: #111; color: white; padding: 0.8rem 2rem; border-radius: 4px; font-weight: 700; display: inline-block; margin-top: 1rem; }
</style>
