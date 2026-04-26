## FeastDay Catering - COMP H2037 Front End Development Project
Student Info

Module: COMP H2037 - Front End Development
Case Study: CS5 - Party & Event Caterers (Birthdays, Family Parties, Weddings)
AI Usage Level: 4 - AI Task Completion, Human Evaluation

Project Overview
FeastDay Catering is a SvelteKit website for a party and event catering company.
Customers can browse catering packages, register/login, and make booking enquiries.
Admins can view and manage all bookings.
Tech Stack

Framework: SvelteKit
Database: PostgreSQL (via node-postgres)
Auth: Cookie-based sessions with bcryptjs password hashing
Styling: Plain CSS in Svelte components
Fonts: Google Fonts (Bebas Neue, Inter)

Setup Instructions

Install dependencies: npm install
Create PostgreSQL database called feastday
Run the SQL in database.sql to create tables and seed data
Update src/lib/server/db.js with your PostgreSQL password
Run: npm run dev
Open: http://localhost:5173

Test Accounts

Admin: admin@feastday.com / password
Customer: Register a new account on the site

Pages

/ - Home page
/packages - All packages with filter by type
/packages/[id] - Individual package detail page
/birthdays - Birthday catering page
/family - Family party catering page
/weddings - Wedding catering page
/about - About us page
/login - Login page
/register - Register page
/logout - Logout
/enquiry - Booking enquiry form (requires login)
/bookings - My bookings (requires login)
/admin - Admin dashboard (requires admin role)
/api/packages - JSON API endpoint

Module Topics Demonstrated

SvelteKit website creation and routing
Svelte pages with JavaScript, {#each}, {#if}, {#else}
Page-based CSS styles
+layout.svelte for site-wide navbar and footer
[param] directory routing (/packages/[id])
Forms with POST actions and server-side handling
Cookies for session management
Redirects and 404 error page
JSON data import/export (src/lib/data.js)
JavaScript function import/export (src/lib/utils.js)
JSON API endpoint (/api/packages)

User Roles

Guest - browse packages, view pages
Customer - register, login, make bookings, view own bookings
Admin - view and manage all bookings, update booking status

AI Usage
This project was developed with Claude (Anthropic) as an AI co-pilot under Level 4 AI usage.
AI was used to generate file structures, page layouts, server actions and CSS styling.
All code has been reviewed and understood by the student.
AI-generated content is noted in each commit README.
