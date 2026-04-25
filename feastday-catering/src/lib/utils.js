// JSON data for FeastDay Catering packages
// Used as fallback when database is unavailable

export const packages = [
  {
    id: 1,
    name: 'Classic Birthday Bash',
    type: 'birthday',
    price: 299,
    maxGuests: 30,
    description: 'Fun finger foods, birthday cake and soft drinks. Perfect for all ages.',
    includes: ['Finger food buffet', 'Birthday cake', 'Soft drinks', 'Paper plates & napkins', 'Setup & cleanup']
  },
  {
    id: 2,
    name: 'Premium Birthday Celebration',
    type: 'birthday',
    price: 599,
    maxGuests: 60,
    description: 'A 3-course meal with dedicated servers and a custom cake.',
    includes: ['3-course sit-down meal', 'Custom birthday cake', 'Dedicated servers', 'Table decorations', 'Setup & cleanup']
  },
  {
    id: 3,
    name: 'Family Gathering Package',
    type: 'family',
    price: 399,
    maxGuests: 50,
    description: 'Hearty home-style cooking with mains, sides and dessert.',
    includes: ['Buffet-style mains', 'Selection of sides', 'Dessert table', 'Soft drinks', 'Setup & cleanup']
  },
  {
    id: 4,
    name: 'Grand Family Feast',
    type: 'family',
    price: 749,
    maxGuests: 100,
    description: 'A lavish buffet spread for large family occasions.',
    includes: ['Extended buffet menu', 'Hot & cold dishes', 'Dessert selection', 'Soft drinks & juice', 'Full setup & cleanup']
  },
  {
    id: 5,
    name: 'Elegant Wedding Reception',
    type: 'wedding',
    price: 2499,
    maxGuests: 100,
    description: 'A 4-course dinner with wine service and wedding cake.',
    includes: ['4-course dinner', 'Wine & drinks service', 'Wedding cake', 'Dedicated staff', 'Full setup & cleanup']
  },
  {
    id: 6,
    name: 'Luxury Wedding Experience',
    type: 'wedding',
    price: 4999,
    maxGuests: 200,
    description: 'Bespoke menu, champagne reception and full table service.',
    includes: ['Bespoke custom menu', 'Champagne reception', 'Full table service', 'Wedding cake', 'Premium setup & cleanup']
  }
]

export const eventTypes = [
  { type: 'birthday', label: 'Birthdays', icon: '🎂', colour: '#e63946' },
  { type: 'family', label: 'Family Parties', icon: '👨‍👩‍👧‍👦', colour: '#2e7d32' },
  { type: 'wedding', label: 'Weddings', icon: '💍', colour: '#6a1b9a' }
]

export const companyInfo = {
  name: 'FeastDay Catering',
  phone: '01234 567890',
  email: 'hello@feastday.com',
  founded: 2015,
  eventsServed: 500,
  teamSize: 15
}
