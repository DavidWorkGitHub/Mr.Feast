<script>
  import { formatPrice, formatDate, capitalise } from '$lib/utils.js'
  let { data } = $props()
</script>

<svelte:head><title>Admin — FeastDay Catering</title></svelte:head>

<section class="hero">
  <h1>ADMIN DASHBOARD</h1>
  <p>Welcome back, {data.user.name}</p>
</section>

<section class="content">
  <div class="stats">
    <div class="stat"><div class="num">{data.stats.total_bookings}</div><div class="label">Total Bookings</div></div>
    <div class="stat"><div class="num">{data.stats.pending}</div><div class="label">Pending</div></div>
    <div class="stat"><div class="num">{data.stats.confirmed}</div><div class="label">Confirmed</div></div>
    <div class="stat"><div class="num">{formatPrice(data.stats.total_value)}</div><div class="label">Total Value</div></div>
  </div>

  <h2>ALL BOOKINGS</h2>

  {#if data.bookings.length === 0}
    <div class="empty">No bookings yet.</div>
  {:else}
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
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {#each data.bookings as b}
            <tr>
              <td><strong>{b.user_name}</strong><br/><span>{b.user_email}</span></td>
              <td>{b.package_name}</td>
              <td>{b.event_date}</td>
              <td>{b.guest_count}</td>
              <td>{formatPrice(b.price)}</td>
              <td><span class="status {b.status}">{capitalise(b.status)}</span></td>
              <td>
                <form method="POST" action="?/updateStatus">
                  <input type="hidden" name="bookingId" value={b.id} />
                  <select name="status" onchange="this.form.submit()">
                    <option value="pending" selected={b.status === 'pending'}>Pending</option>
                    <option value="confirmed" selected={b.status === 'confirmed'}>Confirmed</option>
                    <option value="cancelled" selected={b.status === 'cancelled'}>Cancelled</option>
                  </select>
                </form>
              </td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  {/if}
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
  .empty { background: white; padding: 3rem; text-align: center; border-radius: 12px; color: #888; }
  .table-wrap { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 12px rgba(0,0,0,0.06); overflow-x: auto; }
  table { width: 100%; border-collapse: collapse; }
  thead { background: #111; color: white; }
  th { padding: 1rem; text-align: left; font-size: 0.8rem; letter-spacing: 1px; }
  td { padding: 1rem; border-bottom: 1px solid #f5f5f5; font-size: 0.9rem; }
  td span { color: #888; font-size: 0.8rem; }
  .status { padding: 0.3rem 0.8rem; border-radius: 20px; font-size: 0.75rem; font-weight: 700; }
  .status.pending { background: #fff3cd; color: #856404; }
  .status.confirmed { background: #d1eddf; color: #155724; }
  .status.cancelled { background: #fce4e4; color: #e63946; }
  select { padding: 0.4rem; border: 1px solid #ddd; border-radius: 4px; font-family: 'Inter', sans-serif; font-size: 0.85rem; cursor: pointer; }
</style>
