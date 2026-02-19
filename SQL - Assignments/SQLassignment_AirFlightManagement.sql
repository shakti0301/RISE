CREATE DATABASE Airlines;

USE Airlines;

CREATE TABLE airports (
    airport_id INT PRIMARY KEY,
    airport_name VARCHAR(150) UNIQUE NOT NULL,
    airport_code VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    time_zone VARCHAR(50) NOT NULL
);

CREATE TABLE airlines(
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100) UNIQUE NOT NULL,
    iata_code CHAR(2) NOT NULL,
    country VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) UNIQUE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Active', 'Suspended'))
);


CREATE TABLE aircrafts(
    aircraft_id INT PRIMARY KEY,
    aircraft_code VARCHAR(20) NOT NULL UNIQUE,
    model VARCHAR(100) NOT NULL,
    airline_id INT,
    total_seats INT NOT NULL,
    manufacture_year INT NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
)

CREATE TABLE flights(
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL UNIQUE,
    airline_id INT,
    aircraft_id INT,
    origin_id INT,
    destination_id INT,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    fare DECIMAL(8,2) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id),
    FOREIGN KEY (origin_id) REFERENCES airports(airport_id),
    FOREIGN KEY (destination_id) REFERENCES airports(airport_id)
);

CREATE TABLE passengers(
    passenger_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    passport_no VARCHAR(20) UNIQUE,
    nationality VARCHAR(50) NOT NULL,
    dob DATE NOT NULL
);

CREATE TABLE bookings(
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE Default GetDate(),
    seat_number VARCHAR(5) NOT NULL,
    seat_class VARCHAR(20) CHECK (seat_class IN ('Economy', 'Business', 'First')),
    amount_paid DECIMAL(8,2) NOT NULL,
    booking_status VARCHAR(20) CHECK (booking_status IN ('Confirmed', 'Cancelled', 'Pending')),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
)

INSERT INTO airports (airport_id, airport_name, airport_code, city, country, time_zone) VALUES
(1,  'Indira Gandhi International Airport',    'DEL', 'New Delhi',    'India',          'Asia/Kolkata'),
(2,  'Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'Mumbai', 'India',    'Asia/Kolkata'),
(3,  'Kempegowda International Airport',       'BLR', 'Bangalore',    'India',          'Asia/Kolkata'),
(4,  'Chennai International Airport',          'MAA', 'Chennai',      'India',          'Asia/Kolkata'),
(5,  'Netaji Subhas Chandra Bose International Airport', 'CCU', 'Kolkata', 'India',     'Asia/Kolkata'),
(6,  'Rajiv Gandhi International Airport',     'HYD', 'Hyderabad',    'India',          'Asia/Kolkata'),
(7,  'Sardar Vallabhbhai Patel International Airport', 'AMD', 'Ahmedabad', 'India',     'Asia/Kolkata'),
(8,  'Dubai International Airport',            'DXB', 'Dubai',        'UAE',            'Asia/Dubai'),
(9,  'Heathrow Airport',                       'LHR', 'London',       'United Kingdom', 'Europe/London'),
(10, 'John F. Kennedy International Airport',  'JFK', 'New York',     'USA',            'America/New_York'),
(11, 'Singapore Changi Airport',               'SIN', 'Singapore',    'Singapore',      'Asia/Singapore'),
(12, 'Sydney Kingsford Smith Airport',         'SYD', 'Sydney',       'Australia',      'Australia/Sydney'),
(13, 'Frankfurt Airport',                      'FRA', 'Frankfurt',    'Germany',        'Europe/Berlin'),
(14, 'Bangkok Suvarnabhumi Airport',           'BKK', 'Bangkok',      'Thailand',       'Asia/Bangkok'),
(15, 'Kuala Lumpur International Airport',     'KUL', 'Kuala Lumpur', 'Malaysia',       'Asia/Kuala_Lumpur');


INSERT INTO airlines (airline_id, airline_name, iata_code, country, contact_email, status) VALUES
(1, 'Air India',           'AI', 'India',          'support@airindia.in',       'Active'),
(2, 'IndiGo',              '6E', 'India',          'care@goindigo.in',          'Active'),
(3, 'SpiceJet',            'SG', 'India',          'support@spicejet.com',      'Active'),
(4, 'Vistara',             'UK', 'India',          'customercare@airvistara.com','Active'),
(5, 'Emirates',            'EK', 'UAE',            'support@emirates.com',      'Active'),
(6, 'British Airways',     'BA', 'United Kingdom', 'help@britishairways.com',   'Active'),
(7, 'Singapore Airlines',  'SQ', 'Singapore',      'customercare@singaporeair.com','Active'),
(8, 'AirAsia',             'AK', 'Malaysia',       'support@airasia.com',       'Suspended');


INSERT INTO aircrafts (aircraft_id, aircraft_code, model, airline_id, total_seats, manufacture_year) VALUES
(1,  'VT-PPB', 'Boeing 787-8 Dreamliner',  1, 256, 2015),
(2,  'VT-IGL', 'Airbus A320neo',            2, 186, 2018),
(3,  'VT-IGM', 'Airbus A320neo',            2, 186, 2019),
(4,  'VT-SGF', 'Boeing 737-800',            3, 189, 2016),
(5,  'VT-SGG', 'Boeing 737-800',            3, 189, 2017),
(6,  'VT-TTB', 'Airbus A320',               4, 158, 2020),
(7,  'VT-TTC', 'Boeing 787-9 Dreamliner',   4, 268, 2021),
(8,  'A6-ENA', 'Boeing 777-300ER',          5, 354, 2014),
(9,  'A6-ENB', 'Airbus A380-800',           5, 489, 2013),
(10, 'G-XWBA', 'Airbus A350-1000',          6, 331, 2019),
(11, '9V-SKA', 'Boeing 777-300ER',          7, 299, 2016),
(12, '9M-AQA', 'Airbus A320',               8, 180, 2017);


INSERT INTO flights (flight_id, flight_number, airline_id, aircraft_id, origin_id, destination_id, departure_time, arrival_time, fare, status) VALUES
(1,  'AI-101',  1, 1,  1,  2,  '2024-03-01 06:00:00', '2024-03-01 08:10:00',  4500.00,  'Completed'),
(2,  'AI-202',  1, 1,  2,  9,  '2024-03-02 22:00:00', '2024-03-03 04:30:00', 32000.00,  'Completed'),
(3,  '6E-301',  2, 2,  1,  3,  '2024-03-03 07:30:00', '2024-03-03 09:45:00',  3200.00,  'Completed'),
(4,  '6E-402',  2, 3,  3,  6,  '2024-03-04 11:00:00', '2024-03-04 12:30:00',  2800.00,  'Completed'),
(5,  'SG-501',  3, 4,  1,  4,  '2024-03-05 08:00:00', '2024-03-05 10:15:00',  3500.00,  'Completed'),
(6,  'SG-602',  3, 5,  4,  7,  '2024-03-06 14:00:00', '2024-03-06 15:45:00',  2600.00,  'Delayed'),
(7,  'UK-701',  4, 6,  1,  5,  '2024-03-07 09:30:00', '2024-03-07 13:00:00',  5200.00,  'Scheduled'),
(8,  'UK-802',  4, 7,  2,  8,  '2024-03-08 18:00:00', '2024-03-08 21:30:00', 18000.00,  'Scheduled'),
(9,  'EK-901',  5, 8,  8, 10,  '2024-03-09 02:00:00', '2024-03-09 14:00:00', 55000.00,  'Completed'),
(10, 'EK-1002', 5, 9,  8,  9,  '2024-03-10 08:30:00', '2024-03-10 13:00:00', 42000.00,  'Completed'),
(11, 'BA-201',  6, 10, 9,  1,  '2024-03-11 10:00:00', '2024-03-11 23:30:00', 48000.00,  'Completed'),
(12, 'BA-302',  6, 10, 9, 13,  '2024-03-12 12:00:00', '2024-03-12 14:30:00', 22000.00,  'Cancelled'),
(13, 'SQ-401',  7, 11, 11,  1, '2024-03-13 00:30:00', '2024-03-13 05:00:00', 36000.00,  'Completed'),
(14, 'SQ-502',  7, 11, 11, 12, '2024-03-14 09:00:00', '2024-03-14 18:30:00', 41000.00,  'Scheduled'),
(15, 'AI-303',  1, 1,  2,  4,  '2024-03-15 07:00:00', '2024-03-15 09:30:00',  3800.00,  'Completed'),
(16, '6E-503',  2, 2,  1,  2,  '2024-03-16 06:30:00', '2024-03-16 08:40:00',  3100.00,  'Scheduled'),
(17, 'SG-703',  3, 4,  4,  1,  '2024-03-17 16:00:00', '2024-03-17 18:15:00',  3300.00,  'Delayed'),
(18, 'UK-903',  4, 6,  1,  3,  '2024-03-18 13:00:00', '2024-03-18 15:10:00',  4100.00,  'Scheduled'),
(19, 'EK-1103', 5, 8,  8, 14,  '2024-03-19 03:00:00', '2024-03-19 07:30:00', 28000.00,  'Completed'),
(20, 'AK-101',  8, 12, 15, 11,  '2024-03-20 10:00:00', '2024-03-20 12:00:00',  8500.00,  'Cancelled');


INSERT INTO passengers (passenger_id, full_name, email, phone, passport_no, nationality, dob) VALUES
(1,  'Aarav Sharma',      'aarav.sharma@gmail.com',      '9876543210', 'P1234567', 'Indian',      '1990-04-15'),
(2,  'Priya Mehta',       'priya.mehta@yahoo.com',       '9823456781', 'P2345678', 'Indian',      '1992-07-22'),
(3,  'Rahul Verma',       'rahul.verma@outlook.com',     '9712345682', 'P3456789', 'Indian',      '1988-11-05'),
(4,  'Sneha Patel',       'sneha.patel@gmail.com',       '9634567893', 'P4567890', 'Indian',      '1995-02-18'),
(5,  'Vikram Singh',      'vikram.singh@hotmail.com',    '9545678904', 'P5678901', 'Indian',      '1985-09-30'),
(6,  'Ananya Iyer',       'ananya.iyer@gmail.com',       '9456789015', 'P6789012', 'Indian',      '1998-06-12'),
(7,  'Karan Kapoor',      'karan.kapoor@gmail.com',      '9367890126', 'P7890123', 'Indian',      '1993-03-25'),
(8,  'Divya Nair',        'divya.nair@rediffmail.com',   '9278901237', 'P8901234', 'Indian',      '1991-12-08'),
(9,  'Mohammed Al Farsi', 'mohammed.alfarsi@email.ae',   '0551234568', 'UAE123456','Emirati',     '1987-08-14'),
(10, 'Sarah Johnson',     'sarah.j@gmail.com',           '07911123459','GB123456', 'British',     '1989-05-20'),
(11, 'Liu Wei',           'liu.wei@163.com',             '13812345670','CN123456', 'Chinese',     '1994-01-17'),
(12, 'Emily Watson',      'emily.watson@yahoo.com',      '21298765431','US123456', 'American',    '1996-10-03'),
(13, 'Rohan Desai',       'rohan.desai@gmail.com',       '9189012342', 'P9012345', 'Indian',      '1990-07-29'),
(14, 'Meera Krishnan',    'meera.k@gmail.com',           '9090123453', 'P0123456', 'Indian',      '1997-04-11'),
(15, 'Arjun Reddy',       'arjun.reddy@gmail.com',       '9901234564', 'P1122334', 'Indian',      '1986-02-28'),
(16, 'Fatima Sheikh',     'fatima.sheikh@email.ae',      '0559876545', 'UAE654321','Emirati',     '1993-09-19'),
(17, 'James Miller',      'james.miller@gmail.com',      '07922334456','GB654321', 'British',     '1984-12-31'),
(18, 'Nisha Agarwal',     'nisha.agarwal@gmail.com',     '9812345677', 'P2233445', 'Indian',      '1999-08-05'),
(19, 'Chen Jing',         'chen.jing@qq.com',            '13987654328','CN654321', 'Chinese',     '1991-03-16'),
(20, 'Siddharth Joshi',   'siddharth.j@gmail.com',       '9723456789', 'P3344556', 'Indian',      '1988-06-22');


INSERT INTO bookings (booking_id, passenger_id, flight_id, booking_date, seat_number, seat_class, amount_paid, booking_status) VALUES
(1,  1,  1,  '2024-02-15', '12A', 'Economy',  4500.00,  'Confirmed'),
(2,  2,  1,  '2024-02-16', '14B', 'Economy',  4500.00,  'Confirmed'),
(3,  3,  2,  '2024-02-10', '3A',  'Business', 64000.00, 'Confirmed'),
(4,  4,  3,  '2024-02-20', '22C', 'Economy',  3200.00,  'Confirmed'),
(5,  5,  4,  '2024-02-22', '8D',  'Economy',  2800.00,  'Confirmed'),
(6,  6,  5,  '2024-02-25', '18E', 'Economy',  3500.00,  'Confirmed'),
(7,  7,  6,  '2024-02-26', '5A',  'Business', 7800.00,  'Confirmed'),
(8,  8,  7,  '2024-02-28', '11B', 'Economy',  5200.00,  'Pending'),
(9,  9,  9,  '2024-02-05', '2A',  'First',    110000.00,'Confirmed'),
(10, 10, 10, '2024-02-08', '1B',  'First',    84000.00, 'Confirmed'),
(11, 11, 13, '2024-02-12', '20C', 'Economy',  36000.00, 'Confirmed'),
(12, 12, 11, '2024-02-14', '4A',  'Business', 96000.00, 'Confirmed'),
(13, 13, 15, '2024-03-01', '9C',  'Economy',  3800.00,  'Confirmed'),
(14, 14, 3,  '2024-02-21', '25D', 'Economy',  3200.00,  'Confirmed'),
(15, 15, 4,  '2024-02-23', '7E',  'Business', 8400.00,  'Confirmed'),
(16, 16, 8,  '2024-02-27', '6B',  'Business', 36000.00, 'Pending'),
(17, 17, 10, '2024-02-09', '10A', 'Economy',  42000.00, 'Confirmed'),
(18, 18, 16, '2024-03-05', '30F', 'Economy',  3100.00,  'Confirmed'),
(19, 19, 14, '2024-03-02', '15C', 'Economy',  41000.00, 'Pending'),
(20, 20, 7,  '2024-02-28', '2B',  'Business', 15600.00, 'Confirmed'),
(21, 1,  15, '2024-03-03', '19A', 'Economy',  3800.00,  'Confirmed'),
(22, 2,  5,  '2024-02-24', '13B', 'Economy',  3500.00,  'Cancelled'),
(23, 3,  9,  '2024-02-06', '1A',  'First',    110000.00,'Confirmed'),
(24, 5,  11, '2024-02-13', '22D', 'Economy',  48000.00, 'Confirmed'),
(25, 6,  19, '2024-03-08', '17E', 'Economy',  28000.00, 'Confirmed'),
(26, 7,  13, '2024-02-11', '5C',  'Business', 72000.00, 'Confirmed'),
(27, 8,  16, '2024-03-06', '28F', 'Economy',  3100.00,  'Cancelled'),
(28, 10, 2,  '2024-02-11', '6A',  'Economy',  32000.00, 'Confirmed'),
(29, 13, 17, '2024-03-10', '14D', 'Economy',  3300.00,  'Pending'),
(30, 15, 19, '2024-03-09', '3B',  'Business', 56000.00, 'Confirmed');


SELECT * FROM bookings
--PART C--

--Section C-1: INNER JOIN

SELECT f.flight_number, a.airline_name, f.departure_time, a.status
FROM flights f
JOIN airlines a
ON f.airline_id = a.airline_id

SELECT p.full_name, f.flight_id, b.seat_class, b.amount_paid
FROM bookings b
JOIN passengers p
ON b.passenger_id = p.passenger_id
JOIN flights f
ON f.flight_id = b.flight_id

-- Q15. Show each flight&#39;s origin and destination city names. Use INNER JOIN on airports twice (aliased separately for origin and destination). Display flight_number, origin_city, and destination_city.
SELECT f.flight_number, a1.city AS origin_city, a2.city AS destination_city
FROM flights f
JOIN airports a1 
ON f.origin_id = a1.airport_id
JOIN airports a2 
ON f.destination_id = a2.airport_id

--Q16. List all passengers who have made at least one booking, along with the flight they booked and the fare paid. Show full_name, flight_number, and amount_paid.
SELECT p.full_name, f.flight_number, b.amount_paid
FROM passengers p
JOIN bookings b
ON p.passenger_id = b.passenger_id
JOIN flights f
ON b.flight_id = f.flight_id

--Q17. Display aircraft details for every scheduled flight. Show flight_number, model, total_seats, and departure_time.
SELECT f.flight_number, a.model, a.total_seats, f.departure_time
FROM flights f
JOIN aircrafts a
ON f.aircraft_id = a.aircraft_id
WHERE f.status = 'Scheduled'

--Q18. Join airlines and aircrafts to list  each aircraft along with its airline name, aircraft model, and manufacture year.
SELECT a.aircraft_code, al.airline_name, a.model, a.manufacture_year
FROM aircrafts a
JOIN airlines al
ON a.airline_id = al.airline_id

--Section C-2: LEFT JOIN / RIGHT JOIN
--Q19. Find all passengers who have NOT made any booking yet. Use LEFT JOIN between passengers andbookings. Display full_name and email. 
SELECT p.full_name, p.email
FROM passengers p
LEFT JOIN bookings b
ON p.passenger_id = b.passenger_id
WHERE b.booking_id IS NULL

--Q20. List all flights along with their total booking count, including flights with zero bookings. Use LEFT JOIN and GROUP BY.
SELECT f.flight_number, COUNT(b.booking_id) AS total_bookings
FROM flights f
LEFT JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.flight_number

--Q21. Find all airlines that currently have NO aircrafts registered under them. Use LEFT JOIN between airlines and aircrafts.
SELECT al.airline_name
FROM airlines al
LEFT JOIN aircrafts a
ON al.airline_id = a.airline_id
WHERE a.aircraft_id IS NULL

--Q22. Display all airports along with the number of flights departing from each airport. Include airports with no departing flights. Use LEFT JOIN.
SELECT ap.airport_name, COUNT(f.flight_id) AS departing_flights
FROM airports ap
LEFT JOIN flights f
ON ap.airport_id = f.origin_id
GROUP BY ap.airport_id, ap.airport_name

--Q23. List all aircrafts with their assigned flights. Include aircrafts that have not been assigned to any flight yet. Use LEFT JOIN.
SELECT a.aircraft_code, f.flight_number
FROM aircrafts a
LEFT JOIN flights f
ON a.aircraft_id = f.aircraft_id

--Q24. Using RIGHT JOIN, display all flights with their booking records, showing flights that have no bookings on the right side.
SELECT f.flight_number, b.booking_id, b.amount_paid
FROM flights f
RIGHT JOIN bookings b
ON f.flight_id = b.flight_id

--Section C-3: Multi-Table JOIN (3+ Tables)
--Q25. Write a query joining passengers, bookings, and flights to display: full_name, flight_number, seat_class, departure_time, and booking_status.
SELECT p.full_name, f.flight_number, b.seat_class, f.departure_time, b.booking_status
FROM passengers p
JOIN bookings b
ON p.passenger_id = b.passenger_id
JOIN flights f
ON b.flight_id = f.flight_id

--Q26. Show complete flight route details for each booking: full_name, flight_number, origin city, destination city, and amount_paid. Join bookings, passengers, flights, and airports (twice).
SELECT p.full_name, f.flight_number, a1.city AS origin_city, a2.city AS destination_city, b.amount_paid
FROM bookings b
JOIN passengers p
ON b.passenger_id = p.passenger_id
JOIN flights f
ON b.flight_id = f.flight_id
JOIN airports a1
ON f.origin_id = a1.airport_id
JOIN airports a2
ON f.destination_id = a2.airport_id

--Q27. Generate a full flight manifest: passenger full_name, passport_no, flight_number, airline_name, seat_number, seat_class, and departure_time. Use all 6 tables.
SELECT p.full_name, p.passport_no, f.flight_number, al.airline_name, b.seat_number, b.seat_class, f.departure_time
FROM passengers p
JOIN bookings b
ON p.passenger_id = b.passenger_id
JOIN flights f
ON b.flight_id = f.flight_id
JOIN airlines al
ON f.airline_id = al.airline_id

--Q28. List all passengers who travelled in Business or First class, along with the airline name and aircraft model of their flight.
SELECT p.full_name, al.airline_name, a.model
FROM passengers p
JOIN bookings b
ON p.passenger_id = b.passenger_id
JOIN flights f
ON b.flight_id = f.flight_id
JOIN airlines al
ON f.airline_id = al.airline_id
JOIN aircrafts a
ON f.aircraft_id = a.aircraft_id
WHERE b.seat_class IN ('Business', 'First')

--Q29. Find all flights that are &#39;Delayed&#39; and display: flight_number, airline_name, aircraft model, origin city, and destination city.
SELECT f.flight_number, al.airline_name, a.model, a1.city AS origin_city, a2.city AS destination_city
FROM flights f
JOIN airlines al
ON f.airline_id = al.airline_id
JOIN aircrafts a
ON f.aircraft_id = a.aircraft_id
JOIN airports a1
ON f.origin_id = a1.airport_id
JOIN airports a2
ON f.destination_id = a2.airport_id
WHERE f.status = 'Delayed'

--Q30. Find the airport from which the highest number of passenger bookings have originated. Join airports, flights,and bookings. Use GROUP BY and ORDER BY.
SELECT a.airport_name, COUNT(b.booking_id) AS total_bookings
FROM airports a
JOIN flights f
ON a.airport_id = f.origin_id
JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY a.airport_id, a.airport_name
ORDER BY total_bookings DESC


--Q31. Find pairs of passengers who share the same nationality. Use a SELF JOIN on the passengers table.
--Show passenger1_name, passenger2_name, and nationality.
SELECT p1.full_name AS passenger1_name,
       p2.full_name AS passenger2_name,
       p1.nationality
FROM passengers p1
JOIN passengers p2
ON p1.nationality = p2.nationality
AND p1.passenger_id < p2.passenger_id


--Q32. Find pairs of flights that share the same origin airport and the same destination airport (duplicate routes).
--Use SELF JOIN on flights table. Display both flight numbers and the shared route.
SELECT f1.flight_number AS flight1,
       f2.flight_number AS flight2,
       a1.airport_code AS origin_airport,
       a2.airport_code AS destination_airport
FROM flights f1
JOIN flights f2
ON f1.origin_id = f2.origin_id
AND f1.destination_id = f2.destination_id
AND f1.flight_id < f2.flight_id
JOIN airports a1
ON f1.origin_id = a1.airport_id
JOIN airports a2
ON f1.destination_id = a2.airport_id


--Section C-5: FULL OUTER JOIN & CROSS JOIN

--Q33. Write a FULL OUTER JOIN between passengers and bookings to display all passengers and all bookings.
SELECT p.full_name, b.booking_id, b.flight_id, b.booking_status
FROM passengers p
FULL OUTER JOIN bookings b
ON p.passenger_id = b.passenger_id


--Q34. Write a CROSS JOIN between airlines and seat classes to generate all airline-seat class combinations.
SELECT al.airline_name, sc.seat_class
FROM airlines al
CROSS JOIN (
    SELECT 'Economy' AS seat_class
    UNION ALL
    SELECT 'Business'
    UNION ALL
    SELECT 'First'
) sc


--PART D: GROUP BY, HAVING & ORDER BY

--Q35. Count total number of flights operated by each airline. Order by total_flights descending.
SELECT al.airline_name, COUNT(f.flight_id) AS total_flights
FROM airlines al
JOIN flights f
ON al.airline_id = f.airline_id
GROUP BY al.airline_name
ORDER BY total_flights DESC


--Q36. Find total revenue collected per flight. Order by total_revenue descending.
SELECT f.flight_number, SUM(b.amount_paid) AS total_revenue
FROM flights f
JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_number
ORDER BY total_revenue DESC


--Q37. Group bookings by seat_class and count how many bookings exist in each class.
SELECT seat_class, COUNT(booking_id) AS booking_count
FROM bookings
GROUP BY seat_class


--Q38. Find destination airports that have received more than 10 arriving flights.
SELECT destination_id, COUNT(flight_id) AS arrival_flights
FROM flights
GROUP BY destination_id
HAVING COUNT(flight_id) > 10


--Q39. List airlines that have more than 5 aircrafts registered.
SELECT al.airline_name, COUNT(a.aircraft_id) AS aircraft_count
FROM airlines al
JOIN aircrafts a
ON al.airline_id = a.airline_id
GROUP BY al.airline_name
HAVING COUNT(a.aircraft_id) > 5


--Q40. Display number of bookings made each month. Order chronologically.
SELECT YEAR(booking_date) AS booking_year,
       MONTH(booking_date) AS booking_month,
       COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY YEAR(booking_date), MONTH(booking_date)
ORDER BY booking_year, booking_month


--Q41. Find passengers who have made more than 3 bookings.
SELECT p.full_name, COUNT(b.booking_id) AS total_bookings
FROM passengers p
JOIN bookings b
ON p.passenger_id = b.passenger_id
GROUP BY p.full_name
HAVING COUNT(b.booking_id) > 3
ORDER BY total_bookings DESC


--Q42. Group all flights by status and count flights in each status.
SELECT status, COUNT(flight_id) AS flight_count
FROM flights
GROUP BY status


--Q43. Find average amount paid per seat_class. Round to 2 decimal places.
SELECT seat_class, ROUND(AVG(amount_paid), 2) AS avg_amount
FROM bookings
GROUP BY seat_class


--Q44. List all routes and how many flights operate on each route. Show only routes with more than 2 flights.
SELECT a1.airport_code AS origin_airport,
       a2.airport_code AS destination_airport,
       COUNT(f.flight_id) AS route_count
FROM flights f
JOIN airports a1
ON f.origin_id = a1.airport_id
JOIN airports a2
ON f.destination_id = a2.airport_id
GROUP BY a1.airport_code, a2.airport_code
HAVING COUNT(f.flight_id) > 2


--PART E: Aggregation Functions

--Q45. Find highest, lowest, and average fare across all flights.
SELECT MAX(fare) AS highest_fare,
       MIN(fare) AS lowest_fare,
       AVG(fare) AS average_fare
FROM flights


--Q46. Calculate total revenue generated by each airline.
SELECT al.airline_name, SUM(b.amount_paid) AS total_revenue
FROM airlines al
JOIN flights f
ON al.airline_id = f.airline_id
JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY al.airline_name


--Q47. Count total confirmed bookings per passenger nationality.
SELECT p.nationality, COUNT(b.booking_id) AS confirmed_bookings
FROM passengers p
JOIN bookings b
ON p.passenger_id = b.passenger_id
WHERE b.booking_status = 'Confirmed'
GROUP BY p.nationality


--Q48. Find the passenger who has spent the most total amount.
SELECT p.full_name, SUM(b.amount_paid) AS total_spent
FROM passengers p
JOIN bookings b
ON p.passenger_id = b.passenger_id
GROUP BY p.full_name
ORDER BY total_spent DESC
LIMIT 1


--Q49. Find the aircraft model used for the most number of flights.
SELECT a.model, COUNT(f.flight_id) AS total_flights
FROM aircrafts a
JOIN flights f
ON a.aircraft_id = f.aircraft_id
GROUP BY a.model
ORDER BY total_flights DESC
LIMIT 1


--Q50. Comprehensive airline summary report.
SELECT al.airline_name,
       COUNT(DISTINCT f.flight_id) AS total_flights,
       COUNT(b.booking_id) AS total_passengers,
       SUM(b.amount_paid) AS total_revenue,
       AVG(f.fare) AS avg_fare,
       MAX(f.fare) AS max_fare
FROM airlines al
LEFT JOIN flights f
ON al.airline_id = f.airline_id
LEFT JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY al.airline_name
ORDER BY total_revenue DESC
