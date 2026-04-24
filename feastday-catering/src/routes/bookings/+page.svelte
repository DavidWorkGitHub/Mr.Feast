<script>
  let { data } = $props()
</script>

<svelte:head><title>My Bookings — FeastDay Catering</title></svelte:head>

<section class="hero">
  <h1>MY BOOKINGS</h1>
  <p>Manage your event bookings</p>
</section>

<section class="content">
  {#if !data?.user}
    <div class="empty">
      <div class="empty-icon">🔒</div>
      <h2>LOGIN REQUIRED</h2>
      <p>You need to be logged in to view your bookings.</p>
      <a href="/login" class="btn">LOGIN</a>
    </div>
  {:else if data.bookings && data.bookings.length > 0}
    <div class="bookings-grid">
      {#each data.bookings as booking}
        <div class="booking-card">
          <div class="booking-header">
            <div class="booking-type">{booking.package_name}</div>
            <div class="status {booking.status}">{booking.status.toUpperCase()}</div>
          </div>
          <div class="booking-details">
            <div class="detail"><span>📅 Date</span><strong>{booking.event_date}</strong></div>
            <div class="detail"><span>👥 Guests</span><strong>{booking.guest_count}</strong></div>
            <div class="detail"><span>💰 Price</span><strong>£{booking.price}</strong></div>
          </div>
          {#if booking.notes}
            <div class="notes">📝 {booking.notes}</div>
          {/if}
        </div>
      {/each}
    </div>
  {:else}
    <div class="empty">
      <div class="empty-icon">📋</div>
      <h2>NO BOOKINGS YET</h2>
      <p>You haven't made any bookings yet. Browse our packages to get started!</p>
      <a href="/packages" class="btn">VIEW PACKAGES</a>
    </div>
  {/if}
</section>

<style>
  .hero { background: #111; color: white; padding: 4rem 3rem; text-align: center; }
  .hero h1 { font-size: 4rem; color: #e63946; margin-bottom: 0.5rem; }
  .hero p { color: #aaa; font-size: 1.1rem; }
  .content { max-width: 900px; margin: 3rem auto; padding: 0 2rem; }
  .empty { text-align: center; padding: 4rem 2rem; background: white; border-radius: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.06); }
  .empty-icon { font-size: 4rem; margin-bottom: 1rem; }
  .empty h2 { font-size: 2rem; margin-bottom: 0.5rem; }
  .empty p { color: #888; margin-bottom: 2rem; }
  .btn { background: #111; color: white; padding: 0.8rem 2rem; border-radius: 4px; font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; display: inline-block; transition: background 0.2s; }
  .btn:hover { background: #e63946; }
  .bookings-grid { display: flex; flex-direction: column; gap: 1rem; }
  .booking-card { background: white; border-radius: 12px; padding: 1.5rem; box-shadow: 0 2px 12px rgba(0,0,0,0.06); border-left: 4px solid #e63946; }
  .booking-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem; }
  .booking-type { font-family: 'Bebas Neue', sans-serif; font-size: 1.3rem; }
  .status { padding: 0.3rem 0.8rem; border-radius: 20px; font-size: 0.75rem; font-weight: 700; letter-spacing: 1px; }
  .status.pending { background: #fff3cd; color: #856404; }
  .status.confirmed { background: #d1eddf; color: #155724; }
  .status.cancelled { background: #fce4e4; color: #e63946; }
  .booking-details { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1rem; }
  .detail { display: flex; flex-direction: column; gap: 0.2rem; }
  .detail span { font-size: 0.8rem; color: #888; }
  .detail strong { font-size: 0.95rem; }
  .notes { margin-top: 1rem; padding: 0.8rem; background: #f9f9f9; border-radius: 8px; font-size: 0.85rem; color: #555; }
</style>
