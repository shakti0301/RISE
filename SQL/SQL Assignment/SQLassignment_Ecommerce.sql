CREATE DATABASE E_Commerce_and_Online_Shopping_Platform
USE E_Commerce_and_Online_Shopping_Platform

CREATE Table customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    registration_date DATE DEFAULT(getdate()),
    gender CHAR(1) CHECK(gender IN ('M','F','O'))
)

CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    parent_category_id INT FOREIGN KEY REFERENCES categories(category_id),
    description TEXT DEFAULT (NULL)
)

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category_id INT FOREIGN KEY REFERENCES categories(category_id),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL DEFAULT 0,
    brand VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0.0 AND 5.0)
)

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    delivery_date DATE DEFAULT NULL,
    order_status VARCHAR(20) CHECK (order_status IN ('Pending','Shipped','Delivered','Cancelled')),
    shipping_address VARCHAR(255) NOT NULL
)

CREATE TABLE order_items (
    item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT FOREIGN KEY REFERENCES orders(order_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(4,2) DEFAULT 0.00 CHECK (discount >= 0 AND discount <= 100)
)

CREATE TABLE payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT UNIQUE FOREIGN KEY REFERENCES orders(order_id),
    payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(30) CHECK (payment_method IN ('UPI','Card','NetBanking','COD','Wallet')),
    payment_status VARCHAR(20) CHECK (payment_status IN ('Success','Failed','Refunded','Pending'))
)
-- TABLE 1: customers  (30 records)
INSERT INTO customers (customer_id, full_name, email, phone, city, state, registration_date, gender) VALUES
(1,  'Aarav Sharma',      'aarav.sharma@gmail.com',     '9876543210', 'Mumbai',      'Maharashtra',  '2021-03-15', 'M'),
(2,  'Priya Mehta',       'priya.mehta@yahoo.com',      '9823456781', 'Delhi',       'Delhi',        '2021-06-20', 'F'),
(3,  'Rahul Verma',       'rahul.verma@gmail.com',      '9712345682', 'Bangalore',   'Karnataka',    '2021-09-10', 'M'),
(4,  'Sneha Patel',       'sneha.patel@gmail.com',      '9634567893', 'Ahmedabad',   'Gujarat',      '2021-12-05', 'F'),
(5,  'Vikram Singh',      'vikram.singh@outlook.com',   '9545678904', 'Chennai',     'Tamil Nadu',   '2022-01-18', 'M'),
(6,  'Ananya Iyer',       'ananya.iyer@gmail.com',      '9456783445', 'Hyderabad',   'Telangana',    '2022-03-22', 'F'),
(7,  'Karan Kapoor',      'karan.kapoor@gmail.com',     '9367890196', 'Pune',        'Maharashtra',  '2022-05-14', 'M'),
(8,  'Divya Nair',        'divya.nair@gmail.com',       '9278901230', 'Kochi',       'Kerala',       '2022-07-08', 'F'),
(9,  'Rohan Desai',       'rohan.desai@gmail.com',      '9189012340', 'Mumbai',      'Maharashtra',  '2022-09-03', 'M'),
(10, 'Meera Krishnan',    'meera.k@gmail.com',          '9090123409', 'Bangalore',   'Karnataka',    '2022-11-25', 'F'),
(11, 'Arjun Reddy',       'arjun.reddy@gmail.com',      '9901234572', 'Hyderabad',   'Telangana',    '2023-01-08', 'M'),
(12, 'Nisha Agarwal',     'nisha.agarwal@gmail.com',    '9812345670', 'Jaipur',      'Rajasthan',    '2023-02-14', 'F'),
(13, 'Siddharth Joshi',   'siddharth.j@gmail.com',      '9723456784', 'Pune',        'Maharashtra',  '2023-03-20', 'M'),
(14, 'Lakshmi Rao',       'lakshmi.rao@gmail.com',      '9634567890', 'Chennai',     'Tamil Nadu',   '2023-05-11', 'F'),
(15, 'Amit Trivedi',      'amit.trivedi@gmail.com',     '9545678910', 'Delhi',       'Delhi',        '2023-06-18', 'M'),
(16, 'Pooja Gupta',       'pooja.gupta@yahoo.com',      '9456789015', 'Lucknow',     'Uttar Pradesh','2023-07-25', 'F'),
(17, 'Manish Tiwari',     'manish.t@gmail.com',         '9367890126', 'Kolkata',     'West Bengal',  '2023-08-30', 'M'),
(18, 'Riya Malhotra',     'riya.malhotra@gmail.com',    '9278901237', 'Chandigarh',  'Punjab',       '2023-09-15', 'F'),
(19, 'Suresh Babu',       'suresh.babu@gmail.com',      '9189012348', 'Bangalore',   'Karnataka',    '2023-10-22', 'M'),
(20, 'Kavitha Menon',     'kavitha.menon@gmail.com',    '9090123459', 'Kochi',       'Kerala',       '2023-11-28', 'F'),
(21, 'Deepak Kumar',      'deepak.kumar@gmail.com',     '9901234570', 'Patna',       'Bihar',        '2023-12-10', 'M'),
(22, 'Swati Jain',        'swati.jain@yahoo.com',       '9812345681', 'Indore',      'Madhya Pradesh','2024-01-05', 'F'),
(23, 'Rajesh Pillai',     'rajesh.pillai@gmail.com',    '9723456792', 'Mumbai',      'Maharashtra',  '2024-01-18', 'M'),
(24, 'Neha Kulkarni',     'neha.kulkarni@gmail.com',    '9634567803', 'Pune',        'Maharashtra',  '2024-02-08', 'F'),
(25, 'Aditya Saxena',     'aditya.saxena@outlook.com',  '9545678914', 'Delhi',       'Delhi',        '2024-02-22', 'M'),
(26, 'Shruti Yadav',      'shruti.yadav@gmail.com',     '9456789025', 'Noida',       'Uttar Pradesh','2024-03-10', 'F'),
(27, 'Varun Malhotra',    'varun.malhotra@gmail.com',   '9367890136', 'Gurgaon',     'Haryana',      '2024-03-20', 'M'),
(28, 'Anjali Chopra',     'anjali.chopra@yahoo.com',    '9278901247', 'Ludhiana',    'Punjab',       '2024-04-05', 'F'),
(29, 'NoOrderCustomer',   'noorder@gmail.com',          '9189012358', 'Surat',       'Gujarat',      '2019-05-10', 'M'),
(30, 'InactiveCustomer',  'inactive@gmail.com',         '9090123469', 'Vadodara',    'Gujarat',      '2019-08-15', 'F');


-- TABLE 2: categories  (15 records — with sub-categories)
INSERT INTO categories (category_id, category_name, parent_category_id, description) VALUES
(1,  'Electronics',         NULL, 'Electronic gadgets and devices'),
(2,  'Fashion',             NULL, 'Clothing and accessories'),
(3,  'Home & Kitchen',      NULL, 'Home appliances and kitchen tools'),
(4,  'Books',               NULL, 'Educational and recreational books'),
(5,  'Sports & Fitness',    NULL, 'Sports equipment and fitness gear'),
(6,  'Mobile Phones',       1,    'Smartphones and accessories'),
(7,  'Laptops',             1,    'Laptops and computers'),
(8,  'Cameras',             1,    'Digital cameras and photography'),
(9,  'Men Clothing',        2,    'Shirts, trousers, and menswear'),
(10, 'Women Clothing',      2,    'Kurtas, sarees, and womenswear'),
(11, 'Footwear',            2,    'Shoes and sandals'),
(12, 'Kitchen Appliances',  3,    'Mixers, cookers, and appliances'),
(13, 'Furniture',           3,    'Tables, chairs, sofas'),
(14, 'Fiction Books',       4,    'Novels and story books'),
(15, 'Gym Equipment',       5,    'Dumbbells, treadmills, yoga mats');


-- TABLE 3: products  (40 records)
INSERT INTO products (product_id, product_name, category_id, price, stock_quantity, brand, rating) VALUES
(1,  'Samsung Galaxy S23',           6,  74999.00,  50, 'Samsung',     4.5),
(2,  'Apple iPhone 15',              6, 109999.00,  30, 'Apple',       4.8),
(3,  'OnePlus 12R',                  6,  39999.00,  80, 'OnePlus',     4.3),
(4,  'Redmi Note 13 Pro',            6,  24999.00, 120, 'Xiaomi',      4.2),
(5,  'Dell Inspiron 15',             7,  65000.00,  25, 'Dell',        4.2),
(6,  'HP Pavilion x360',             7,  72000.00,  20, 'HP',          4.1),
(7,  'Lenovo IdeaPad Slim 5',        7,  58000.00,  35, 'Lenovo',      4.4),
(8,  'Canon EOS 1500D',              8,  45000.00,  15, 'Canon',       4.6),
(9,  'Nikon D3500',                  8,  42000.00,  12, 'Nikon',       4.5),
(10, 'Raymond Formal Shirt',         9,   1499.00, 200, 'Raymond',     4.0),
(11, 'Levis 511 Slim Jeans',         9,   2999.00, 150, 'Levis',       4.3),
(12, 'Fabindia Cotton Kurta',       10,   1299.00, 180, 'Fabindia',    4.2),
(13, 'W Women Anarkali Kurta',      10,   1799.00, 120, 'W',           4.1),
(14, 'Nike Running Shoes',          11,   5999.00,  90, 'Nike',        4.7),
(15, 'Adidas Ultraboost',           11,   8999.00,  60, 'Adidas',      4.6),
(16, 'Prestige Mixer Grinder',      12,   4500.00,  60, 'Prestige',    4.3),
(17, 'Instant Pot Duo 7-in-1',      12,   9999.00,  40, 'Instant Pot', 4.6),
(18, 'Study Table Wooden',          13,   8500.00,  30, 'DuPure',      4.0),
(19, 'Office Chair Ergonomic',      13,  12000.00,  25, 'Featherlite', 4.4),
(20, 'Physics NCERT Class 12',      14,    350.00, 500, 'NCERT',       4.7),
(21, 'Data Structures by Cormen',   14,    799.00, 300, 'MIT Press',   4.8),
(22, 'Harry Potter Collection',     14,   2499.00, 150, 'Bloomsbury',  4.9),
(23, 'Dumbbell Set 20kg',           15,   3500.00,  75, 'Kore',        4.2),
(24, 'Yoga Mat Anti-Slip',          15,    899.00, 200, 'Boldfit',     4.4),
(25, 'Treadmill Motorized',         15,  45000.00,  10, 'Powermax',    4.5),
(26, 'Boat Airdopes 141',            6,   1499.00, 300, 'Boat',        4.1),
(27, 'JBL Bluetooth Speaker',        1,   5999.00,  85, 'JBL',         4.6),
(28, 'Sony Headphones WH-1000XM5',   1,  29999.00,  40, 'Sony',        4.8),
(29, 'Puma Sports T-Shirt',          9,    999.00, 250, 'Puma',        4.0),
(30, 'Reebok Track Pants',           9,   1499.00, 180, 'Reebok',      4.1),
(31, 'Fastrack Analog Watch',        2,   1999.00, 100, 'Fastrack',    4.2),
(32, 'Titan Smart Watch',            2,  12999.00,  50, 'Titan',       4.5),
(33, 'Philips Air Fryer',           12,   8999.00,  45, 'Philips',     4.7),
(34, 'LG Microwave Oven',           12,  11000.00,  30, 'LG',          4.4),
(35, 'Sofa Set 3 Seater',           13,  35000.00,  15, 'Urban Ladder',4.3),
(36, 'Dining Table 6 Seater',       13,  28000.00,  20, 'Pepperfry',   4.2),
(37, 'The Alchemist Novel',         14,    399.00, 400, 'HarperCollins',4.8),
(38, 'Rich Dad Poor Dad',           14,    499.00, 350, 'Penguin',     4.7),
(39, 'Resistance Bands Set',        15,    799.00, 150, 'Amazon Basics',4.3),
(40, 'OutOfStock Product',           5,   1999.00,   0, 'Unavailable', 0.0);


-- TABLE 4: orders  (35 records)
INSERT INTO orders (order_id, customer_id, order_date, delivery_date, order_status, shipping_address) VALUES
(1,  1,  '2024-01-05 10:30:00', '2024-01-08', 'Delivered',  'Flat 201, Andheri West, Mumbai - 400053'),
(2,  2,  '2024-01-10 14:15:00', '2024-01-13', 'Delivered',  'A-12, Karol Bagh, Delhi - 110005'),
(3,  3,  '2024-01-15 09:00:00', '2024-01-18', 'Delivered',  '45, Koramangala, Bangalore - 560034'),
(4,  4,  '2024-01-20 16:45:00', '2024-01-24', 'Delivered',  'B-7, Navrangpura, Ahmedabad - 380009'),
(5,  5,  '2024-02-01 11:00:00', '2024-02-04', 'Delivered',  '32, T Nagar, Chennai - 600017'),
(6,  6,  '2024-02-05 13:30:00', '2024-02-09', 'Shipped',    '10, Banjara Hills, Hyderabad - 500034'),
(7,  7,  '2024-02-10 08:45:00', '2024-02-14', 'Delivered',  '22, Kothrud, Pune - 411038'),
(8,  8,  '2024-02-15 17:00:00', NULL,          'Cancelled',  '5, MG Road, Kochi - 682016'),
(9,  9,  '2024-02-18 10:15:00', '2024-02-22', 'Delivered',  'Flat 8, Dadar, Mumbai - 400014'),
(10, 10, '2024-02-22 12:30:00', '2024-02-26', 'Delivered',  '88, Indiranagar, Bangalore - 560038'),
(11, 1,  '2024-03-01 09:30:00', '2024-03-05', 'Delivered',  'Flat 201, Andheri West, Mumbai - 400053'),
(12, 2,  '2024-03-05 15:00:00', NULL,          'Pending',    'A-12, Karol Bagh, Delhi - 110005'),
(13, 11, '2024-03-08 11:00:00', '2024-03-12', 'Delivered',  '14, Jubilee Hills, Hyderabad - 500033'),
(14, 12, '2024-03-10 14:45:00', '2024-03-14', 'Delivered',  'C-9, Vaishali Nagar, Jaipur - 302021'),
(15, 3,  '2024-03-12 10:00:00', NULL,          'Shipped',    '45, Koramangala, Bangalore - 560034'),
(16, 13, '2024-03-15 16:30:00', '2024-03-19', 'Delivered',  '18, Shivajinagar, Pune - 411005'),
(17, 5,  '2024-03-18 09:00:00', NULL,          'Pending',    '32, T Nagar, Chennai - 600017'),
(18, 14, '2024-03-20 13:00:00', '2024-03-24', 'Delivered',  '7, Anna Nagar, Chennai - 600040'),
(19, 15, '2024-03-22 10:30:00', NULL,          'Cancelled',  'D-5, Lajpat Nagar, Delhi - 110024'),
(20, 19, '2024-03-25 14:00:00', '2024-03-29', 'Delivered',  '33, Whitefield, Bangalore - 560066'),
(21, 1,  '2024-04-01 11:00:00', '2024-04-05', 'Delivered',  'Flat 201, Andheri West, Mumbai - 400053'),
(22, 16, '2024-04-03 10:00:00', '2024-04-07', 'Delivered',  '45, Gomti Nagar, Lucknow - 226010'),
(23, 17, '2024-04-05 14:30:00', '2024-04-09', 'Delivered',  '12, Salt Lake, Kolkata - 700091'),
(24, 18, '2024-04-08 09:30:00', NULL,          'Shipped',    '8, Sector 17, Chandigarh - 160017'),
(25, 20, '2024-04-10 16:00:00', '2024-04-14', 'Delivered',  '22, Marine Drive, Kochi - 682031'),
(26, 4,  '2024-04-12 11:30:00', '2024-04-16', 'Delivered',  'B-7, Navrangpura, Ahmedabad - 380009'),
(27, 21, '2024-04-15 10:00:00', '2024-04-19', 'Delivered',  '5, Gandhi Maidan, Patna - 800001'),
(28, 22, '2024-04-18 13:00:00', NULL,          'Pending',    '18, Vijay Nagar, Indore - 452010'),
(29, 23, '2024-04-20 15:30:00', '2024-04-24', 'Delivered',  '88, Bandra West, Mumbai - 400050'),
(30, 24, '2024-04-22 09:00:00', '2024-04-26', 'Delivered',  '10, Pimpri, Pune - 411018'),
(31, 6,  '2024-04-25 12:00:00', '2024-04-29', 'Delivered',  '10, Banjara Hills, Hyderabad - 500034'),
(32, 25, '2023-05-10 10:00:00', '2023-05-14', 'Cancelled',  'G-12, Connaught Place, Delhi - 110001'),
(33, 11, '2024-04-28 14:00:00', NULL,          'Shipped',    '14, Jubilee Hills, Hyderabad - 500033'),
(34, 26, '2024-05-01 11:00:00', '2024-05-05', 'Delivered',  '22, Sector 62, Noida - 201301'),
(35, 27, '2024-05-03 10:30:00', NULL,          'Pending',    '15, DLF Phase 2, Gurgaon - 122002');

-- TABLE 5: order_items  (70 records)
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES
(1,  2,  1, 109999.00, 5.00),
(1,  26, 2,   1499.00, 0.00),
(1,  14, 1,   5999.00, 0.00),
(2,  10, 3,   1499.00, 10.00),
(2,  11, 2,   2999.00, 5.00),
(3,  5,  1,  65000.00, 8.00),
(3,  21, 2,    799.00, 0.00),
(4,  12, 3,   1299.00, 5.00),
(4,  13, 2,   1799.00, 0.00),
(5,  1,  1,  74999.00, 3.00),
(5,  24, 1,    899.00, 0.00),
(6,  17, 1,   9999.00, 10.00),
(6,  16, 1,   4500.00, 5.00),
(7,  20, 5,    350.00, 0.00),
(7,  37, 3,    399.00, 0.00),
(8,  3,  1,  39999.00, 0.00),
(9,  7,  1,  58000.00, 7.00),
(9,  23, 1,   3500.00, 0.00),
(10, 6,  1,  72000.00, 5.00),
(11, 14, 2,   5999.00, 0.00),
(11, 24, 1,    899.00, 10.00),
(12, 2,  1, 109999.00, 5.00),
(13, 1,  1,  74999.00, 0.00),
(13, 26, 1,   1499.00, 5.00),
(14, 10, 4,   1499.00, 10.00),
(15, 5,  1,  65000.00, 0.00),
(16, 21, 2,    799.00, 0.00),
(16, 38, 1,    499.00, 0.00),
(17, 16, 1,   4500.00, 5.00),
(18, 12, 2,   1299.00, 0.00),
(20, 7,  1,  58000.00, 8.00),
(21, 28, 1,  29999.00, 5.00),
(21, 27, 1,   5999.00, 0.00),
(22, 4,  2,  24999.00, 10.00),
(22, 30, 1,   1499.00, 0.00),
(23, 8,  1,  45000.00, 5.00),
(23, 9,  1,  42000.00, 5.00),
(24, 15, 1,   8999.00, 0.00),
(25, 33, 1,   8999.00, 10.00),
(26, 3,  1,  39999.00, 5.00),
(27, 22, 1,   2499.00, 0.00),
(28, 31, 2,   1999.00, 0.00),
(29, 32, 1,  12999.00, 8.00),
(30, 19, 1,  12000.00, 5.00),
(31, 34, 1,  11000.00, 0.00),
(33, 25, 1,  45000.00, 10.00),
(34, 35, 1,  35000.00, 5.00),
(35, 36, 1,  28000.00, 0.00),
(1,  29, 2,    999.00, 0.00),
(3,  10, 1,   1499.00, 0.00),
(5,  11, 1,   2999.00, 5.00),
(9,  15, 1,   8999.00, 10.00),
(10, 27, 1,   5999.00, 0.00),
(13, 14, 1,   5999.00, 0.00),
(16, 39, 2,    799.00, 0.00),
(18, 24, 2,    899.00, 0.00),
(20, 23, 1,   3500.00, 0.00),
(21, 26, 3,   1499.00, 10.00),
(22, 29, 3,    999.00, 0.00),
(23, 20, 10,   350.00, 0.00),
(25, 16, 1,   4500.00, 5.00),
(26, 13, 1,   1799.00, 0.00),
(27, 37, 2,    399.00, 0.00),
(29, 6,  1,  72000.00, 12.00),
(30, 18, 1,   8500.00, 0.00),
(31, 17, 1,   9999.00, 8.00),
(34, 19, 1,  12000.00, 10.00),
(11, 15, 1,   8999.00, 5.00),
(13, 23, 1,   3500.00, 0.00),
(20, 33, 1,   8999.00, 5.00);

-- TABLE 6: payments  (30 records — orders 8, 19, 32 cancelled)
INSERT INTO payments (order_id, payment_date, amount, payment_method, payment_status) VALUES
(1,  '2024-01-05 10:35:00', 120495.10, 'Card',       'Success'),
(2,  '2024-01-10 14:18:00',   9343.65, 'UPI',        'Success'),
(3,  '2024-01-15 09:05:00',  62268.00, 'NetBanking', 'Success'),
(4,  '2024-01-20 16:50:00',   7295.05, 'UPI',        'Success'),
(5,  '2024-02-01 11:05:00',  78646.03, 'Card',       'Success'),
(6,  '2024-02-05 13:35:00',  13724.50, 'Wallet',     'Success'),
(7,  '2024-02-10 08:50:00',   2947.00, 'COD',        'Success'),
(9,  '2024-02-18 10:20:00',  64809.00, 'Card',       'Success'),
(10, '2024-02-22 12:35:00',  74399.00, 'UPI',        'Success'),
(11, '2024-03-01 09:35:00',  20546.10, 'UPI',        'Success'),
(12, '2024-03-05 15:05:00', 104499.05, 'Card',       'Pending'),
(13, '2024-03-08 11:05:00',  80497.05, 'UPI',        'Success'),
(14, '2024-03-10 14:50:00',   5396.40, 'COD',        'Success'),
(15, '2024-03-12 10:05:00',  65000.00, 'NetBanking', 'Success'),
(16, '2024-03-15 16:35:00',   2097.00, 'UPI',        'Success'),
(17, '2024-03-18 09:05:00',   4275.00, 'Wallet',     'Pending'),
(18, '2024-03-20 13:05:00',   4396.00, 'UPI',        'Success'),
(20, '2024-03-25 14:05:00',  66384.00, 'Card',       'Success'),
(21, '2024-04-01 11:05:00',  37557.30, 'Card',       'Success'),
(22, '2024-04-03 10:05:00',  48496.10, 'UPI',        'Success'),
(23, '2024-04-05 14:35:00',  86150.00, 'Card',       'Success'),
(24, '2024-04-08 09:35:00',   8999.00, 'Wallet',     'Pending'),
(25, '2024-04-10 16:05:00',  12374.05, 'UPI',        'Success'),
(26, '2024-04-12 11:35:00',  39798.05, 'Card',       'Success'),
(27, '2024-04-15 10:05:00',   2499.00, 'COD',        'Success'),
(28, '2024-04-18 13:05:00',   3998.00, 'UPI',        'Pending'),
(29, '2024-04-20 15:35:00',  75351.08, 'Card',       'Success'),
(30, '2024-04-22 09:05:00',  19900.00, 'NetBanking', 'Success'),
(31, '2024-04-25 12:05:00',  10119.08, 'UPI',        'Success'),
(33, '2024-04-28 14:05:00',  40500.00, 'Card',       'Pending');

--PART A: DML (Data Manipulation Language) — 15 Questions

--Q7. Update the price of all products in category_id = 2 by increasing it by 15%.
UPDATE products
SET price = price * 1.15
WHERE category_id = 2

--Q8. Update the order_status to Delivered for all orders where order_status is Shipped and order_date is before 2024-01-0.
UPDATE orders
SET order_status = 'Delivered'
WHERE order_status = 'Shipped' 
AND order_date < '2024-01-01'

--Q9. Update the stock_quantity of product_id = 5 by reducing it by 10 units.
UPDATE products
SET stock_quantity = stock_quantity - 10
WHERE product_id = 5

--Q10. Update the email of customer_id = 3 to 'newemail@example'.
UPDATE customers
SET email = 'newemail@example'
WHERE customer_id = 3

--Q11. Delete all orders where order_status = Cancelled and order_date is before 2023-06-01.
DELETE FROM orders
WHERE order_status = 'Cancelled' 
AND order_date < '2023-06-01'

--Q12. Delete all order_items where quantity is less than 1.
Delete FROM order_items
WHERE quantity < 1

--Q13. Delete all products where stock_quantity is 0 and category_id = 5.
DELETE FROM products
WHERE stock_quantity = 0 
AND category_id = 5

--Q14. Delete all payments where payment_status = Failed.
DELETE FROM payments
WHERE payment_status = 'Failed'

--Q15. Delete all customers who registered before 2020-01-01 and have made no orders.
DELETE FROM customers
WHERE registration_date < '2020-01-01'
AND customer_id NOT IN (SELECT DISTINCT customer_id FROM orders)

--PART B: TCL (Transaction Control Language) — 5 Questions

--Q16. Write a transaction that inserts a new order and commits it only if the customer_id exists in the customers table.
BEGIN TRANSACTION;

IF EXISTS (SELECT 1 FROM customers WHERE customer_id = 1)
BEGIN
    INSERT INTO orders (order_id, customer_id, order_status, shipping_address)
    VALUES (101, 1, 'Pending', 'Bharuch, Gujarat');

    COMMIT;
END
ELSE
BEGIN
    PRINT 'Customer does not exist';
    ROLLBACK;
END

--Q17. Start a transaction, update the stock_quantity of product_id = 10 to 50, then rollback the transaction.
BEGIN TRANSACTION;

UPDATE products
SET stock_quantity = 50
WHERE product_id = 10;

ROLLBACK;

--Q18. Create a savepoint named before_delete, delete all orders with order_status = Cancelled, then rollback to the savepoint.
BEGIN TRANSACTION;

SAVE TRANSACTION before_delete;


DELETE FROM order_items
WHERE order_id IN (
    SELECT order_id FROM orders WHERE order_status = 'Cancelled'
);


DELETE FROM orders
WHERE order_status = 'Cancelled';

ROLLBACK TRANSACTION before_delete;

COMMIT;

--Q19. Write a transaction that transfers 500 coins from one customer to another (simulate wallet transfer). Use COMMIT if successful.
BEGIN TRANSACTION;

-- deduct from sender (customer 1 creates payment)
INSERT INTO orders (order_id, customer_id, order_status, shipping_address)
VALUES (201, 1, 'Delivered', 'Transfer');

INSERT INTO payments (order_id, amount, payment_method, payment_status)
VALUES (201, 500, 'Wallet', 'Success');

-- credit to receiver (customer 2)
INSERT INTO orders (order_id, customer_id, order_status, shipping_address)
VALUES (202, 2, 'Delivered', 'Transfer');

INSERT INTO payments (order_id, amount, payment_method, payment_status)
VALUES (202, 500, 'Wallet', 'Success');

COMMIT;

--Q20. Demonstrate the use of BEGIN, COMMIT, and ROLLBACK in a single transaction involving INSERT and UPDATE operations.
BEGIN TRANSACTION;

INSERT INTO orders (order_id, customer_id, order_status, shipping_address)
VALUES (301, 1, 'Pending', 'Ahmedabad');

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 5;

IF @@ERROR <> 0
    ROLLBACK;
ELSE
    COMMIT;


--PART C: Operators (Arithmetic, Comparison, Logical, Special) — 10 Questions

--Q21. Find all products where price is greater than 1000 and less than or equal to 5000.
SELECT * 
FROM products
WHERE price > 1000 
AND price <= 5000

--Q22. Retrieve all orders where order_status is NOT Cancelled
SELECT * 
FROM orders
WHERE order_status <>'Cancelled'

--Q23. List all customers whose city is either Mumbai OR Delhi.
SELECT full_name AS 'Customers From Mumbai and Delhi'
FROM customers
WHERE city = 'Mumbai'
OR city = 'Delhi'

--Q24. Find all products where stock_quantity is between 10 and 100 (inclusive).
SELECT product_name AS 'Products whose stock quantity is between 10 and 100'
FROM products
WHERE stock_quantity BETWEEN 10 AND 100

--Q25. Display all customers whose email ends with @gmail.com.
SELECT full_name AS 'Customers whose email ends with @gmail.com', email
FROM customers
WHERE email LIKE '%@gmail.com'

--Q26. Retrieve all products where brand starts with Sam.
SELECT product_name AS 'Products whose brand starts with Sam', brand
FROM products
WHERE brand LIKE 'Sam%'

--Q27. Find all orders where delivery_date IS NULL.
SELECT order_id AS 'Orders where delivery_date IS NULL'
FROM orders
WHERE delivery_date IS NULL

--Q28. List all payments where payment_method is IN (UPI, Card, Wallet).
SELECT payment_id AS 'Payments where payment_method is IN (UPI, Card, Wallet)'
FROM payments
WHERE payment_method IN ('UPI', 'Card', 'Wallet')

--Q29. Display all products where rating IS NOT NULL and rating >= 4.0.
SELECT product_name AS 'Products where rating IS NOT NULL and rating >= 4.0'
FROM products
WHERE rating IS NOT NULL 
AND rating >= 4.0
--Q30. Find all customers where full_name contains the word Kumar anywhere in the name.
SELECT full_name AS 'Customers where full_name contains the word Kumar anywhere in the name'
FROM customers
WHERE full_name LIKE '%kumar%'


--PART D: WHERE Clause — 10 Questions

--Q31. Retrieve all customers from the state Maharashtra.
SELECT full_name AS 'customers from the state Maharashtra'
FROM customers
WHERE state = 'Maharashtra'

--Q32. Find all products with a price greater than 2000.
SELECT  product_name AS 'Products with a price greater than 2000'
FROM products
WHERE price > 2000

--Q33. List all orders placed on 2024-03-15.
SELECT order_id AS 'Orders placed on 2024-03-15'
FROM orders
WHERE order_date = '2024-03-15' 

--Q34. Display all order_items where discount is greater than 5.0.
SELECT order_id AS 'order_items where discount is greater than 5.0'
FROM order_items
WHERE discount > 5.0

--Q35. Find all payments where amount is less than or equal to 500.
SELECT *
FROM payments
WHERE amount <= 500

--Q36. Retrieve all products where category_id = 3 and stock_quantity >= 20.
SELECT *
FROM products
WHERE category_id = 3 AND stock_quantity >= 20

--Q37. List all customers who registered after 2023-01-01.
SELECT full_name AS 'Sustomers who registered after 2023-01-01'
FROM Customers
WHERE registration_date > '2023-01-01'

--Q38. Find all orders where order_status = Delivered and delivery_date is before 2024-02-01.
SELECT *
FROM orders
WHERE order_status = 'Delivered'
AND delivery_date < '2024-02-01'

--Q39. Display all products where brand = Apple and rating >= 4.5.
SELECT product_name AS 'Products where brand = Apple and rating >= 4.5'
FROM products
WHERE brand = 'Apple'
AND rating >= 4.5

--Q40. Retrieve all payments where payment_status = Success and payment_method = UPI.
SELECT *
FROM payments
WHERE payment_status = 'Success'
AND payment_method = 'UPI'


--PART E: ORDER BY — 5 Questions

--Q41. List all products ordered by price in descending order.
SELECT *
FROM products
ORDER BY price DESC

--Q42. Display all customers ordered by registration_date in ascending order.
SELECT *
FROM customers
ORDER BY registration_date ASC

--Q43. Retrieve all orders ordered by order_date in descending order (most recent first).
SELECT *
FROM orders
ORDER BY order_date DESC

--Q44. List all products ordered by rating in descending order, then by price in ascending order.
SELECT *
FROM products
ORDER BY rating DESC, price ASC

--Q45. Display the top 10 most expensive products. Use ORDER BY with LIMIT.
SELECT top(10) *
FROM products
ORDER BY price DESC


--PART F: Aggregation Functions (COUNT, SUM, AVG, MAX, MIN) — 10 Questions

--Q46. Find the total number of customers registered on the platform.
SELECT COUNT(*) AS 'Total Number of Customers Registered'
FROM customers

--Q47. Calculate the total revenue generated from all payments with payment_status = Success.
SELECT SUM(amount) AS 'Total Revenue from Successful Payments'
FROM payments
WHERE payment_status = 'Success'

--Q48. Find the average price of all products.
SELECT AVG(price) AS 'Average Price of All Products'
FROM products

--Q49. Display the highest and lowest product prices.
SELECT MAX(price) AS 'Highest Product Price', MIN(price) AS 'Lowest Product Price'
FROM products

--Q50. Count the total number of orders with order_status = Delivered.
SELECT COUNT(*) AS 'Total Number of Delivered Orders'
FROM orders
WHERE order_status = 'Delivered'

--Q51. Calculate the total quantity of all products in stock (sum of stock_quantity).
SELECT SUM(stock_quantity) AS 'Total Quantity of All Products in Stock'
FROM products

--Q52. Find the average discount applied across all order_items.
SELECT AVG(discount) AS 'Average Discount Applied Across All Order Items'
FROM order_items

--Q53. Display the total amount paid through UPI payment method.
SELECT SUM(amount) AS 'Total Amount Paid Through UPI'
FROM payments
WHERE payment_method = 'UPI'

--Q54. Count the number of distinct cities from the customers table.
SELECT COUNT(DISTINCT city) AS 'Number of Distinct Cities'
FROM customers

--Q55. Find the maximum quantity ordered in a single order_item.
SELECT MAX(quantity) AS 'Maximum Quantity Ordered in a Single Order Item'
FROM order_items


--PART G: GROUP BY — 10 Questions

--Q56. Count the total number of customers per city. Display city and customer_count.
SELECT city, COUNT(*) AS 'Customer Count'
FROM customers
GROUP BY city

--Q57. Find the total number of orders placed by each customer. Display customer_id and order_count.
SELECT customer_id, COUNT(*) AS 'Order Count'
FROM orders
GROUP BY customer_id

--Q58. Calculate the total revenue per payment_method. Display payment_method and total_revenue.
SELECT payment_method, SUM(amount) AS 'Total Revenue'
FROM payments
WHERE payment_status = 'Success'
GROUP BY payment_method

--Q59. Count the number of products in each category. Display category_id and product_count.
SELECT category_id, COUNT(*) AS 'Product Count'
FROM products
GROUP BY category_id

--Q60. Find the total quantity sold per product. Display product_id and total_quantity_sold.
SELECT product_id, SUM(quantity) AS 'Total Quantity Sold'
FROM order_items
GROUP BY product_id

--Q61. Calculate the average price of products per brand. Display brand and avg_price.
SELECT brand, AVG(price) AS 'Average Price'
FROM products
GROUP BY brand

--Q62. Count the number of orders per order_status. Display order_status and order_count.
SELECT order_status, COUNT(*) AS 'Order Count'
FROM orders
GROUP BY order_status

--Q63. Find the total amount paid per customer. Display customer_id and total_paid. Join orders and payments.
SELECT o.customer_id, SUM(p.amount) AS 'Total Paid'
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Success'
GROUP BY o.customer_id

--Q64. Display the number of order_items per order. Display order_id and item_count.
SELECT order_id, COUNT(*) AS 'Item Count'
FROM order_items
GROUP BY order_id

--Q65. Calculate the average rating per category. Display category_id and avg_rating. Join products and categories.
SELECT c.category_id, AVG(p.rating) AS 'Average Rating'
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_id


--PART H: HAVING Clause — 5 Questions

--Q66. Find all customers who have placed more than 3 orders. Display customer_id and order_count.
SELECT customer_id, COUNT(*) AS 'Order Count'
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3

--Q67. List all products that have been ordered more than 10 times. Display product_id and order_count.
SELECT product_id, SUM(quantity) AS 'Order Count'
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > 10

--Q68. Find all categories with more than 5 products. Display category_id and product_count.
SELECT category_id, COUNT(*) AS 'Product Count'
FROM products
GROUP BY category_id
HAVING COUNT(*) > 5

--Q69. Display all brands where the average product price is greater than 5000. Display brand and avg_price.
SELECT brand, AVG(price) AS 'Average Price'
FROM products
GROUP BY brand
HAVING AVG(price) > 5000

--Q70. Find all cities with more than 2 customers. Display city and customer_count.
SELECT city, COUNT(*) AS 'Customer Count'
FROM customers
GROUP BY city
HAVING COUNT(*) > 2


--PART I: JOINS (INNER, LEFT, RIGHT, SELF, FULL, CROSS) — 25 Questions

--Q71. List all orders with customer full_name. Display order_id, full_name, order_date, and order_status.
SELECT o.order_id, c.full_name, o.order_date, o.order_status
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id

--Q72. Display all order_items with product_name and brand. Show item_id, product_name, brand, quantity, and unit_price.
SELECT oi.item_id, p.product_name, p.brand, oi.quantity, oi.unit_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id

--Q73. List all products with their category_name. Display product_name, category_name, price, and stock_quantity.
SELECT p.product_name, c.category_name, p.price, p.stock_quantity
FROM products p
JOIN categories c
ON p.category_id = c.category_id

--Q74. Show all payments with customer full_name and order_date. Join payments, orders, and customers.
SELECT p.payment_id, c.full_name, o.order_date, p.amount, p.payment_method
FROM payments p
JOIN orders o 
ON p.order_id = o.order_id
JOIN customers c 
ON o.customer_id = c.customer_id
WHERE p.payment_status = 'Success'

--Q75. Display all orders along with the total amount paid. Join orders and payments. Show order_id, customer_id, order_status, and amount.
SELECT o.order_id, o.customer_id, o.order_status, SUM(p.amount) AS total_amount
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
WHERE p.payment_status = 'Success'
GROUP BY o.order_id, o.customer_id, o.order_status

--Q76. List all products that have been ordered at least once. Display product_name, brand, and total quantity ordered.
SELECT p.product_name, p.brand, SUM(oi.quantity) AS total_quantity_ordered
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
GROUP BY p.product_name, p.brand

--Q77. Find all customers who have placed orders. Display full_name, email, and count of orders.
SELECT c.full_name, c.email, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.full_name, c.email

--Q78. Show complete order details: customer full_name, product_name, quantity, unit_price, and order_status. Join all relevant tables.
SELECT c.full_name, p.product_name, oi.quantity, oi.unit_price, o.order_status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id

--Q79. Display all categories along with the count of products in each category. Include categories with zero products.
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name

--Q80. Find all customers who have NEVER placed any order. Use LEFT JOIN.
SELECT c.full_name, c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL

--Q81. List all products that have NEVER been ordered. Use LEFT JOIN between products and order_items.
SELECT p.product_name, p.brand
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.item_id IS NULL

--Q82. Display all orders along with payment_status. Include orders that have no payment record (show NULL for payment_status).
SELECT o.order_id, o.order_status, p.payment_status
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id

--Q83. Find all categories with their parent category name (for sub-categories). Use SELF JOIN on categories table.
SELECT c1.category_name AS 'Sub Category', c2.category_name AS 'Parent Category'
FROM categories c1
LEFT JOIN categories c2
ON c1.parent_category_id = c2.category_id
WHERE c1.parent_category_id IS NOT NULL

--Q84. List all pairs of customers from the same city. Use SELF JOIN on customers. Display both customer names and city.
SELECT c1.full_name AS 'Customer 1', c2.full_name AS 'Customer 2', c1.city
FROM customers c1
JOIN customers c2
ON c1.city = c2.city
WHERE c1.customer_id < c2.customer_id

--Q85. Find all pairs of products with the same brand. Use SELF JOIN on products. Display both product names and brand.
SELECT p1.product_name AS 'Product 1', p2.product_name AS 'Product 2', p1.brand
FROM products p1
JOIN products p2
ON p1.brand = p2.brand
WHERE p1.product_id < p2.product_id

--Q86. Display all customers along with their total spending. Join customers, orders, and payments. Show full_name and total_spent.
SELECT c.full_name, SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Success'
GROUP BY c.full_name

--Q87. List all products ordered in Mumbai. Join products, order_items, orders, and customers. Filter by city = Mumbai.
SELECT DISTINCT p.product_name, p.brand
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
JOIN orders o
ON oi.order_id = o.order_id
JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.city = 'Mumbai'

--Q88. Show the top 5 best-selling products by total quantity sold. Join products and order_items.
SELECT TOP(5) p.product_name, p.brand, SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name, p.brand

--Q89. Find the most expensive order (by total amount). Join orders, order_items, and products. Calculate total as sum(quantity * unit_price)
SELECT TOP(1) o.order_id, SUM(oi.quantity * oi.unit_price) AS total_amount
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY total_amount DESC

--Q90. Display all orders where payment_method is UPI. Join orders and payments.
SELECT o.order_id, o.order_status, p.payment_method
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_method = 'UPI'

--Q91. List all categories along with the total revenue generated from products in that category. Join categories, products, order_items.
SELECT c.category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name

--Q92. Find all customers who ordered products from the Electronics category. Join customers, orders, order_items, products, categories.
SELECT DISTINCT c.full_name, c.email
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
JOIN categories cat
ON p.category_id = cat.category_id
WHERE cat.category_name = 'Electronics'

--Q93. Display the average order value per customer. Join customers, orders, order_items. Calculate avg(quantity * unit_price).
SELECT c.full_name, AVG(oi.quantity * oi.unit_price) AS avg_order_value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.full_name

--Q94. Perform a CROSS JOIN between categories and payment_methods (use a derived table with UPI, Card,NetBanking, COD, Wallet).
SELECT c.category_name, pm.payment_method
FROM categories c
CROSS JOIN (SELECT DISTINCT payment_method FROM payments) pm

--Q95. Write a FULL OUTER JOIN between customers and orders to show all customers (with or without orders) and all orders.
SELECT c.full_name, o.order_id, o.order_status
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id


--PART J: Subqueries — 5 Questions

-- Q96. Find all products whose price is greater than the average price of all products. Use a subquery.
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)

-- Q97. List all customers who have placed more orders than the average number of orders per customer. Use a subquery.
SELECT full_name, (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c
WHERE (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) >

-- Q98. Display all orders where the total order value (sum of quantity * unit_price) is greater than 10000. Use a subquery in WHERE clause.
SELECT o.order_id, SUM(oi.quantity * oi.unit_price) AS total_order_value
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING SUM(oi.quantity * oi.unit_price) > 10000

-- Q99. Find the product with the highest price in each category. Use a correlated subquery.
SELECT p1.product_name, p1.price, c.category_name
FROM products p1
JOIN categories c
ON p1.category_id = c.category_id
WHERE p1.price = (SELECT MAX(price) FROM products p2 WHERE p2.category_id = p1.category_id)

-- Q100. List all customers who have made at least one payment with amount greater than 5000. Use EXISTS with a subquery.
SELECT full_name, email
FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o JOIN payments p ON o.order_id = p.order_id WHERE o.customer_id = c.customer_id AND p.amount > 5000)


--PART K: Index — 5 Questions

-- Q101. Create an index named idx_email on the email column of the customers table.
CREATE INDEX idx_email ON customers(email)

-- Q102. Create a composite index named idx_order_customer on order_id and customer_id columns of the orders table.
CREATE INDEX idx_order_customer ON orders(order_id, customer_id)

-- Q103. Create an index named idx_product_name on the product_name column of the products table.
CREATE INDEX idx_product_name ON products(product_name)

-- Q104. Drop the index named idx_email from the customers table.
DROP INDEX idx_email ON customers

-- Q105. Show all indexes on the products table. Use SHOW INDEX command.
SHOW INDEX FROM products

--PART L: Views — 5 Questions

-- Q106. Create a view named customer_orders_view that shows customer_id, full_name, order_id, order_date, and order_status.
CREATE VIEW customer_orders_view AS
SELECT c.customer_id, c.full_name, o.order_id, o.order_date, o.order_status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id

-- Q107. Create a view named product_sales_view that displays product_id, product_name, category_name, and total_quantity_sold.
CREATE VIEW product_sales_view AS
SELECT p.product_id, p.product_name, c.category_name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN categories c
ON p.category_id = c.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, c.category_name

-- Q108. Create a view named revenue_by_category that shows category_name and total revenue generated from each category.
CREATE VIEW revenue_by_category AS
SELECT c.category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name

-- Q109. Query the customer_orders_view to find all orders placed by customers from Delhi.
SELECT *
FROM customer_orders_view
WHERE full_name IN (SELECT full_name FROM customers WHERE city = 'Delhi')

-- Q110. Drop the view named product_sales_view.
DROP VIEW product_sales_view
