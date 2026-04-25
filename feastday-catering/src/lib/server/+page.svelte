<script>
  let { data, form } = $props()
</script>

<svelte:head><title>Book a Package — FeastDay Catering</title></svelte:head>

<section class="hero">
  <h1>BOOK A PACKAGE</h1>
  <p>Fill in the form below and we'll confirm your booking</p>
</section>

<section class="content">
  <div class="form-wrap">
    {#if form?.error}
      <div class="error">{form.error}</div>
    {/if}

    <form method="POST">
      <div class="field">
        <label for="packageId">SELECT PACKAGE</label>
        <select id="packageId" name="packageId" required>
          <option value="">-- Choose a package --</option>
          {#each data.packages as pkg}
            <option value={pkg.id}>
              {pkg.name} — £{pkg.price} (up to {pkg.max_guests} guests)
            </option>
          {/each}
        </select>
      </div>

      <div class="field">
        <label for="eventDate">EVENT DATE</label>
        <input type="date" id="eventDate" name="eventDate" required />
      </div>

      <div class="field">
        <label for="guestCount">NUMBER OF GUESTS</label>
        <input type="number" id="guestCount" name="guestCount" min="1" max="200" placeholder="e.g. 30" required />
      </div>

      <div class="field">
        <label for="notes">ADDITIONAL NOTES (optional)</label>
        <textarea id="notes" name="notes" placeholder="Any dietary requirements, special requests etc." rows="4"></textarea>
      </div>

      <div class="booking-as">
        Booking as: <strong>{data.user.name}</strong> ({data.user.email})
      </div>

      <button type="submit" class="btn-submit">CONFIRM BOOKING</button>
    </form>
  </div>
</section>

<style>
  .hero { background: #111; color: white; padding: 4rem 3rem; text-align: center; }
  .hero h1 { font-size: 4rem; color: #e63946; margin-bottom: 0.5rem; }
  .hero p { color: #aaa; font-size: 1.1rem; }
  .content { max-width: 600px; margin: 3rem auto; padding: 0 2rem; }
  .form-wrap { background: white; border-radius: 16px; padding: 2.5rem; box-shadow: 0 4px 24px rgba(0,0,0,0.08); }
  .error { background: #fce4e4; color: #e63946; padding: 0.8rem; border-radius: 8px; font-size: 0.9rem; margin-bottom: 1.5rem; }
  .field { margin-bottom: 1.5rem; }
  label { display: block; font-size: 0.75rem; font-weight: 700; letter-spacing: 1px; color: #333; margin-bottom: 0.4rem; }
  input, select, textarea { width: 100%; padding: 0.8rem 1rem; border: 2px solid #f0f0f0; border-radius: 8px; font-size: 0.95rem; font-family: 'Inter', sans-serif; transition: border-color 0.2s; outline: none; }
  input:focus, select:focus, textarea:focus { border-color: #e63946; }
  textarea { resize: vertical; }
  .booking-as { background: #f9f9f9; padding: 0.8rem 1rem; border-radius: 8px; font-size: 0.85rem; color: #555; margin-bottom: 1.5rem; }
  .btn-submit { width: 100%; background: #111; color: white; border: none; padding: 1rem; border-radius: 8px; font-weight: 700; font-size: 0.9rem; letter-spacing: 1px; cursor: pointer; transition: background 0.2s; font-family: 'Inter', sans-serif; }
  .btn-submit:hover { background: #e63946; }
</style>
