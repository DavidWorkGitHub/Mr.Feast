-- ============================================================
-- FiaFox E-Commerce Database
-- Task Two: Full Schema + Data Population Script
-- Student: David Omozokpia | B00173371
-- Module: COMP H2036 - Advanced Database and Analytics
-- ============================================================

-- Drop tables if they exist (clean slate)
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS suppliers CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- ============================================================
-- TABLE CREATION (DDL)
-- ============================================================

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    contact_email VARCHAR(150),
    phone VARCHAR(20),
    country VARCHAR(100)
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    registration_date DATE NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock_quantity INTEGER NOT NULL,
    category_id INTEGER REFERENCES categories(category_id),
    supplier_id INTEGER REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    status VARCHAR(50),
    total_amount NUMERIC(10,2)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    product_id INTEGER REFERENCES products(product_id),
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE
);

-- ============================================================
-- CATEGORIES (10 records)
-- ============================================================

INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic devices and accessories including phones, laptops and gadgets'),
('Clothing', 'Mens and womens fashion including tops, trousers and outerwear'),
('Home & Kitchen', 'Household items, kitchen appliances and home decor'),
('Sports & Outdoors', 'Sporting equipment, gym gear and outdoor adventure products'),
('Beauty & Personal Care', 'Skincare, haircare and personal grooming products'),
('Books', 'Fiction, non-fiction, educational and childrens books'),
('Toys & Games', 'Childrens toys, board games and outdoor play equipment'),
('Food & Grocery', 'Packaged foods, beverages and everyday grocery items'),
('Furniture', 'Indoor and outdoor furniture for home and office use'),
('Automotive', 'Car accessories, tools and vehicle maintenance products');

-- ============================================================
-- SUPPLIERS (15 records)
-- ============================================================

INSERT INTO suppliers (supplier_name, contact_email, phone, country) VALUES
('TechSource Ltd', 'orders@techsource.com', '+44 20 7946 0100', 'United Kingdom'),
('GlobalFashion Co', 'supply@globalfashion.com', '+1 212 555 0101', 'United States'),
('HomeGoods Wholesale', 'contact@homegoods.ie', '+353 1 400 5000', 'Ireland'),
('SportZone Suppliers', 'info@sportzone.de', '+49 30 2000 4400', 'Germany'),
('BeautyBrands Direct', 'sales@beautybrandsdirect.com', '+33 1 4200 7700', 'France'),
('BookWorld Distribution', 'orders@bookworld.co.uk', '+44 161 800 2200', 'United Kingdom'),
('ToyMakers International', 'supply@toymakers.com', '+1 310 555 0199', 'United States'),
('FreshSupply Co', 'fresh@freshsupply.ie', '+353 21 480 3000', 'Ireland'),
('FurniturePro Wholesale', 'info@furniturepro.pl', '+48 22 500 6600', 'Poland'),
('AutoParts Global', 'parts@autopartsglobal.com', '+1 415 555 0177', 'United States'),
('NovaTech Electronics', 'nova@novatech.cn', '+86 21 6000 8800', 'China'),
('EcoWear Supplies', 'eco@ecowear.nl', '+31 20 700 4400', 'Netherlands'),
('KitchenKing Ltd', 'orders@kitchenking.ie', '+353 1 677 9900', 'Ireland'),
('ActiveLife Distributors', 'sales@activelife.au', '+61 2 9000 5500', 'Australia'),
('LuxBeauty Wholesale', 'lux@luxbeauty.it', '+39 02 8000 3300', 'Italy');

-- ============================================================
-- CUSTOMERS (80 records)
-- ============================================================

INSERT INTO customers (first_name, last_name, email, phone, address, registration_date) VALUES
('James', 'Murphy', 'james.murphy@email.com', '+353 87 100 0001', '12 Grafton St, Dublin 2', '2023-01-15'),
('Sarah', 'OBrien', 'sarah.obrien@email.com', '+353 86 100 0002', '45 Patrick St, Cork', '2023-01-22'),
('Liam', 'Walsh', 'liam.walsh@email.com', '+353 85 100 0003', '8 Shop St, Galway', '2023-02-01'),
('Emma', 'Kelly', 'emma.kelly@email.com', '+353 87 100 0004', '22 Main St, Limerick', '2023-02-14'),
('Noah', 'Ryan', 'noah.ryan@email.com', '+353 86 100 0005', '5 High St, Waterford', '2023-02-28'),
('Aoife', 'Byrne', 'aoife.byrne@email.com', '+353 85 100 0006', '18 Castle St, Kilkenny', '2023-03-10'),
('Conor', 'Doyle', 'conor.doyle@email.com', '+353 87 100 0007', '33 Bridge St, Sligo', '2023-03-15'),
('Ciara', 'OConnor', 'ciara.oconnor@email.com', '+353 86 100 0008', '7 Market Sq, Dundalk', '2023-03-20'),
('Sean', 'McCarthy', 'sean.mccarthy@email.com', '+353 85 100 0009', '14 Church St, Drogheda', '2023-04-01'),
('Niamh', 'Fitzpatrick', 'niamh.fitzpatrick@email.com', '+353 87 100 0010', '29 Abbey St, Wexford', '2023-04-10'),
('Patrick', 'Gallagher', 'patrick.gallagher@email.com', '+353 86 100 0011', '3 Quay St, Donegal', '2023-04-18'),
('Sinead', 'ONeill', 'sinead.oneill@email.com', '+353 85 100 0012', '55 North St, Swords', '2023-05-02'),
('Eoin', 'Brennan', 'eoin.brennan@email.com', '+353 87 100 0013', '11 South Mall, Cork', '2023-05-14'),
('Fiona', 'Quinn', 'fiona.quinn@email.com', '+353 86 100 0014', '66 Grafton Ln, Dublin 2', '2023-05-20'),
('Declan', 'Higgins', 'declan.higgins@email.com', '+353 85 100 0015', '9 Eyre Sq, Galway', '2023-06-01'),
('Aisling', 'Power', 'aisling.power@email.com', '+353 87 100 0016', '21 Thomas St, Limerick', '2023-06-12'),
('Ronan', 'Dunne', 'ronan.dunne@email.com', '+353 86 100 0017', '44 King St, Waterford', '2023-06-25'),
('Grainne', 'Farrell', 'grainne.farrell@email.com', '+353 85 100 0018', '6 Rose Inn St, Kilkenny', '2023-07-04'),
('Brian', 'Moran', 'brian.moran@email.com', '+353 87 100 0019', '17 Wine St, Sligo', '2023-07-15'),
('Maeve', 'Sheridan', 'maeve.sheridan@email.com', '+353 86 100 0020', '38 Park St, Monaghan', '2023-07-22'),
('Cian', 'OBrien', 'cian.obrien@email.com', '+353 85 100 0021', '10 Francis St, Dublin 8', '2023-08-01'),
('Laura', 'Kennedy', 'laura.kennedy@email.com', '+353 87 100 0022', '52 McCurtain St, Cork', '2023-08-10'),
('Darragh', 'Lynch', 'darragh.lynch@email.com', '+353 86 100 0023', '4 Dominick St, Galway', '2023-08-19'),
('Roisin', 'Murray', 'roisin.murray@email.com', '+353 85 100 0024', '31 O Connell St, Limerick', '2023-08-28'),
('Shane', 'Doherty', 'shane.doherty@email.com', '+353 87 100 0025', '16 The Quay, Waterford', '2023-09-05'),
('Orla', 'Fleming', 'orla.fleming@email.com', '+353 86 100 0026', '8 Parnell St, Dublin 1', '2023-09-12'),
('Kevin', 'OShea', 'kevin.oshea@email.com', '+353 85 100 0027', '27 Barrack St, Cork', '2023-09-20'),
('Aoibhe', 'Lawlor', 'aoibhe.lawlor@email.com', '+353 87 100 0028', '13 Prospect Hill, Galway', '2023-09-28'),
('Fergus', 'Burke', 'fergus.burke@email.com', '+353 86 100 0029', '43 William St, Limerick', '2023-10-06'),
('Clodagh', 'Nolan', 'clodagh.nolan@email.com', '+353 85 100 0030', '2 Manor St, Dublin 7', '2023-10-15'),
('Tiernan', 'Reilly', 'tiernan.reilly@email.com', '+353 87 100 0031', '19 Douglas St, Cork', '2023-10-22'),
('Sorcha', 'Daly', 'sorcha.daly@email.com', '+353 86 100 0032', '35 Salthill Rd, Galway', '2023-11-01'),
('Cathal', 'Healy', 'cathal.healy@email.com', '+353 85 100 0033', '7 Roches St, Limerick', '2023-11-10'),
('Eimear', 'Brady', 'eimear.brady@email.com', '+353 87 100 0034', '48 Capel St, Dublin 1', '2023-11-18'),
('Diarmuid', 'Keane', 'diarmuid.keane@email.com', '+353 86 100 0035', '24 Shandon St, Cork', '2023-11-25'),
('Muireann', 'Carroll', 'muireann.carroll@email.com', '+353 85 100 0036', '11 Lombard St, Galway', '2023-12-02'),
('Killian', 'Coffey', 'killian.coffey@email.com', '+353 87 100 0037', '56 Henry St, Limerick', '2023-12-10'),
('Saoirse', 'Hughes', 'saoirse.hughes@email.com', '+353 86 100 0038', '30 Prussia St, Dublin 7', '2023-12-18'),
('Padraig', 'Forde', 'padraig.forde@email.com', '+353 85 100 0039', '15 Wandesford Quay, Cork', '2024-01-05'),
('Blathnaid', 'Connolly', 'blathnaid.connolly@email.com', '+353 87 100 0040', '42 Newcastle Rd, Galway', '2024-01-12'),
('Oisin', 'Tully', 'oisin.tully@email.com', '+353 86 100 0041', '9 Bedford Row, Limerick', '2024-01-20'),
('Dearbhla', 'Sweeney', 'dearbhla.sweeney@email.com', '+353 85 100 0042', '67 Dorset St, Dublin 1', '2024-01-28'),
('Ruairi', 'Stack', 'ruairi.stack@email.com', '+353 87 100 0043', '20 Paul St, Cork', '2024-02-05'),
('Caoimhe', 'Boyle', 'caoimhe.boyle@email.com', '+353 86 100 0044', '5 Sea Rd, Galway', '2024-02-13'),
('Tadhg', 'Whelan', 'tadhg.whelan@email.com', '+353 85 100 0045', '37 O Curry St, Limerick', '2024-02-21'),
('Eabha', 'Regan', 'eabha.regan@email.com', '+353 87 100 0046', '14 Stoneybatter, Dublin 7', '2024-03-01'),
('Fiachra', 'Hogan', 'fiachra.hogan@email.com', '+353 86 100 0047', '33 Washington St, Cork', '2024-03-09'),
('Niall', 'OGrady', 'niall.ogrady@email.com', '+353 85 100 0048', '18 Taylor Hill, Galway', '2024-03-17'),
('Ailbhe', 'Cronin', 'ailbhe.cronin@email.com', '+353 87 100 0049', '50 Sarsfield St, Limerick', '2024-03-25'),
('Donal', 'Walshe', 'donal.walshe@email.com', '+353 86 100 0050', '26 Harold Cross, Dublin 6', '2024-04-02'),
('Treasa', 'Fogarty', 'treasa.fogarty@email.com', '+353 85 100 0051', '8 Sullivan Quay, Cork', '2024-04-10'),
('Colm', 'Monaghan', 'colm.monaghan@email.com', '+353 87 100 0052', '22 Nuns Island, Galway', '2024-04-18'),
('Meadhbh', 'Hartley', 'meadhbh.hartley@email.com', '+353 86 100 0053', '4 Rosbrien Rd, Limerick', '2024-04-26'),
('Lorcan', 'Phelan', 'lorcan.phelan@email.com', '+353 85 100 0054', '39 Clanbrassil St, Dublin 8', '2024-05-04'),
('Riona', 'Finnegan', 'riona.finnegan@email.com', '+353 87 100 0055', '11 Anglesea St, Cork', '2024-05-12'),
('Ultan', 'Gorman', 'ultan.gorman@email.com', '+353 86 100 0056', '29 Woodquay, Galway', '2024-05-20'),
('Brid', 'Tobin', 'brid.tobin@email.com', '+353 85 100 0057', '16 Ballinacurra Rd, Limerick', '2024-05-28'),
('Cormac', 'Leahy', 'cormac.leahy@email.com', '+353 87 100 0058', '53 Ranelagh Rd, Dublin 6', '2024-06-05'),
('Emer', 'ODonovan', 'emer.odonovan@email.com', '+353 86 100 0059', '6 Drawbridge St, Cork', '2024-06-13'),
('Fionnuala', 'Gaffney', 'fionnuala.gaffney@email.com', '+353 85 100 0060', '34 Bohermore, Galway', '2024-06-21'),
('Cahal', 'Sheehan', 'cahal.sheehan@email.com', '+353 87 100 0061', '21 Mulgrave St, Limerick', '2024-06-29'),
('Orlaith', 'Callaghan', 'orlaith.callaghan@email.com', '+353 86 100 0062', '45 Phibsborough Rd, Dublin 7', '2024-07-07'),
('Seamus', 'Mulcahy', 'seamus.mulcahy@email.com', '+353 85 100 0063', '17 Grattan St, Cork', '2024-07-15'),
('Ide', 'Quinlan', 'ide.quinlan@email.com', '+353 87 100 0064', '8 Raven Terrace, Galway', '2024-07-23'),
('Donncha', 'Roche', 'donncha.roche@email.com', '+353 86 100 0065', '60 Ennis Rd, Limerick', '2024-07-31'),
('Blanaid', 'Kearney', 'blanaid.kearney@email.com', '+353 85 100 0066', '12 Drumcondra Rd, Dublin 9', '2024-08-08'),
('Fionnbarra', 'Delaney', 'fionnbarra.delaney@email.com', '+353 87 100 0067', '25 Tuckey St, Cork', '2024-08-16'),
('Sadhbh', 'Flanagan', 'sadhbh.flanagan@email.com', '+353 86 100 0068', '3 Forster St, Galway', '2024-08-24'),
('Conchobar', 'Fitzgerald', 'conchobar.fitzgerald@email.com', '+353 85 100 0069', '47 Dock Rd, Limerick', '2024-09-01'),
('Lasairfhiona', 'OCallaghan', 'lasairfhiona.ocallaghan@email.com', '+353 87 100 0070', '19 Cabra Rd, Dublin 7', '2024-09-09'),
('Micheal', 'Scully', 'micheal.scully@email.com', '+353 86 100 0071', '36 Kyrls Quay, Cork', '2024-09-17'),
('Siobhan', 'Cullen', 'siobhan.cullen@email.com', '+353 85 100 0072', '14 Mainguard St, Galway', '2024-09-25'),
('Fergal', 'Hennessy', 'fergal.hennessy@email.com', '+353 87 100 0073', '28 Roxboro Rd, Limerick', '2024-10-03'),
('Attracta', 'Maguire', 'attracta.maguire@email.com', '+353 86 100 0074', '7 Glasnevin Ave, Dublin 9', '2024-10-11'),
('Colmcille', 'OSullivan', 'colmcille.osullivan@email.com', '+353 85 100 0075', '41 Barrack St, Cork', '2024-10-19'),
('Rionach', 'Creagh', 'rionach.creagh@email.com', '+353 87 100 0076', '9 Abbeygate St, Galway', '2024-10-27'),
('Diarmait', 'Buckley', 'diarmait.buckley@email.com', '+353 86 100 0077', '55 Ballinacurra, Limerick', '2024-11-04'),
('Nuala', 'Thornton', 'nuala.thornton@email.com', '+353 85 100 0078', '23 Clontarf Rd, Dublin 3', '2024-11-12'),
('Proinsias', 'Henchy', 'proinsias.henchy@email.com', '+353 87 100 0079', '13 Morrison Quay, Cork', '2024-11-20'),
('Gobnait', 'Fahy', 'gobnait.fahy@email.com', '+353 86 100 0080', '31 Prospect Hill, Galway', '2024-11-28');

-- ============================================================
-- PRODUCTS (50 records)
-- ============================================================

INSERT INTO products (product_name, price, stock_quantity, category_id, supplier_id) VALUES
('Samsung Galaxy A54 Smartphone', 399.99, 85, 1, 1),
('Apple AirPods Pro', 249.99, 120, 1, 11),
('Lenovo IdeaPad Laptop 15"', 649.99, 40, 1, 11),
('Sony WH-1000XM5 Headphones', 299.99, 60, 1, 1),
('Anker PowerCore 20000 Power Bank', 49.99, 200, 1, 11),
('Mens Classic Slim Fit Jeans', 49.99, 150, 2, 2),
('Womens Oversized Hoodie', 39.99, 180, 2, 12),
('Mens Formal Oxford Shirt', 34.99, 130, 2, 2),
('Womens Floral Summer Dress', 44.99, 160, 2, 12),
('Unisex Running Trainers', 79.99, 90, 2, 2),
('Instant Pot Duo 7-in-1 Pressure Cooker', 89.99, 55, 3, 13),
('Ninja Air Fryer 4.7L', 99.99, 70, 3, 3),
('KitchenAid Hand Mixer', 59.99, 45, 3, 13),
('Non-Stick Frying Pan Set (3pc)', 39.99, 100, 3, 3),
('Bamboo Cutting Board Set', 24.99, 120, 3, 13),
('Yoga Mat Premium Non-Slip', 34.99, 110, 4, 4),
('Adjustable Dumbbell Set 20kg', 89.99, 35, 4, 14),
('Cycling Helmet Adult', 54.99, 65, 4, 4),
('Running Water Bottle 1L', 19.99, 200, 4, 14),
('Resistance Band Set (5pc)', 24.99, 150, 4, 4),
('CeraVe Moisturising Cream 454g', 18.99, 200, 5, 5),
('Ordinary Niacinamide 10% Serum', 9.99, 250, 5, 15),
('Maybelline Fit Me Foundation', 12.99, 180, 5, 5),
('Dove Body Wash 500ml', 6.99, 300, 5, 15),
('Gillette Fusion Razor', 14.99, 160, 5, 5),
('Atomic Habits by James Clear', 14.99, 90, 6, 6),
('The Psychology of Money', 13.99, 85, 6, 6),
('Harry Potter Complete Box Set', 79.99, 40, 6, 6),
('Leaving Cert Maths Higher Level', 24.99, 60, 6, 6),
('The Midnight Library by Matt Haig', 11.99, 75, 6, 6),
('LEGO Classic Brick Box 484pc', 44.99, 70, 7, 7),
('Monopoly Board Game', 29.99, 95, 7, 7),
('Nerf Elite 2.0 Blaster', 34.99, 80, 7, 7),
('Barbie Dreamhouse Playset', 129.99, 30, 7, 7),
('Hot Wheels 20 Car Gift Pack', 19.99, 110, 7, 7),
('Kelloggs Corn Flakes 750g', 4.49, 300, 8, 8),
('Nescafe Gold Blend Coffee 200g', 8.99, 250, 8, 8),
('Tayto Cheese & Onion 12 Pack', 6.99, 200, 8, 8),
('Californian Almonds 500g', 9.99, 180, 8, 8),
('Ballygowan Sparkling Water 6 Pack', 5.49, 220, 8, 8),
('IKEA KALLAX Shelf Unit', 149.99, 25, 9, 9),
('Office Ergonomic Chair', 199.99, 20, 9, 9),
('Wooden Coffee Table', 179.99, 15, 9, 9),
('3-Seater Sofa Grey Fabric', 599.99, 8, 9, 9),
('Bedside Table with Drawer', 89.99, 30, 9, 9),
('Halfords Car Phone Mount', 14.99, 140, 10, 10),
('Bosch Car Battery 063', 89.99, 25, 10, 10),
('Turtle Wax Car Polish 500ml', 12.99, 100, 10, 10),
('Michelin Wiper Blades Pair', 24.99, 85, 10, 10),
('Ring Automotive Jump Starter', 49.99, 45, 10, 10);

-- ============================================================
-- ORDERS (220 records)
-- ============================================================

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2023-02-10', 'delivered', 449.98),
(2, '2023-02-15', 'delivered', 89.98),
(3, '2023-02-20', 'delivered', 649.99),
(4, '2023-03-01', 'delivered', 129.98),
(5, '2023-03-05', 'delivered', 299.99),
(6, '2023-03-12', 'delivered', 74.98),
(7, '2023-03-18', 'delivered', 49.99),
(8, '2023-03-25', 'delivered', 89.99),
(9, '2023-04-02', 'delivered', 199.99),
(10, '2023-04-10', 'delivered', 44.99),
(11, '2023-04-15', 'delivered', 399.99),
(12, '2023-04-20', 'delivered', 79.99),
(13, '2023-04-28', 'delivered', 249.99),
(14, '2023-05-03', 'delivered', 59.99),
(15, '2023-05-10', 'delivered', 34.99),
(16, '2023-05-15', 'delivered', 149.99),
(17, '2023-05-22', 'delivered', 89.99),
(18, '2023-05-28', 'delivered', 24.99),
(19, '2023-06-05', 'delivered', 599.99),
(20, '2023-06-10', 'delivered', 44.99),
(21, '2023-06-18', 'delivered', 179.99),
(22, '2023-06-25', 'delivered', 129.99),
(23, '2023-07-02', 'delivered', 99.99),
(24, '2023-07-08', 'delivered', 49.99),
(25, '2023-07-15', 'delivered', 89.99),
(26, '2023-07-22', 'delivered', 39.99),
(27, '2023-07-28', 'delivered', 299.99),
(28, '2023-08-04', 'delivered', 19.99),
(29, '2023-08-10', 'delivered', 649.99),
(30, '2023-08-18', 'delivered', 79.99),
(1, '2023-08-25', 'delivered', 249.99),
(2, '2023-09-01', 'delivered', 34.99),
(3, '2023-09-08', 'delivered', 89.99),
(4, '2023-09-15', 'delivered', 149.99),
(5, '2023-09-22', 'delivered', 59.99),
(6, '2023-09-28', 'delivered', 24.99),
(7, '2023-10-05', 'delivered', 399.99),
(8, '2023-10-12', 'delivered', 44.99),
(9, '2023-10-18', 'delivered', 179.99),
(10, '2023-10-25', 'delivered', 99.99),
(11, '2023-11-01', 'delivered', 49.99),
(12, '2023-11-08', 'delivered', 89.99),
(13, '2023-11-15', 'delivered', 39.99),
(14, '2023-11-22', 'delivered', 299.99),
(15, '2023-11-28', 'delivered', 19.99),
(16, '2023-12-05', 'delivered', 649.99),
(17, '2023-12-12', 'delivered', 79.99),
(18, '2023-12-18', 'delivered', 249.99),
(19, '2023-12-22', 'delivered', 34.99),
(20, '2023-12-28', 'delivered', 89.99),
(21, '2024-01-05', 'delivered', 149.99),
(22, '2024-01-10', 'delivered', 59.99),
(23, '2024-01-18', 'delivered', 24.99),
(24, '2024-01-25', 'delivered', 399.99),
(25, '2024-02-01', 'delivered', 44.99),
(26, '2024-02-08', 'delivered', 179.99),
(27, '2024-02-15', 'delivered', 99.99),
(28, '2024-02-22', 'delivered', 49.99),
(29, '2024-02-28', 'delivered', 89.99),
(30, '2024-03-06', 'delivered', 39.99),
(31, '2024-03-12', 'delivered', 299.99),
(32, '2024-03-18', 'delivered', 19.99),
(33, '2024-03-25', 'delivered', 649.99),
(34, '2024-04-01', 'delivered', 79.99),
(35, '2024-04-08', 'delivered', 249.99),
(36, '2024-04-15', 'delivered', 34.99),
(37, '2024-04-22', 'delivered', 89.99),
(38, '2024-04-28', 'delivered', 149.99),
(39, '2024-05-05', 'delivered', 59.99),
(40, '2024-05-12', 'delivered', 24.99),
(41, '2024-05-18', 'delivered', 399.99),
(42, '2024-05-25', 'delivered', 44.99),
(43, '2024-06-01', 'delivered', 179.99),
(44, '2024-06-08', 'delivered', 99.99),
(45, '2024-06-15', 'delivered', 49.99),
(46, '2024-06-22', 'delivered', 89.99),
(47, '2024-06-28', 'delivered', 39.99),
(48, '2024-07-05', 'delivered', 299.99),
(49, '2024-07-12', 'delivered', 19.99),
(50, '2024-07-18', 'delivered', 649.99),
(51, '2024-07-25', 'shipped', 79.99),
(52, '2024-08-01', 'shipped', 249.99),
(53, '2024-08-08', 'shipped', 34.99),
(54, '2024-08-15', 'shipped', 89.99),
(55, '2024-08-22', 'shipped', 149.99),
(56, '2024-08-28', 'shipped', 59.99),
(57, '2024-09-04', 'shipped', 24.99),
(58, '2024-09-11', 'shipped', 399.99),
(59, '2024-09-18', 'shipped', 44.99),
(60, '2024-09-25', 'shipped', 179.99),
(61, '2024-10-02', 'shipped', 99.99),
(62, '2024-10-09', 'shipped', 49.99),
(63, '2024-10-16', 'shipped', 89.99),
(64, '2024-10-23', 'shipped', 39.99),
(65, '2024-10-30', 'shipped', 299.99),
(66, '2024-11-06', 'shipped', 19.99),
(67, '2024-11-13', 'shipped', 649.99),
(68, '2024-11-20', 'shipped', 79.99),
(69, '2024-11-27', 'shipped', 249.99),
(70, '2024-12-04', 'pending', 34.99),
(71, '2024-12-11', 'pending', 89.99),
(72, '2024-12-18', 'pending', 149.99),
(73, '2024-12-22', 'pending', 59.99),
(74, '2024-12-28', 'pending', 24.99),
(75, '2025-01-04', 'pending', 399.99),
(76, '2025-01-10', 'pending', 44.99),
(77, '2025-01-17', 'pending', 179.99),
(78, '2025-01-24', 'pending', 99.99),
(79, '2025-01-31', 'pending', 49.99),
(80, '2025-02-07', 'pending', 89.99),
(1, '2025-02-14', 'pending', 39.99),
(2, '2025-02-21', 'pending', 299.99),
(3, '2025-02-28', 'pending', 19.99),
(4, '2025-03-07', 'pending', 649.99),
(5, '2025-03-14', 'pending', 79.99),
(6, '2025-03-21', 'pending', 249.99),
(7, '2025-03-28', 'pending', 34.99),
(8, '2025-04-04', 'pending', 89.99),
(9, '2025-04-11', 'delivered', 399.99),
(10, '2024-01-14', 'delivered', 249.98),
(11, '2024-01-19', 'delivered', 99.98),
(12, '2024-02-03', 'delivered', 599.99),
(13, '2024-02-09', 'delivered', 179.98),
(14, '2024-02-16', 'delivered', 89.98),
(15, '2024-02-23', 'delivered', 44.97),
(16, '2024-03-01', 'delivered', 129.98),
(17, '2024-03-08', 'delivered', 69.98),
(18, '2024-03-15', 'delivered', 299.98),
(19, '2024-03-22', 'delivered', 49.98),
(20, '2024-03-29', 'delivered', 89.97),
(21, '2024-04-05', 'delivered', 159.98),
(22, '2024-04-12', 'delivered', 39.98),
(23, '2024-04-19', 'delivered', 79.97),
(24, '2024-04-26', 'delivered', 199.98),
(25, '2024-05-03', 'delivered', 59.97),
(26, '2024-05-10', 'delivered', 119.98),
(27, '2024-05-17', 'delivered', 449.98),
(28, '2024-05-24', 'delivered', 29.98),
(29, '2024-05-31', 'delivered', 699.98),
(30, '2024-06-07', 'delivered', 109.98),
(31, '2024-06-14', 'delivered', 54.97),
(32, '2024-06-21', 'delivered', 389.98),
(33, '2024-06-28', 'delivered', 139.98),
(34, '2024-07-05', 'delivered', 74.97),
(35, '2024-07-12', 'delivered', 279.98),
(36, '2024-07-19', 'delivered', 44.98),
(37, '2024-07-26', 'delivered', 189.98),
(38, '2024-08-02', 'delivered', 64.97),
(39, '2024-08-09', 'delivered', 329.98),
(40, '2024-08-16', 'delivered', 84.98),
(41, '2024-08-23', 'shipped', 149.97),
(42, '2024-08-30', 'shipped', 419.98),
(43, '2024-09-06', 'shipped', 34.97),
(44, '2024-09-13', 'shipped', 259.98),
(45, '2024-09-20', 'shipped', 94.98),
(46, '2024-09-27', 'shipped', 174.97),
(47, '2024-10-04', 'shipped', 459.98),
(48, '2024-10-11', 'shipped', 24.97),
(49, '2024-10-18', 'shipped', 309.98),
(50, '2024-10-25', 'shipped', 114.98),
(51, '2024-11-01', 'shipped', 219.97),
(52, '2024-11-08', 'pending', 499.98),
(53, '2024-11-15', 'pending', 44.97),
(54, '2024-11-22', 'pending', 269.98),
(55, '2024-11-29', 'pending', 104.98),
(56, '2024-12-06', 'pending', 184.97),
(57, '2024-12-13', 'pending', 469.98),
(58, '2024-12-20', 'pending', 34.97),
(59, '2024-12-27', 'pending', 319.98),
(60, '2025-01-03', 'pending', 124.98),
(61, '2025-01-10', 'pending', 229.97),
(62, '2025-01-17', 'pending', 509.98),
(63, '2025-01-24', 'pending', 54.97),
(64, '2025-01-31', 'pending', 279.98),
(65, '2025-02-07', 'pending', 114.98),
(66, '2025-02-14', 'pending', 194.97),
(67, '2025-02-21', 'pending', 479.98),
(68, '2025-02-28', 'pending', 44.97),
(69, '2025-03-07', 'pending', 289.98),
(70, '2025-03-14', 'pending', 134.98),
(71, '2025-03-21', 'delivered', 239.97),
(72, '2025-03-28', 'delivered', 519.98),
(73, '2025-04-04', 'delivered', 64.97),
(74, '2025-04-11', 'delivered', 289.98),
(1, '2023-05-20', 'delivered', 79.98),
(2, '2023-06-15', 'delivered', 119.97),
(3, '2023-07-10', 'delivered', 209.98),
(4, '2023-08-05', 'delivered', 54.97),
(5, '2023-09-01', 'delivered', 349.98),
(6, '2023-10-01', 'delivered', 94.97),
(7, '2023-11-01', 'delivered', 164.98),
(8, '2023-12-01', 'delivered', 29.97),
(9, '2024-01-20', 'delivered', 429.98),
(10, '2024-02-20', 'delivered', 74.97),
(11, '2024-03-20', 'delivered', 144.98),
(12, '2024-04-20', 'delivered', 214.97),
(13, '2024-05-20', 'delivered', 494.98),
(14, '2024-06-20', 'delivered', 84.97),
(15, '2024-07-20', 'delivered', 154.98),
(16, '2024-08-20', 'shipped', 224.97),
(17, '2024-09-20', 'shipped', 504.98),
(18, '2024-10-20', 'shipped', 94.97),
(19, '2024-11-20', 'pending', 164.98),
(20, '2024-12-20', 'pending', 234.97);

-- ============================================================
-- ORDER ITEMS (250 records)
-- ============================================================

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 399.99),(1, 5, 1, 49.99),
(2, 6, 1, 49.99),(2, 25, 2, 14.99),
(3, 3, 1, 649.99),
(4, 9, 1, 44.99),(4, 20, 1, 24.99),(4, 24, 1, 6.99),
(5, 4, 1, 299.99),
(6, 7, 1, 39.99),(6, 15, 1, 24.99),(6, 36, 2, 4.49),
(7, 5, 1, 49.99),
(8, 11, 1, 89.99),
(9, 42, 1, 199.99),
(10, 9, 1, 44.99),
(11, 1, 1, 399.99),
(12, 10, 1, 79.99),
(13, 2, 1, 249.99),
(14, 14, 1, 39.99),(14, 36, 2, 4.49),
(15, 16, 1, 34.99),
(16, 41, 1, 149.99),
(17, 11, 1, 89.99),
(18, 18, 1, 54.99),(18, 19, 1, 19.99),
(19, 44, 1, 599.99),
(20, 9, 1, 44.99),
(21, 43, 1, 179.99),
(22, 34, 1, 129.99),
(23, 12, 1, 99.99),
(24, 5, 1, 49.99),
(25, 11, 1, 89.99),
(26, 7, 1, 39.99),
(27, 4, 1, 299.99),
(28, 28, 1, 19.99),
(29, 3, 1, 649.99),
(30, 10, 1, 79.99),
(31, 2, 1, 249.99),
(32, 15, 1, 24.99),(32, 36, 2, 4.49),
(33, 11, 1, 89.99),
(34, 41, 1, 149.99),
(35, 14, 1, 39.99),(35, 36, 2, 4.49),
(36, 18, 1, 54.99),(36, 19, 1, 19.99),
(37, 1, 1, 399.99),
(38, 9, 1, 44.99),
(39, 43, 1, 179.99),
(40, 12, 1, 99.99),
(41, 5, 1, 49.99),
(42, 11, 1, 89.99),
(43, 7, 1, 39.99),
(44, 4, 1, 299.99),
(45, 28, 1, 19.99),
(46, 3, 1, 649.99),
(47, 10, 1, 79.99),
(48, 2, 1, 249.99),
(49, 15, 1, 24.99),(49, 36, 2, 4.49),
(50, 11, 1, 89.99),
(51, 41, 1, 149.99),
(52, 2, 1, 249.99),
(53, 16, 1, 34.99),
(54, 11, 1, 89.99),
(55, 41, 1, 149.99),
(56, 14, 1, 39.99),(56, 36, 2, 4.49),
(57, 18, 1, 54.99),(57, 19, 1, 19.99),
(58, 1, 1, 399.99),
(59, 9, 1, 44.99),
(60, 43, 1, 179.99),
(61, 12, 1, 99.99),
(62, 5, 1, 49.99),
(63, 11, 1, 89.99),
(64, 7, 1, 39.99),
(65, 4, 1, 299.99),
(66, 28, 1, 19.99),
(67, 3, 1, 649.99),
(68, 10, 1, 79.99),
(69, 2, 1, 249.99),
(70, 15, 1, 24.99),(70, 36, 2, 4.49),
(71, 11, 1, 89.99),
(72, 41, 1, 149.99),
(73, 14, 1, 39.99),(73, 36, 2, 4.49),
(74, 18, 1, 54.99),(74, 19, 1, 19.99),
(75, 1, 1, 399.99),
(76, 9, 1, 44.99),
(77, 43, 1, 179.99),
(78, 12, 1, 99.99),
(79, 5, 1, 49.99),
(80, 11, 1, 89.99),
(81, 7, 1, 39.99),
(82, 4, 1, 299.99),
(83, 28, 1, 19.99),
(84, 3, 1, 649.99),
(85, 10, 1, 79.99),
(86, 2, 1, 249.99),
(87, 15, 1, 24.99),(87, 36, 2, 4.49),
(88, 11, 1, 89.99),
(89, 41, 1, 149.99),
(90, 14, 1, 39.99),(90, 36, 2, 4.49),
(91, 1, 1, 399.99),
(92, 9, 1, 44.99),
(93, 43, 1, 179.99),
(94, 12, 1, 99.99),
(95, 5, 1, 49.99),
(96, 11, 1, 89.99),
(97, 7, 1, 39.99),
(98, 4, 1, 299.99),
(99, 28, 1, 19.99),
(100, 3, 1, 649.99),
(101, 10, 1, 79.99),
(102, 2, 1, 249.99),
(103, 15, 1, 24.99),(103, 36, 2, 4.49),
(104, 11, 1, 89.99),
(105, 41, 1, 149.99),
(106, 14, 1, 39.99),(106, 36, 2, 4.49),
(107, 18, 1, 54.99),(107, 19, 1, 19.99),
(108, 1, 1, 399.99),
(109, 9, 1, 44.99),
(110, 43, 1, 179.99),
(111, 12, 1, 99.99),
(112, 5, 1, 49.99),
(113, 11, 1, 89.99),
(114, 7, 1, 39.99),
(115, 4, 1, 299.99),
(116, 28, 1, 19.99),
(117, 3, 1, 649.99),
(118, 10, 1, 79.99),
(119, 2, 1, 249.99),
(120, 1, 1, 399.99),(120, 5, 2, 49.99),
(121, 2, 1, 249.99),(121, 4, 1, 249.99),
(122, 11, 1, 89.99),(122, 12, 1, 99.99),
(123, 3, 1, 649.99),
(124, 6, 2, 49.99),(124, 9, 1, 44.99),(124, 24, 3, 6.99),
(125, 1, 1, 399.99),
(126, 43, 1, 179.99),(126, 15, 2, 24.99),
(127, 4, 1, 299.99),(127, 19, 2, 19.99),(127, 20, 1, 24.99),
(128, 28, 1, 19.99),(128, 36, 1, 4.49),
(129, 3, 1, 649.99),(129, 5, 1, 49.99),
(130, 10, 1, 79.99),(130, 7, 1, 39.99),
(131, 16, 1, 34.99),(131, 20, 1, 24.99),
(132, 1, 1, 399.99),
(133, 3, 1, 649.99),
(134, 10, 1, 79.99),(134, 7, 1, 39.99),
(135, 2, 1, 249.99),(135, 5, 1, 49.99),
(136, 44, 1, 599.99),
(137, 11, 1, 89.99),(137, 14, 1, 39.99),
(138, 9, 1, 44.99),(138, 24, 3, 6.99),
(139, 4, 1, 299.99),(139, 19, 1, 19.99),
(140, 42, 1, 199.99),(140, 16, 1, 34.99),
(141, 17, 1, 89.99),(141, 19, 3, 19.99),
(142, 1, 1, 399.99),(142, 2, 1, 249.99),
(143, 16, 1, 34.99),(143, 19, 1, 19.99),
(144, 4, 1, 299.99),
(145, 11, 1, 89.99),(145, 12, 1, 99.99),
(146, 2, 1, 249.99),(146, 5, 1, 49.99),
(147, 3, 1, 649.99),
(148, 7, 1, 39.99),(148, 9, 1, 44.99),
(149, 10, 1, 79.99),
(150, 12, 1, 99.99),(150, 14, 1, 39.99),
(151, 1, 1, 399.99),
(152, 2, 1, 249.99),(152, 4, 1, 249.99),
(153, 16, 1, 34.99),(153, 20, 1, 24.99),
(154, 3, 1, 649.99),
(155, 11, 1, 89.99),(155, 12, 1, 99.99),
(156, 2, 1, 249.99),(156, 5, 1, 49.99),
(157, 3, 1, 649.99),
(158, 7, 1, 39.99),(158, 9, 1, 44.99),
(159, 10, 1, 79.99),
(160, 12, 1, 99.99),(160, 14, 1, 39.99),
(161, 1, 1, 399.99),
(162, 2, 1, 249.99),(162, 4, 1, 249.99),
(163, 16, 1, 34.99),(163, 20, 1, 24.99),
(164, 3, 1, 649.99),
(165, 11, 1, 89.99),(165, 12, 1, 99.99),
(166, 2, 1, 249.99),(166, 5, 1, 49.99),
(167, 3, 1, 649.99),
(168, 7, 1, 39.99),(168, 9, 1, 44.99),
(169, 10, 1, 79.99),
(170, 12, 1, 99.99),(170, 14, 1, 39.99),
(171, 1, 1, 399.99),
(172, 2, 1, 249.99),(172, 5, 1, 49.99),
(173, 16, 1, 34.99),(173, 19, 1, 19.99),
(174, 3, 1, 649.99),
(175, 11, 1, 89.99),(175, 12, 1, 99.99),
(176, 2, 1, 249.99),(176, 4, 1, 249.99),
(177, 3, 1, 649.99),
(178, 7, 1, 39.99),(178, 9, 1, 44.99),
(179, 10, 1, 79.99),(179, 25, 1, 14.99),
(180, 12, 1, 99.99),(180, 22, 2, 9.99),
(181, 1, 1, 399.99),(181, 5, 1, 49.99),
(182, 6, 1, 49.99),(182, 25, 2, 14.99),
(183, 3, 1, 649.99),
(184, 9, 1, 44.99),(184, 20, 1, 24.99),(184, 24, 1, 6.99),
(185, 4, 1, 299.99),
(186, 7, 1, 39.99),(186, 15, 1, 24.99),
(187, 5, 1, 49.99),
(188, 11, 1, 89.99),
(189, 42, 1, 199.99),
(190, 9, 1, 44.99),
(191, 1, 1, 399.99),
(192, 10, 1, 79.99),
(193, 2, 1, 249.99),
(194, 14, 1, 39.99),(194, 36, 2, 4.49),
(195, 16, 1, 34.99),
(196, 41, 1, 149.99),
(197, 11, 1, 89.99),
(198, 18, 1, 54.99),(198, 19, 1, 19.99),
(199, 44, 1, 599.99),
(200, 9, 1, 44.99),
(201, 43, 1, 179.99),
(202, 34, 1, 129.99),
(203, 12, 1, 99.99),
(204, 5, 1, 49.99),
(205, 11, 1, 89.99),
(206, 7, 1, 39.99),
(207, 4, 1, 299.99),
(208, 28, 1, 19.99),
(209, 3, 1, 649.99),
(210, 10, 1, 79.99),
(211, 2, 1, 249.99),
(212, 1, 1, 399.99),(212, 5, 1, 49.99),
(213, 11, 1, 89.99),(213, 14, 1, 39.99),
(214, 9, 1, 44.99),
(215, 4, 1, 299.99),
(216, 3, 1, 649.99),
(217, 10, 1, 79.99),
(218, 2, 1, 249.99),
(219, 12, 1, 99.99),
(220, 43, 1, 179.99),(220, 16, 1, 34.99);

-- ============================================================
-- REVIEWS (210 records)
-- ============================================================

INSERT INTO reviews (customer_id, product_id, rating, review_text, review_date) VALUES
(1, 1, 5, 'Brilliant phone, very fast and great camera. Totally worth the price.', '2023-02-20'),
(2, 6, 4, 'Good quality jeans, fit well and comfortable for everyday wear.', '2023-02-25'),
(3, 3, 5, 'Incredible laptop, handles everything I throw at it no problem.', '2023-03-01'),
(4, 9, 4, 'Pretty dress, arrived quickly and the material is lovely.', '2023-03-10'),
(5, 4, 5, 'Best headphones I have ever owned, noise cancelling is superb.', '2023-03-15'),
(6, 7, 3, 'Hoodie is okay, sizing runs a bit large so order down.', '2023-03-20'),
(7, 5, 4, 'Great power bank, charges my phone multiple times on one charge.', '2023-03-25'),
(8, 11, 5, 'This pressure cooker has changed the way I cook, absolutely love it.', '2023-04-05'),
(9, 42, 4, 'Very comfortable office chair, back support is excellent.', '2023-04-15'),
(10, 9, 5, 'Gorgeous dress, perfect for summer. Got loads of compliments.', '2023-04-20'),
(11, 1, 4, 'Solid smartphone, good value for money compared to other brands.', '2023-04-25'),
(12, 10, 3, 'Trainers are decent but took a while to break in.', '2023-04-30'),
(13, 2, 5, 'AirPods Pro are incredible, sound quality is top notch.', '2023-05-08'),
(14, 14, 4, 'Good frying pan set, non-stick coating works really well.', '2023-05-12'),
(15, 16, 5, 'Best yoga mat I have used, grip is excellent even when sweaty.', '2023-05-18'),
(16, 41, 4, 'Shelf unit looks great, took a while to build but worth it.', '2023-05-25'),
(17, 11, 5, 'Air fryer is a game changer, chips come out perfect every time.', '2023-06-02'),
(18, 18, 4, 'Helmet fits well and feels very safe on the road.', '2023-06-08'),
(19, 44, 5, 'Sofa is stunning, delivery was fast and assembly was easy.', '2023-06-15'),
(20, 9, 4, 'Nice dress, good quality for the price.', '2023-06-20'),
(21, 43, 3, 'Table looks okay in person but the colour is slightly different from photos.', '2023-06-28'),
(22, 34, 5, 'My daughter loves this playset, plays with it every single day.', '2023-07-05'),
(23, 12, 4, 'Air fryer works brilliantly, very easy to use and clean.', '2023-07-12'),
(24, 5, 5, 'Power bank is excellent, very reliable on long trips.', '2023-07-18'),
(25, 11, 4, 'Pressure cooker is great, makes cooking dinner so much faster.', '2023-07-25'),
(26, 7, 5, 'Love this hoodie, so soft and warm. Perfect for winter.', '2023-08-01'),
(27, 4, 5, 'Sony headphones are phenomenal, worth every cent.', '2023-08-08'),
(28, 28, 4, 'Great box set, packaging is really nice and books are good quality.', '2023-08-15'),
(29, 3, 5, 'Laptop is brilliant, very fast and battery life is excellent.', '2023-08-22'),
(30, 10, 4, 'Running shoes are comfortable and look great.', '2023-08-28'),
(1, 2, 5, 'AirPods Pro are worth every penny, absolutely love them.', '2023-09-05'),
(2, 15, 3, 'Cutting board is okay, nothing special but does the job.', '2023-09-10'),
(3, 11, 4, 'Pressure cooker is very good, cuts cooking time in half.', '2023-09-18'),
(4, 41, 5, 'Shelf is sturdy and looks amazing, very happy with purchase.', '2023-09-22'),
(5, 14, 4, 'Pans are good quality, heat evenly and are easy to clean.', '2023-09-28'),
(6, 18, 5, 'Cycling helmet is excellent quality, feels very secure.', '2023-10-05'),
(7, 1, 4, 'Good phone, camera is brilliant and battery lasts all day.', '2023-10-12'),
(8, 9, 3, 'Dress is nice but took nearly two weeks to arrive.', '2023-10-18'),
(9, 43, 5, 'Coffee table looks amazing in my living room, great quality.', '2023-10-25'),
(10, 12, 4, 'Air fryer is really good, food comes out crispy and delicious.', '2023-11-01'),
(11, 5, 5, 'Excellent power bank, never lets me down on long days.', '2023-11-08'),
(12, 11, 4, 'Pressure cooker is fantastic, makes meal prep so easy.', '2023-11-15'),
(13, 7, 3, 'Hoodie is average, expected better quality for the price.', '2023-11-22'),
(14, 4, 5, 'Best headphones on the market, noise cancelling is unreal.', '2023-11-28'),
(15, 28, 4, 'Harry Potter box set is lovely, great gift for any fan.', '2023-12-05'),
(16, 3, 5, 'Laptop is fantastic, handles everything with ease.', '2023-12-12'),
(17, 10, 4, 'Trainers are great, very comfortable and stylish.', '2023-12-18'),
(18, 2, 5, 'AirPods are amazing, use them every day for work calls.', '2023-12-22'),
(19, 15, 3, 'Cutting board is fine, a bit small but good quality wood.', '2023-12-28'),
(20, 11, 4, 'Pressure cooker is really handy, use it several times a week.', '2024-01-05'),
(21, 43, 4, 'Coffee table is nice, solid and well made.', '2024-01-10'),
(22, 12, 5, 'Brilliant air fryer, best purchase I have made in a long time.', '2024-01-18'),
(23, 5, 4, 'Power bank is reliable and charges quickly.', '2024-01-25'),
(24, 1, 5, 'Samsung Galaxy is brilliant, very happy with the purchase.', '2024-02-01'),
(25, 4, 4, 'Good headphones, comfortable for long listening sessions.', '2024-02-08'),
(26, 7, 5, 'Hoodie is so cosy, wear it constantly around the house.', '2024-02-15'),
(27, 3, 4, 'Laptop is very good, a bit heavy but great performance.', '2024-02-22'),
(28, 28, 5, 'Harry Potter set is beautiful, perfect gift for my nephew.', '2024-02-28'),
(29, 10, 3, 'Trainers are okay, comfortable but the sole wore down quickly.', '2024-03-06'),
(30, 11, 5, 'Pressure cooker is incredible, makes the best stews.', '2024-03-12'),
(31, 4, 4, 'Headphones are excellent, great sound and comfortable fit.', '2024-03-18'),
(32, 28, 3, 'Box set is nice but one of the books had a bent cover.', '2024-03-25'),
(33, 3, 5, 'Laptop is top class, very fast and screen quality is brilliant.', '2024-04-01'),
(34, 10, 4, 'Nice trainers, fit true to size and very comfortable.', '2024-04-08'),
(35, 2, 5, 'AirPods Pro are class, crystal clear sound quality.', '2024-04-15'),
(36, 16, 3, 'Yoga mat is okay, grips well but a bit thin for my liking.', '2024-04-22'),
(37, 11, 5, 'Love this pressure cooker, use it several times a week.', '2024-04-28'),
(38, 9, 4, 'Lovely dress, great for a night out or casual wear.', '2024-05-05'),
(39, 43, 5, 'Coffee table is gorgeous, gets compliments from everyone.', '2024-05-12'),
(40, 12, 4, 'Air fryer is great, very easy to use and food is always crispy.', '2024-05-18'),
(41, 5, 5, 'Best power bank out there, lasts for days.', '2024-05-25'),
(42, 11, 4, 'Pressure cooker is very good, cuts down on cooking time.', '2024-06-01'),
(43, 7, 3, 'Hoodie is just average, nothing special about it.', '2024-06-08'),
(44, 4, 5, 'Headphones are phenomenal, worth every penny.', '2024-06-15'),
(45, 28, 4, 'Great box set, the books are in perfect condition.', '2024-06-22'),
(46, 3, 5, 'Brilliant laptop, handles everything without breaking a sweat.', '2024-06-28'),
(47, 10, 3, 'Trainers are decent but not as comfortable as expected.', '2024-07-05'),
(48, 2, 5, 'AirPods are absolutely brilliant, sound is incredible.', '2024-07-12'),
(49, 15, 4, 'Good cutting boards, nice and sturdy.', '2024-07-18'),
(50, 11, 5, 'Pressure cooker is fantastic, best kitchen gadget I own.', '2024-07-25'),
(51, 41, 4, 'Shelf looks great, fairly easy to put together.', '2024-08-01'),
(52, 2, 5, 'AirPods Pro are the best earphones I have ever used.', '2024-08-08'),
(53, 16, 4, 'Yoga mat is good, comfortable and non-slip surface.', '2024-08-15'),
(54, 11, 5, 'Pressure cooker is a must have for any kitchen.', '2024-08-22'),
(55, 41, 4, 'Shelf unit is solid and looks great in my bedroom.', '2024-08-28'),
(56, 14, 3, 'Pans are average, the non-stick started to wear off after a month.', '2024-09-04'),
(57, 18, 5, 'Helmet is excellent quality, very comfortable to wear.', '2024-09-11'),
(58, 1, 4, 'Good phone, great camera and battery lasts all day.', '2024-09-18'),
(59, 9, 5, 'Beautiful dress, exactly as pictured and lovely material.', '2024-09-25'),
(60, 43, 4, 'Coffee table is nice, good quality for the price.', '2024-10-02'),
(61, 12, 5, 'Air fryer is brilliant, chips and nuggets come out perfect.', '2024-10-09'),
(62, 5, 4, 'Power bank is great, very compact and charges fast.', '2024-10-15'),
(63, 11, 5, 'Pressure cooker is incredible, completely changed how I cook.', '2024-10-22'),
(64, 7, 4, 'Nice hoodie, soft material and great fit.', '2024-10-28'),
(65, 4, 5, 'Sony headphones are the best, amazing noise cancelling.', '2024-11-04'),
(66, 28, 3, 'Harry Potter set is decent but expected better packaging.', '2024-11-10'),
(67, 3, 5, 'Laptop is absolutely fantastic, very fast and reliable.', '2024-11-17'),
(68, 10, 4, 'Trainers are very comfortable and look stylish.', '2024-11-24'),
(69, 2, 5, 'AirPods Pro are worth every penny, sound is incredible.', '2024-11-28'),
(70, 15, 3, 'Cutting board is okay but smaller than I expected.', '2024-12-05'),
(71, 11, 4, 'Pressure cooker is very handy, great for batch cooking.', '2024-12-12'),
(72, 41, 5, 'Shelf unit looks brilliant, great storage solution.', '2024-12-18'),
(73, 14, 4, 'Frying pans are good quality and heat up quickly.', '2024-12-22'),
(74, 18, 5, 'Helmet is superb quality, very happy with this purchase.', '2024-12-28'),
(75, 1, 4, 'Samsung is a good phone, nice screen and great performance.', '2025-01-05'),
(76, 9, 5, 'Absolutely love this dress, so comfortable and stylish.', '2025-01-10'),
(77, 43, 4, 'Coffee table is lovely, well made and easy to assemble.', '2025-01-17'),
(78, 12, 5, 'Air fryer is brilliant, use it every single day.', '2025-01-24'),
(79, 5, 4, 'Great power bank, very reliable for travelling.', '2025-01-31'),
(80, 11, 5, 'Pressure cooker is fantastic, makes cooking so much easier.', '2025-02-07'),
(1, 4, 4, 'Headphones are great but the case feels a bit cheap.', '2025-02-14'),
(2, 4, 5, 'Absolutely love these headphones, sound quality is unreal.', '2025-02-21'),
(3, 28, 4, 'Harry Potter set is lovely, great condition and fast delivery.', '2025-02-28'),
(4, 3, 5, 'Laptop is top class, best purchase I have made in years.', '2025-03-07'),
(5, 10, 4, 'Trainers are comfortable and fit true to size.', '2025-03-14'),
(6, 2, 5, 'AirPods Pro are brilliant, use them for everything.', '2025-03-21'),
(7, 15, 3, 'Cutting board is fine but nothing extraordinary.', '2025-03-28'),
(8, 11, 5, 'Pressure cooker is the best kitchen gadget I have ever bought.', '2025-04-04'),
(9, 1, 4, 'Good phone, great value for money.', '2025-04-10'),
(10, 26, 5, 'Atomic Habits is an incredible book, changed my life.', '2025-01-08'),
(11, 27, 4, 'Great read, very insightful and easy to understand.', '2025-01-15'),
(12, 31, 5, 'Kids love the LEGO set, keeps them busy for hours.', '2025-01-22'),
(13, 32, 4, 'Monopoly is a classic, great fun for the whole family.', '2025-01-29'),
(14, 21, 5, 'CeraVe is the best moisturiser, my skin has never looked better.', '2025-02-05'),
(15, 22, 4, 'Niacinamide serum is brilliant, pores look much smaller.', '2025-02-12'),
(16, 17, 5, 'Dumbbell set is excellent quality, very solid and well made.', '2025-02-19'),
(17, 46, 4, 'Car phone mount is handy and clips on easily.', '2025-02-26'),
(18, 48, 5, 'Wiper blades are great, fit perfectly and clear brilliantly.', '2025-03-05'),
(19, 19, 4, 'Water bottle is brilliant, keeps drinks cold for hours.', '2025-03-12'),
(20, 37, 5, 'Best coffee I have ever bought online, tastes amazing.', '2025-03-19'),
(21, 26, 4, 'Atomic Habits is a must read for anyone wanting to improve.', '2025-03-26'),
(22, 31, 5, 'LEGO set is fantastic, great value for the amount of pieces.', '2025-04-02'),
(23, 21, 4, 'CeraVe moisturiser is great, skin feels smooth and hydrated.', '2025-04-09'),
(24, 17, 5, 'Dumbbells are top quality, solid and no wobble at all.', '2023-03-05'),
(25, 22, 3, 'Serum is okay, did not notice much difference after a month.', '2023-03-12'),
(26, 32, 4, 'Monopoly is great, brilliant for family game nights.', '2023-03-19'),
(27, 46, 5, 'Phone mount is excellent, very secure and easy to adjust.', '2023-03-26'),
(28, 19, 4, 'Water bottle is good quality and keeps water cold all day.', '2023-04-02'),
(29, 37, 3, 'Coffee is decent but not as strong as I like.', '2023-04-09'),
(30, 26, 5, 'Atomic Habits is brilliant, highly recommend to everyone.', '2023-04-16'),
(31, 27, 4, 'Psychology of Money is a great read, very eye opening.', '2023-04-23'),
(32, 21, 5, 'CeraVe is amazing, my dry skin has completely cleared up.', '2023-04-30'),
(33, 48, 4, 'Wiper blades fit perfectly and work great in heavy rain.', '2023-05-07'),
(34, 31, 5, 'LEGO is brilliant, my son spent the whole day building it.', '2023-05-14'),
(35, 22, 4, 'Niacinamide serum is good, skin is noticeably clearer.', '2023-05-21'),
(36, 17, 3, 'Dumbbells are okay but the grip could be better.', '2023-05-28'),
(37, 46, 5, 'Car mount is excellent, very sturdy and easy to use.', '2023-06-04'),
(38, 19, 4, 'Water bottle is great, no leaks and easy to carry.', '2023-06-11'),
(39, 37, 5, 'Nescafe Gold is my favourite coffee, rich and smooth.', '2023-06-18'),
(40, 32, 4, 'Monopoly is a classic game, great fun for all ages.', '2023-06-25'),
(41, 26, 5, 'Atomic Habits is a life changing book, cannot recommend enough.', '2023-07-02'),
(42, 27, 3, 'Book is interesting but a bit repetitive in places.', '2023-07-09'),
(43, 21, 5, 'CeraVe is incredible, best skincare product I have ever used.', '2023-07-16'),
(44, 48, 4, 'Wiper blades are decent quality and easy to fit.', '2023-07-23'),
(45, 31, 5, 'LEGO set is amazing, great quality and so many pieces.', '2023-07-30'),
(46, 22, 4, 'Serum works well, noticed improvements in my skin after two weeks.', '2023-08-06'),
(47, 17, 5, 'Dumbbells are excellent, solid build and comfortable grip.', '2023-08-13'),
(48, 46, 4, 'Car phone mount is great, does exactly what it says.', '2023-08-20'),
(49, 19, 5, 'Water bottle is brilliant, love the design and it keeps drinks cold.', '2023-08-27'),
(50, 37, 4, 'Good coffee, very smooth and not too bitter.', '2023-09-03'),
(51, 32, 5, 'Monopoly never gets old, brilliant for the whole family.', '2023-09-10'),
(52, 26, 4, 'Atomic Habits is a really good book, very practical advice.', '2023-09-17'),
(53, 27, 5, 'Psychology of Money is excellent, changed how I think about finances.', '2023-09-24'),
(54, 21, 4, 'CeraVe is great, skin feels much more hydrated since using it.', '2023-10-01'),
(55, 48, 5, 'Wiper blades are superb, clear the windscreen perfectly.', '2023-10-08'),
(56, 31, 4, 'LEGO set is great, kept the kids entertained all afternoon.', '2023-10-15'),
(57, 22, 3, 'Serum is alright, took a long time to see any results.', '2023-10-22'),
(58, 17, 5, 'Dumbbells are top quality, very happy with this purchase.', '2023-10-29'),
(59, 46, 4, 'Car mount is solid and holds the phone securely.', '2023-11-05'),
(60, 19, 5, 'Water bottle is brilliant, perfect size for the gym.', '2023-11-12'),
(61, 37, 4, 'Nescafe Gold is a great coffee for everyday use.', '2023-11-19'),
(62, 32, 5, 'Monopoly is brilliant, so much fun for game nights.', '2023-11-26'),
(63, 26, 4, 'Atomic Habits changed the way I think about daily routines.', '2023-12-03'),
(64, 27, 3, 'Good book but some sections felt too long.', '2023-12-10'),
(65, 21, 5, 'CeraVe is the only moisturiser I will ever use now.', '2023-12-17'),
(66, 48, 4, 'Wiper blades are good quality and easy to install.', '2023-12-24'),
(67, 31, 5, 'LEGO is fantastic, my kids were delighted with it.', '2023-12-28'),
(68, 22, 4, 'Niacinamide serum works well, skin looks healthier.', '2024-01-04'),
(69, 17, 5, 'Dumbbells are brilliant, exactly what I needed for home workouts.', '2024-01-11'),
(70, 46, 4, 'Car mount is handy and very easy to install.', '2024-01-18'),
(71, 19, 5, 'Water bottle is superb, no leaks and keeps water cold.', '2024-01-25'),
(72, 37, 3, 'Coffee is okay, prefer a stronger blend myself.', '2024-02-01'),
(73, 32, 5, 'Monopoly is a household favourite, brilliant game.', '2024-02-08'),
(74, 26, 4, 'Atomic Habits is a very practical and motivating book.', '2024-02-15'),
(75, 27, 5, 'Psychology of Money is brilliant, highly recommend to everyone.', '2024-02-22'),
(76, 21, 4, 'CeraVe moisturiser is great, my skin loves it.', '2024-02-28'),
(77, 48, 5, 'Wiper blades are excellent, clear the screen even in heavy rain.', '2024-03-06'),
(78, 31, 4, 'LEGO set is good, well packaged and great value.', '2024-03-13'),
(79, 22, 5, 'Serum is brilliant, my skin has improved so much since using it.', '2024-03-20'),
(80, 17, 4, 'Dumbbells are solid and well made, great for home use.', '2024-03-27');

-- ============================================================
-- END OF FIAFOX DATABASE SCRIPT
-- ============================================================
-- ============================================================
-- FiaFox E-Commerce Database
-- Task Three: Advanced SQL & Analytics
-- Student: David Omozokpia | B00173371
-- Module: COMP H2036 - Advanced Database and Analytics
-- ============================================================


-- ============================================================
-- Q1: Non-Correlated Subquery (5 Marks)
-- ============================================================
-- Scenario: FiaFox wants to identify all products that are
-- priced above the overall average product price, so the
-- marketing team can target premium listings for promotions.

SELECT
    product_id,
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- EXPLAIN ANALYZE version:
EXPLAIN ANALYZE
SELECT
    product_id,
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);


-- ============================================================
-- Q2: Correlated Subquery (6 Marks)
-- ============================================================
-- Scenario: FiaFox wants to find each customer's most recent
-- order date to identify active versus inactive customers
-- for a targeted email re-engagement campaign.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    (
        SELECT MAX(o.order_date)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS last_order_date
FROM customers c
ORDER BY last_order_date DESC NULLS LAST;

-- EXPLAIN ANALYZE version:
EXPLAIN ANALYZE
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    (
        SELECT MAX(o.order_date)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS last_order_date
FROM customers c
ORDER BY last_order_date DESC NULLS LAST;


-- ============================================================
-- Q3: CTE (WITH) Query (6 Marks)
-- ============================================================
-- Scenario: FiaFox management wants a report showing the
-- total revenue generated per product category, ranked from
-- highest to lowest, to guide future stock investment decisions.

WITH category_revenue AS (
    SELECT
        cat.category_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.quantity) AS total_units_sold
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN categories cat ON p.category_id = cat.category_id
    GROUP BY cat.category_name
)
SELECT
    category_name,
    ROUND(total_revenue, 2) AS total_revenue,
    total_orders,
    total_units_sold,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM category_revenue
ORDER BY revenue_rank;

-- EXPLAIN ANALYZE version:
EXPLAIN ANALYZE
WITH category_revenue AS (
    SELECT
        cat.category_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.quantity) AS total_units_sold
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN categories cat ON p.category_id = cat.category_id
    GROUP BY cat.category_name
)
SELECT
    category_name,
    ROUND(total_revenue, 2) AS total_revenue,
    total_orders,
    total_units_sold,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM category_revenue
ORDER BY revenue_rank;


-- ============================================================
-- Q4: Window Function - RANK (6 Marks)
-- ============================================================
-- Scenario: FiaFox wants to rank customers by their total
-- spending to identify VIP customers who should receive
-- loyalty rewards or exclusive discount offers.

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.email,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spending_rank,
    DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS dense_spending_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
ORDER BY spending_rank;

-- EXPLAIN ANALYZE version:
EXPLAIN ANALYZE
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.email,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spending_rank,
    DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS dense_spending_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
ORDER BY spending_rank;


-- ============================================================
-- Q5: Window Function - Running Total (7 Marks)
-- ============================================================
-- Scenario: FiaFox wants to track cumulative revenue over
-- time on a month by month basis to monitor business growth
-- trends and forecast future performance.

SELECT
    TO_CHAR(o.order_date, 'YYYY-MM') AS order_month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS monthly_revenue,
    ROUND(
        SUM(SUM(oi.quantity * oi.unit_price))
        OVER (ORDER BY TO_CHAR(o.order_date, 'YYYY-MM')),
    2) AS running_total,
    COUNT(DISTINCT o.order_id) AS orders_that_month
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY order_month;

-- EXPLAIN ANALYZE version:
EXPLAIN ANALYZE
SELECT
    TO_CHAR(o.order_date, 'YYYY-MM') AS order_month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS monthly_revenue,
    ROUND(
        SUM(SUM(oi.quantity * oi.unit_price))
        OVER (ORDER BY TO_CHAR(o.order_date, 'YYYY-MM')),
    2) AS running_total,
    COUNT(DISTINCT o.order_id) AS orders_that_month
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY order_month;


-- ============================================================
-- Q6: Business Insight Query - Top 5 Best Selling Products (5 Marks)
-- ============================================================
-- Scenario: FiaFox wants to identify the top 5 best selling
-- products by units sold and revenue generated, to prioritise
-- restocking and featured placement on the platform homepage.

SELECT
    p.product_id,
    p.product_name,
    cat.category_name,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue,
    ROUND(AVG(r.rating), 2) AS avg_rating,
    COUNT(DISTINCT r.review_id) AS total_reviews
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN categories cat ON p.category_id = cat.category_id
LEFT JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name, cat.category_name
ORDER BY total_units_sold DESC, total_revenue DESC
LIMIT 5;

-- EXPLAIN ANALYZE version:
EXPLAIN ANALYZE
SELECT
    p.product_id,
    p.product_name,
    cat.category_name,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue,
    ROUND(AVG(r.rating), 2) AS avg_rating,
    COUNT(DISTINCT r.review_id) AS total_reviews
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN categories cat ON p.category_id = cat.category_id
LEFT JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name, cat.category_name
ORDER BY total_units_sold DESC, total_revenue DESC
LIMIT 5;


-- ============================================================
-- Q7: Stored Function - Get Customer Order Summary (5 Marks)
-- ============================================================
-- Scenario: FiaFox customer service staff need a quick way
-- to look up any customer's order history summary including
-- total orders, total spend and average order value.

CREATE OR REPLACE FUNCTION get_customer_summary(p_customer_id INTEGER)
RETURNS TABLE (
    customer_name TEXT,
    email VARCHAR,
    total_orders BIGINT,
    total_spent NUMERIC,
    avg_order_value NUMERIC,
    first_order DATE,
    latest_order DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        (c.first_name || ' ' || c.last_name)::TEXT AS customer_name,
        c.email,
        COUNT(DISTINCT o.order_id) AS total_orders,
        ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent,
        ROUND(AVG(o.total_amount), 2) AS avg_order_value,
        MIN(o.order_date) AS first_order,
        MAX(o.order_date) AS latest_order
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE c.customer_id = p_customer_id
    GROUP BY c.first_name, c.last_name, c.email;
END;
$$;

-- Demonstrate the function works (test with customer_id = 1):
SELECT * FROM get_customer_summary(1);
SELECT * FROM get_customer_summary(5);

-- EXPLAIN ANALYZE version:
EXPLAIN ANALYZE
SELECT * FROM get_customer_summary(1);


-- ============================================================
-- Q8: Trigger - Stock Update on Order Item Insert (5 Marks)
-- ============================================================
-- Scenario: FiaFox needs to automatically reduce a product's
-- stock quantity whenever a new order item is inserted, ensuring
-- inventory levels stay accurate without manual updates.

-- First create a log table to record stock changes:
CREATE TABLE IF NOT EXISTS stock_log (
    log_id SERIAL PRIMARY KEY,
    product_id INTEGER,
    product_name VARCHAR(200),
    quantity_sold INTEGER,
    old_stock INTEGER,
    new_stock INTEGER,
    log_time TIMESTAMP DEFAULT NOW()
);

-- Create the trigger function:
CREATE OR REPLACE FUNCTION update_stock_on_order()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_old_stock INTEGER;
    v_product_name VARCHAR(200);
BEGIN
    -- Get current stock and product name
    SELECT stock_quantity, product_name
    INTO v_old_stock, v_product_name
    FROM products
    WHERE product_id = NEW.product_id;

    -- Reduce the stock
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;

    -- Log the stock change
    INSERT INTO stock_log (product_id, product_name, quantity_sold, old_stock, new_stock)
    VALUES (
        NEW.product_id,
        v_product_name,
        NEW.quantity,
        v_old_stock,
        v_old_stock - NEW.quantity
    );

    RETURN NEW;
END;
$$;

-- Create the trigger:
DROP TRIGGER IF EXISTS trg_update_stock ON order_items;
CREATE TRIGGER trg_update_stock
AFTER INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION update_stock_on_order();

-- Demonstrate the trigger works:
-- Check stock before:
SELECT product_id, product_name, stock_quantity FROM products WHERE product_id = 1;

-- Insert a new order item (this will fire the trigger):
INSERT INTO orders (customer_id, order_date, status, total_amount)
VALUES (1, CURRENT_DATE, 'pending', 399.99);

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (
    (SELECT MAX(order_id) FROM orders),
    1,
    2,
    399.99
);

-- Check stock after (should be reduced by 2):
SELECT product_id, product_name, stock_quantity FROM products WHERE product_id = 1;

-- Check the stock log:
SELECT * FROM stock_log ORDER BY log_time DESC LIMIT 5;


-- ============================================================
-- Q9: Transaction - BEGIN / COMMIT / ROLLBACK (2 Marks)
-- ============================================================
-- Scenario: FiaFox processes a new customer order as a single
-- atomic transaction. If any step fails (e.g. inserting the
-- order item), the entire transaction is rolled back to prevent
-- partial or corrupted order data in the database.

BEGIN;

    -- Step 1: Insert a new order
    INSERT INTO orders (customer_id, order_date, status, total_amount)
    VALUES (3, CURRENT_DATE, 'pending', 299.99);

    -- Step 2: Insert the order item linked to the new order
    INSERT INTO order_items (order_id, product_id, quantity, unit_price)
    VALUES (
        (SELECT MAX(order_id) FROM orders),
        4,
        1,
        299.99
    );

    -- Step 3: If everything succeeded, commit
    COMMIT;

-- If any step above had failed, you would run:
-- ROLLBACK;

-- Verify the transaction was committed:
SELECT o.order_id, o.order_date, o.status, oi.product_id, oi.quantity, oi.unit_price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_id = (SELECT MAX(order_id) FROM orders);


-- ============================================================
-- Q10: Concurrency / Recovery Concept (1 Mark)
-- ============================================================
-- This is written in your report, not as SQL.
-- See report Section Q10 for the explanation.
-- The concept demonstrated is: READ COMMITTED isolation level.
-- PostgreSQL uses MVCC (Multi-Version Concurrency Control) by
-- default, which means readers never block writers and writers
-- never block readers. Each transaction sees a consistent
-- snapshot of the data as it was at the start of the transaction.
-- This is critical for FiaFox where multiple customers may be
-- placing orders simultaneously.

-- Example showing how to set isolation level:
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM orders WHERE status = 'pending';
COMMIT;


-- ============================================================
-- Q11: Performance Tuning (7 Marks)
-- ============================================================
-- Scenario: FiaFox identified that querying total revenue per
-- customer is slow because the orders table has no index on
-- customer_id. We capture EXPLAIN ANALYZE before and after
-- creating the index to compare performance.

-- STEP 1: Slow query BEFORE indexing (capture this screenshot):
EXPLAIN ANALYZE
SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_revenue DESC;

-- STEP 2: Create indexes to improve performance:
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_order_items_order_id ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_order_items_product_id ON order_items(product_id);

-- STEP 3: Same query AFTER indexing (capture this screenshot):
EXPLAIN ANALYZE
SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_revenue DESC;


-- ============================================================
-- Q12: PostgreSQL Roles & Security (5 Marks)
-- ============================================================
-- Scenario: FiaFox needs two access levels. An admin role with
-- full access to all tables, and a staff role with read-only
-- access to customers, products and orders but no access to
-- financial or sensitive data like reviews or stock logs.

-- Create the roles:
CREATE ROLE fiafox_admin;
CREATE ROLE fiafox_staff;

-- Grant admin full privileges on all tables:
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO fiafox_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO fiafox_admin;

-- Grant staff read-only access to specific tables only:
GRANT SELECT ON customers TO fiafox_staff;
GRANT SELECT ON products TO fiafox_staff;
GRANT SELECT ON orders TO fiafox_staff;
GRANT SELECT ON categories TO fiafox_staff;
GRANT SELECT ON order_items TO fiafox_staff;

-- Explicitly REVOKE staff access to sensitive tables:
REVOKE ALL ON reviews FROM fiafox_staff;
REVOKE ALL ON stock_log FROM fiafox_staff;

-- Create actual login users and assign roles:
CREATE USER admin_user WITH PASSWORD 'AdminPass123!';
CREATE USER staff_user WITH PASSWORD 'StaffPass123!';

GRANT fiafox_admin TO admin_user;
GRANT fiafox_staff TO staff_user;

-- Demonstrate restricted access:
-- Switch to staff_user and try to access reviews (should fail):
SET ROLE fiafox_staff;
SELECT * FROM orders LIMIT 5;      -- This should WORK
SELECT * FROM reviews LIMIT 5;     -- This should FAIL with permission denied

-- Reset role back to admin:
RESET ROLE;

-- Verify role assignments:
SELECT rolname FROM pg_roles WHERE rolname IN ('fiafox_admin', 'fiafox_staff', 'admin_user', 'staff_user');
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN ('fiafox_admin', 'fiafox_staff')
ORDER BY grantee, table_name;

-- ============================================================
-- END OF TASK THREE SCRIPT
-- ============================================================