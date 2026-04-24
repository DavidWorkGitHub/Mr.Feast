<script>
  let { data } = $props()

  const mockBookings = [
    { id: 1, user_name: 'Jane Smith', email: 'jane@example.com', package_name: 'Classic Birthday Bash', event_date: '2026-05-15', guest_count: 25, status: 'pending', price: 299 },
    { id: 2, user_name: 'Tom Hughes', email: 'tom@example.com', package_name: 'Elegant Wedding Reception', event_date: '2026-06-20', guest_count: 90, status: 'confirmed', price: 2499 },
    { id: 3, user_name: 'Sarah O\'Brien', email: 'sarah@example.com', package_name: 'Family Gathering Package', event_date: '2026-05-30', guest_count: 40, status: 'pending', price: 399 },
  ]
</script>

<svelte:head><title>Admin — FeastDay Catering</title></svelte:head>

<section class="hero">
  <h1>ADMIN DASHBOARD</h1>
  <p>Manage bookings and packages</p>
</section>

<section class="content">
  <div class="stats">
    <div class="stat"><div class="num">3</div><div class="label">Total Bookings</div></div>
    <div class="stat"><div class="num">2</div><div class="label">Pending</div></div>
    <div class="stat"><div class="num">1</div><div class="label">Confirmed</div></div>
    <div class="stat"><div class="num">£3,197</div><div class="label">Total Value</div></div>
  </div>

  <h2>ALL BOOKINGS</h2>
  <div class="table-wrap">
    <table>
      <thead>
        <tr>
          <th>Customer</th>
          <th>Package</th>
          <th>Date</th>
          <th>Guests</th>
          <th>Price</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        {#each mockBookings as b}
          <tr>
            <td><strong>{b.user_name}</strong><br/><span>{b.email}</span></td>
            <td>{b.package_name}</td>
            <td>{b.event_date}</td>
            <td>{b.guest_count}</td>
            <td>£{b.price}</td>
            <td><span class="status {b.status}">{b.status.toUpperCase()}</span></td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</section>

<style>
  .hero { background: #111; color: white; padding: 4rem 3rem; text-align: center; }
  .hero h1 { font-size: 4rem; color: #e63946; margin-bottom: 0.5rem; }
  .hero p { color: #aaa; font-size: 1.1rem; }
  .content { max-width: 1200px; margin: 3rem auto; padding: 0 2rem; }
  .stats { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1rem; margin-bottom: 3rem; }
  .stat { background: #111; color: white; border-radius: 12px; padding: 1.5rem; text-align: center; }
  .num { font-family: 'Bebas Neue', sans-serif; font-size: 2.5rem; color: #e63946; }
  .label { color: #aaa; font-size: 0.85rem; }
  h2 { font-size: 2rem; margin-bottom: 1rem; }
  .table-wrap { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 12px rgba(0,0,0,0.06); }
  table { width: 100%; border-collapse: collapse; }
  thead { background: #111; color: white; }
  th { padding: 1rem; text-align: left; font-size: 0.8rem; letter-spacing: 1px; }
  td { padding: 1rem; border-bottom: 1px solid #f5f5f5; font-size: 0.9rem; }
  td span { color: #888; font-size: 0.8rem; }
  .status { padding: 0.3rem 0.8rem; border-radius: 20px; font-size: 0.75rem; font-weight: 700; }
  .status.pending { background: #fff3cd; color: #856404; }
  .status.confirmed { background: #d1eddf; color: #155724; }
</style>
