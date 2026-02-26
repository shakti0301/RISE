Create DATABASE Practice;

USE Practice;

CREATE TABLE hotel(
hotel_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

CREATE TABLE room(
room_no VARCHAR(4) NOT NULL,
hotel_no CHAR(4) NOT NULL,
type CHAR(1) NOT NULL,
price DECIMAL(5,2) NOT NULL);


CREATE TABLE booking(
hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no CHAR(4) NOT NULL);

CREATE TABLE guest(
guest_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

INSERT INTO hotel
VALUES ('H111', 'Grosvenor Hotel', 'London');

INSERT INTO room
VALUES ('1', 'H111', 'S', 72.00);

INSERT INTO guest
VALUES ('G111', 'John Smith', 'London');

INSERT INTO booking
VALUES ('H111', 'G111','1999-01-01', '1999-01-02', '1');

UPDATE room SET price = price*1.05;


-- Using the INSERT statement, copy the records from the Booking table to the archive table relating to bookings before 1st January 2000. Delete all bookings before 1st January 2000 from the Booking table.


CREATE TABLE booking_old
( hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no VARCHAR(4) NOT NULL);

INSERT INTO booking_old
SELECT * FROM booking
WHERE date_to < '2000-01-01';

DELETE FROM booking
WHERE date_to < '2000-01-01';

-- SIMPLE QUERIES 

--1. List full details of all hotels.
SELECT * FROM hotel

--2. List full details of all hotels in London.
SELECT* FROM hotel 
WHERE address = 'London'

--3. List the names and addresses of all guests in London, alphabetically ordered by name.
SELECT name, address FROM guest 
WHERE address = 'London' ORDER BY name ASC

--4. List all double or family rooms with a price below £40.00 per night, in ascending order of price.
SELECT * FROM room
WHERE type IN ('D', 'F') AND price < 40.00
ORDER BY price ASC

--5. List the bookings for which no date_to has been specified.
SELECT * FROM booking
WHERE date_to IS NULL


--Aggregate Functions

--1. How many hotels are there?
SELECT COUNT(*) AS 'Total Hotels' FROM hotel

--2. What is the average price of a room?
SELECT AVG(price) AS 'Average Price' FROM room

--3. What is the total revenue per night from all double rooms?
SELECT SUM(price) AS 'Revenue' FROM room WHERE type = 'D'

--4. How many different guests have made bookings for August?
SELECT COUNT(guest_no) AS 'Total Guest in August' FROM booking
WHERE MONTH(date_from) = 8


-- SUBQUERIES AND JOINS

--1. List the price and type of all rooms at the Grosvenor Hotel.
SELECT r.price, r.type
FROM room r
JOIN hotel h
ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel';

--2. List all guests currently staying at the Grosvenor Hotel.
SELECT g.name AS 'Guests currently staying at the Grosvenor Hotel'
FROM guest g
JOIN hotel h
ON g.address = h.address
WHERE h.name = 'Grosvenor Hotel'

--3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied.
SELECT r.*, g.name
FROM room r
JOIN hotel h
ON r.hotel_no = h.hotel_no
JOIN guest g
ON h.address = g.address
WHERE h.name = 'Grosvenor Hotel'

--4. What is the total income from bookings for the Grosvenor Hotel today?
SELECT SUM(r.price) AS ' Total Income'
FROM room r
JOIN hotel h
ON r.hotel_no = h.hotel_no
JOIN booking b
ON b.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel' AND b.date_from = GETDATE()

--5. List the rooms that are currently unoccupied at the Grosvenor Hotel.
SELECT r.room_no
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
)

--6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?
SELECT SUM(r.price)
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
)

--Grouping
--1. List the number of rooms in each hotel.
SELECT h.name, COUNT(r.room_no) AS 'No. of Rooms'
FROM room r
JOIN hotel h
ON h.hotel_no = r.hotel_no
GROUP BY h.name

--2. List the number of rooms in each hotel in London.
SELECT h.name, COUNT(r.room_no) AS 'Total no. of Rooms'
FROM room r
JOIN hotel h
ON h.hotel_no = r.hotel_no
WHERE h.address = 'london'
GROUP BY h.name

--3. What is the average number of bookings for each hotel in August?
SELECT AVG(TotalBookings)
From (
    SELECT hotel_no, COUNT(*) AS TotalBookings
    FROM booking
    WHERE MONTH(date_from) = 8
    GROUP BY hotel_no
) AS subquery

--4. What is the most commonly booked room type for each hotel in London?
SELECT h.name, r.type, COUNT(b.room_no) AS 'Booking Count'
FROM booking b
JOIN room r 
ON b.room_no = r.room_no AND b.hotel_no = r.hotel_no
JOIN hotel h 
ON b.hotel_no = h.hotel_no
WHERE h.address = 'London'
GROUP BY h.name, r.type

--5. What is the lost income from unoccupied rooms at each hotel today?
SELECT h.name, SUM(r.price) AS 'Lost Income'
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
)
GROUP BY h.name

----------------------------------------------------------------------

-- SQL Joins 

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_name VARCHAR(50)
)

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
)


INSERT INTO departments VALUES
(1, 'Development', 'Suresh'),
(2, 'QA', 'Ramesh'),
(3, 'HR', 'Suresh'),
(4, 'Support', 'Anita');

INSERT INTO employees VALUES
(101, 'Amit', 60000, 1),
(102, 'Neha', 55000, 2),
(103, 'Rahul', 70000, 1),
(104, 'Priya', 45000, 3),
(105, 'Kiran', 50000, NULL),
(106, 'Sneha', 48000, 2);


--1. List all employees and their department names
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id

--2. List all employees and their department names, including employees who are not assigned to any department
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

--3. List all departments and the number of employees in each department
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name

--4. Find the employee with the highest salary
SELECT emp_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees)

--5. List all employees who work in the QA department
SELECT e.emp_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'QA'

--6. List all departments managed by 'Suresh'
SELECT dept_name
FROM departments
WHERE manager_name = 'Suresh'

--7. List all employees who work in departments managed by 'Suresh'
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.manager_name = 'Suresh'

----------------------------------------------------------------------

--Inner Join

--1

SELECT p.FirstName, p.LastName, pw.PasswordHash
FROM Person p
INNER JOIN Password pw
ON p.BusinessEntityID = pw.BusinessEntityID


--2
SELECT e.BusinessEntityID,
       e.NationalIDNumber,
       e.JobTitle,
       edh.DepartmentID,
       edh.StartDate,
       edh.EndDate
FROM Employee e
INNER JOIN EmployeeDepartmentHistory edh
ON e.BusinessEntityID = edh.BusinessEntityID

--3
SELECT p.FirstName,
       p.LastName,
       pw.PasswordHash,
       ea.EmailAddress
FROM Person p
INNER JOIN Password pw
ON p.BusinessEntityID = pw.BusinessEntityID
INNER JOIN EmailAddress ea
ON p.BusinessEntityID = ea.BusinessEntityID

--4
SELECT b.Title, b.ISBN, a.AuthorName
FROM BookAuthor ba
INNER JOIN Book b
ON ba.BookID = b.BookID
INNER JOIN Author a
ON ba.AuthorID = a.AuthorID

--5
SELECT b.Title,
       b.ISBN,
       a.AuthorName,
       p.PublisherName
FROM BookAuthor ba
INNER JOIN Book b
ON ba.BookID = b.BookID
INNER JOIN Author a
ON ba.AuthorID = a.AuthorID
INNER JOIN Publisher p
ON b.PublisherID = p.PublisherID



