USE January2026

CREATE TABLE Employeedetails ( EID INT PRIMARY KEY, Name VARCHAR(50), Age INT, Salary INT, Department VARCHAR(50), City VARCHAR(50))
INSERT INTO Employeedetails (EID, Name, Age, Salary, Department, City) VALUES
(1, 'Alice', 30, 60000, 'HR', 'New York'),
(2, 'Bob', 35, 75000, 'IT', 'San Francisco'),
(3, 'Charlie', 28, 50000, 'Finance', 'Chicago'),
(4, 'David', 40, 90000, 'IT', 'New York'),
(5, 'Eva', 32, 65000, 'HR', 'San Francisco'),
(6, 'Frank', 29, 55000, 'Finance', 'Chicago'),
(7, 'Grace', 38, 80000, 'IT', 'New York'),
(8, 'Hannah', 27, 48000, 'HR', 'San Francisco'),
(9, 'Ian', 45, 95000, 'Finance', 'Chicago'),
(10, 'Jack', 31, 62000, 'IT', 'New York');

--1) Return the Name column from Employeedetails where the Name column is equal to "Suresh".
SELECT Name FROM Employeedetails WHERE Name = 'Suresh'

--2) Find the top 100 rows from Employeedetails where the Salary is not equal to 0.
SELECT TOP 100 * FROM Employeedetails WHERE Salary <> 0

--3) Return all rows and columns from Employeedetails where the employee’s Name starts with a letter less than “D”.
SELECT * FROM Employeedetails WHERE Name LIKE '[A-C]%'

--4) Return all rows and columns from Employeedetails where the City column is equal to "New York".
SELECT * FROM Employeedetails WHERE City = 'New York'

--5) Return the Name column from Employeedetails where the Name is equal to "Ramesh". Give the column alias "Employee Name".
SELECT Name AS 'Employee Name' FROM Employeedetails WHERE Name = 'Ramesh'

--6) Using the Employeedetails table, find all employees with a Department equal to "QA" or all employees who have an Age greater than 23 and a Salary less than 50000.
SELECT * FROM Employeedetails WHERE Department = 'QA' OR (Age > 23 AND Salary < 50000)

--7) Find all employees from Employeedetails who have a Department in the list of: "DA", "FS",and "DE". Complete this query twice – once using the IN operator in the WHERE clause and asecond time using multiple OR operators.
SELECT * FROM Employeedetails WHERE Department IN ('DA', 'FS', 'DE')
SELECT * FROM Employeedetails WHERE Department = 'DA' OR Department = 'FS' OR Department = 'DE'

--8) Find all employees from Employeedetails whose Name starts with the letter “A”.
SELECT * FROM Employeedetails WHERE Name LIKE 'A%'

--9) Find all employees from Employeedetails whose Name ends with the letter “a”.
SELECT * FROM Employeedetails WHERE Name LIKE '%a'

--10) Return all columns from the Employeedetails table for all employees who have a Department. That is, return all rows where the Department column does not contain a NULL value.
SELECT * FROM Employeedetails WHERE Department IS NOT NULL

--11) Return the EID and Salary columns from Employeedetails for all employees who have a Department and whose Salary exceeds 20,000.
SELECT Eid, Salary FROM Employeedetails WHERE Department IS NOT NULL AND Salary > 20000
