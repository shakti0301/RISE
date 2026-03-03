-- To create and use a DataBase
CREATE DATABASE JAN2026
USE JAN2026

-- Types of SQL Language
-- DDL (Data Defination Language) to create a structure - Create, Alter, Dorp, Truncate
-- DML (Data Manipulation Language) to modify the table or DB - Update, Insert, Delete
-- DQL (Data Query Language) to fetching data - Select 
-- TCL (Transaction Control Language) to control transaction / logs- commit, Rollback, Savepoint 

SELECT 4+4 as Addition
SELECT 'Shakti ' + 'Raolji' as fullname

SELECT GETDATE()
SELECT SYSTEM_USER

Alter DATABASE JAN2026
MODIFY NAME = January2026


-- To create a Table in DB 
  -- Create Table <Table Name>
  -- (Col 1 name <DataType>, Col 2 name <DataType>, Col 3 name <DataType>)

CREATE TABLE Employee (Eid Int, Ename Varchar(20), Eage Int, ESalary Money)

Select * FROM Employee
-- * represents all cols of the table


-- Change Table Name
sp_rename 'Employee', 'EMP'  
sp_rename 'EMP', 'Employee'  
  -- sp means store procedure


--Change col name of the table 
sp_rename 'employee.ESalary', 'Esalary'


--To display list of all  the database in server
SELECT name from sys.databases

--To display all tables in DataBase
SELECT name FROM sys.tables

--To Deop a table 
DROP TABLE Employee


--To add a Col 
ALTER TABLE Employee Add Email VARCHAR(20)

--To remove a Col 
ALTER TABLE Employee DROP COLUMN Email 

--To Update data type 
ALter table Employee Alter Column Eid varchar(10)
ALter table Employee Alter Column Eid int



--To insert value 
  --method 1
INSERT INTO Employee VALUES (1, 'shakti', 20, 20000);
  --method 2
INSERT INTO Employee (Eid, Ename, Eage) VALUES (9, 'ven', 20);
  --method 3
INSERT INTO Employee VALUES (3, 'jayesh', 23, 40000), (4, 'shubham', 45, 23000);


SELECT TOP (0) PERCENT * FROM Employee


SELECT * FROM Employee

-- To fetch all kind of data 
sp_help Employee

-- Update Method 1
UPDATE Employee SET Esalary = 20000 WHERE Eid = 2
-- Update Method 2 
UPDATE Employee SET Esalary = 40000 WHERE Esalary is NULL
-- Update Method 3 
UPDATE Employee Set Esalary = 50000 
-- Update Method 4
UPDATE Employee SET Esalary = 20000 WHERE  Eid in (1,2,3)


-- Delete Method 1
DELETE from Employee WHERE Ename = 'jayesh'
-- Delete Method 2
DELETE from Employee Where Esalary is NULL
-- Delete Method 3
DELETE from Employee -- This will delete all the value of the table 

DROP TABLE Employee -- This will delete the whole tabel with entire structure 

Truncate TABLE Employee


-- Identity Function (Auto - Incremant)
-- Identity is used only in INT datatype not in varcar or other bcz we can't perform the increment in names
CREATE TABLE EMPS (EId int Identity, EName VARCHAR(255), EAge Int)
Insert into EMPS VALUES (1, 'Shakti', 20) -- Not possible bcz id given automitically 
Insert into EMPS VALUES ('Shakti', 20)  
Insert into EMPS VALUES ('Shyam', 23)  

SELECT * FROM EMPS

-- If we cnange the mind then (Manually) then ON it 
Set Identity_Insert EMPS ON
Insert into EMPS (EId, EName, EAge) VALUES (3, 'Mahesh', 23)  
Insert into EMPS (EName, EAge) VALUES ('Sha', 23)  

-- -- If we cnange the mind then (Automitically) then OFF it 
Set Identity_Insert EMPS OFF

-- After that the auto Id will bw given according to the last id of the table 
-- Here the last Id is 5 then the next data comes with Id 6

Insert into EMPS VALUES ('xyz', 23)  

-- If while creating a table if we write 'INT Identity (1,2)' then 1 is a starting point and 2 is a jumping value
-- also after 'SET Identity_Insert EMPS ON' we cant able to add null value in the Identity col. 

select * from employee
drop TABLE
employee


Create TABLE Employee (Eid Int, Ename Varchar(20), Eage Int, Department VARCHAR(255), ESalary Money)
Insert into Employee VALUES (1, 'shakti', 20, 'Full Stack', 20000);
Insert into Employee VALUES (2, 'ram', 22, 'Full Stack', 30000);
Insert into Employee VALUES (3, 'jayesh', 23, 'Data Science', 40000);
Insert into Employee VALUES (4, 'shubham', 45, 'Data Science', 23000);
Insert into Employee VALUES (5, 'mahesh', 25, 'DevOps', 50000);
Insert into Employee VALUES (6, 'venkat', 29, 'QA', 60000);


-- Arithmatic Operators in SQL (+, -, *, /, %)
Select EID, Ename, Esalary, (ESalary + 5000) AS Salary_Bonus FROM Employee -- Bonus of 5000
Select EID, Ename, Esalary, (ESalary * 0.05) AS Salary_Increment FROM Employee -- 5% increment
Select EID, Ename, Esalary, (ESalary * 1.05) AS Salary_Increment FROM Employee -- 5% increment (Total Salary)
UPDATE Employee SET Esalary = (Esalary * 1.05)  -- To update the salary with 5% increment
-- To update the 5% decrement
UPDATE Employee SET Esalary = (Esalary * 0.95)

-- Logical Operators in SQL(IN, AND, OR, NOT)
SELECT * FROM Employee WHERE Eid IN (1, 2) 
SELECT * FROM Employee WHERE Department IN ('Full Stack', 'DevOps')
SELECT * FROM Employee WHERE Department = 'Full Stack' AND Esalary = 20000
SELECT * FROM Employee WHERE Department = 'Data Science' OR Esalary = 60000
SELECT * FROM Employee WHERE (Department = 'Data Science' OR Esalary = 60000) AND Eage > 25

  --Comparision Operators (=, >, <, >=, <=, <>)
SELECT * FROM Employee WHERE Esalary <> 30000 -- Not equal to 30000


INSERT into Employee (Eid, Ename, Eage) Values (7, 'Anil', 30);
SELECT * FROM Employee WHERE Esalary IS NOT NULL -- To fetch all the data except NULL value in Esalary col
-- When we use <> is expect the value as a string or int so we cant write IS NOT NULL with it

SELECT * FROM Employee WHERE Esalary IS NULL -- To fetch all the data having NULL value in Esalary col


SELECT * FROM Employee WHERE ESalary BETWEEN 20000 AND 50000 -- Inclusive of both 20000 and 50000
SELECT * FROM Employee WHERE Esalary > 20000 AND Esalary <50000 -- Exclusive of both 20000 and 50000


SELECT * FROM Employee where Ename LIKE 'sh%'  -- Starts with 'sh'
SELECT * FROM Employee where Ename LIKE '%i'  -- Ends with 'i'
SELECT * FROM Employee where Ename LIKE '%i%'  -- Contains 'i'
SELECT * FROM Employee where Ename LIKE '+91%'  -- Starts with '+91' for phone numbers
SELECT * FROM Employee where Ename LIKE '%@gmail.com'  -- Ends with '@gmail.com' for email addresses


-- Set Operators (UNION, UNIONALL, INTERSECT, EXCEPT)
CREATE TABLE Bank_Vadodara (Bid Int, Bname Varchar(20), LOCATION Varchar(20))
INSERT into Bank_Vadodara VALUES (1, 'SBI', 'Akota');
INSERT into Bank_Vadodara VALUES (2, 'HDFC', 'Channi');
INSERT into Bank_Vadodara VALUES (3, 'BOB', 'Makarpura');

CREATE TABLE Bank_Surat (Bid Int, Bname Varchar(20), LOCATION Varchar(20))
insert into Bank_Surat VALUES (1, 'SBI', 'Adajan');
insert into Bank_Surat VALUES (4, 'ICICI', 'Dumas');
INSERT into Bank_Surat VALUES (5, 'PNB', 'Ring Road');


SELECT * FROM Bank_Vadodara
SELECT * FROM Bank_Surat

SELECT * FROM Bank_Vadodara Union SELECT * FROM Bank_Surat  -- Removes duplicate records
SELECT * FROM Bank_Vadodara Union All SELECT * FROM Bank_Surat  -- Includes duplicate records
SELECT * FROM Bank_Vadodara INTERSECT SELECT * FROM Bank_Surat  -- Fetch common records
SELECT * FROM Bank_Vadodara EXCEPT SELECT * FROM Bank_Surat  -- Fetch records present in first table but not in second table

SELECT Bid, Bname, LOCATION FROM Bank_Vadodara
UNION
SELECT Bid, Bname, LOCATION FROM Bank_Surat

SELECT Bid, Bname, LOCATION FROM Bank_Vadodara
UNION
SELECT Bid, LOCATION, Bname FROM Bank_Surat -- Error bcz the sequence of col is not same
-- While Creating: 
-- Number of Col in tables must be same for set operators
-- Order of Col must be same for set operators
-- Data types of col must be same for set operators
-- Number of supplied values must be same as number of col in table while inserting data

CREATE TABLE Test1 (Col1 Int, Col2 Varchar(20))
CREATE TABLE Test2 (Col1 Int, Col2 Varchar(20), Col3 Int)

SELECT * FROM Test1 UNION SELECT * FROM Test2 -- Error bcz number of col is not same

-- Clauses (WHERE, ORDER BY, GROUP BY, HAVING)
-- WHERE Clause is used to filter records based on condition
-- ORDER BY Clause is used to sort the result set in ascending or descending order
-- GROUP BY Clause is used to group rows that have the same values in specified columns
-- HAVING Clause is used to filter records after GROUP BY based on condition

-- Aggregate Functions (COUNT (Used in Numeric as well as Non Numeric), SUM (Numeric), AVG(Numeric), MIN(Both), MAX(both))
SELECT * From Employee

SELECT COUNT(*) FROM Employee  -- Total number of records
SELECT MAX(Esalary) As 'Highest_Salary' FROM Employee  -- Maximum salary
SELECT MIN(Eage) AS 'Min_age' FROM Employee  -- Minimum age
SELECT SUM(Esalary) As 'Total' FROM Employee  -- Total salary
SELECT AVG(Esalary) AS 'Average_Salary' FROM Employee  -- Average salary
-- All this in a single query
SELECT COUNT(*) AS 'Total_Employees', MAX(Esalary) AS 'Highest_Salary', MIN(Eage) AS 'Min_age', SUM(Esalary) AS 'Total_Salary', AVG(Esalary) AS 'Average_Salary' FROM Employee

SELECT Department, MAX(Esalary) AS 'Dept_Highest_Salary' FROM Employee GROUP BY Department
SELECT Department, SUM(ESalary) AS 'Total_Salary' FROM Employee GROUP BY Department
SELECT Department, COUNT(*) AS 'Total_Employees' FROM Employee GROUP BY Department

--to remove null
SELECT Department, COUNT(*) AS 'Total_Employees' FROM Employee WHERE Esalary IS NOT NULL GROUP BY Department

SELECT COUNT(Department)  from Employee GROUP BY Department HAVING COUNT(Department) > 1

-- if any thing mentiooned in group by then it must be mentioned in select also and we use aggregate function with other cols only. if we want to use having (condition) then we must use group by with it. 

-- Order By
SELECT * FROM Employee ORDER BY Ename ASC  -- Sort by Ename in ascending order
SELECT * FROM Employee ORDER BY Esalary DESC  -- Sort by Esalary in descending order
-- by default order by is ascending only

SELECT Department , MAX(ESalary) FROM Employee GROUP BY Department ORDER BY 2 DESC  -- Sort by second column (MAX(ESalary)) in descending order

SELECT TOP 2 Ename, MAX(Esalary) FROM Employee GROUP BY Ename Order BY 2 DESC -- To fetch employee with highest salary

SELECT TOP 2 MAX(Esalary) FROM Employee ORDER BY MAX(Esalary) DESC -- Error bcz we cant use aggregate function directly with order by without group by

-- 1. Find out how many employees are in each department.
SELECT Department, COUNT(*) AS 'Total_Employees' FROM Employee GROUP BY Department

-- 2. Find the average salary of employees in each department.
SELECT Department, AVG(Esalary) AS 'Average_Salary'  FROM Employee GROUP BY Department

-- 3. Find the total qantity sold for each product.
CREATE TABLE Sales (ProductID Int, ProductName Varchar(50), QuantitySold Int)
INSERT into Sales VALUES (1, 'Product A', 10);
INSERT into Sales VALUES (2, 'Product B', 20);
INSERT into Sales VALUES (1, 'Product A', 15);
INSERT into Sales VALUES (3, 'Product C', 5);
SELECT ProductID, ProductName, SUM(QuantitySold) AS 'Total_Quantity_Sold' FROM Sales GROUP BY ProductID, ProductName

-- 4. Maximum Price of a product in Each Reagion
CREATE TABLE Products (ProductID Int, ProductName Varchar(50), Region Varchar(50), Price Money)
INSERT into Products VALUES (1, 'Product A', 'North', 100);
INSERT into Products VALUES (2, 'Product B', 'South', 150);
INSERT into Products VALUES (1, 'Product A', 'North', 120);
INSERT into Products VALUES (3, 'Product C', 'East', 200);
SELECT Region, MAX(Price) FROM Products GROUP BY Region 

-- 5. Max and Min Salary in Each Department
SELECT Department, MIN(Esalary) AS 'Maximum', MAX(Esalary) AS 'Mininum' FROM Employee GROUP BY Department

-- 6 Total Sales value per Region
CREATE TABLE SalesData (Region Varchar(50), SalesAmount Money)
INSERT into SalesData VALUES ('North', 1000);
INSERT into SalesData VALUES ('South', 1500);
INSERT into SalesData VALUES ('North', 1200);
INSERT into SalesData VALUES ('East', 2000);
SELECT Region, SUM(SalesAmount) AS 'Total_Sales' FROM SalesData GROUP BY Region -- if the col is quality and price then we write (Quality * Price) in SUM function


--1. Find the department with an average salary greater than 20000.
SELECT department, AVG(Esalary) FROM Employee GROUP BY department HAVING AVG(Esalary) > 20000

--2. List the cities where the average age of the employeee is greater then 20.
SELECT cities, AVG(Esalary) FROM Employee Group BY cities HAVING AVG(age) > 20

--3. Find the department with more then 5 employees.
SELECT Department, Count(Eid) As 'Total_Employees' FROM Employee GROUP BY Department HAVING COUNT(*) > 5

--4. List the cities where the total salary of all employeee exceeds 30000.
SELECT cities, SUM(Esalary) AS 'Total_Salary' FROM Employee GROUP BY cties HAVING SUM(Esalary) > 30000

--5. Find the department wjere the avereage age of employees is between 20 and 25.
SELECT Department, AVG (Eage) AS 'Average_Age' FROM Employee GROUP BY Department HAVING AVG(Eage) BETWEEN 20 AND 25



-- constraints (NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT)

-- NOT NULL : Ensures that a column cannot have a NULL. duplicate values allowed
-- UNIQUE : Ensures that all values in a column are unique. NO duplicate values allowed, but it may allowed NULL Values
-- CHECK : Will check the given condition on a perticulat column
-- DEFAUlT : Used to assign a default value in a Column when no value is specified


-- Not NULL Constraint
CREATE TABLE EMP1 (
  Eid INT,
  Ename VARCHAR(20),
  Eage INT NOT NULL
)

INSERT into EMP1 VALUES (1, 'Suresh', 20)
INSERT into EMP1 (Eid, Ename) VALUES (2, 'Ramesh') -- Error bcz Eage col is NOT NULL constraint

SELECT * FROM EMP1

drop table EMP1


-- UNIQUE Constraint

CREATE TABLE EMP1 (
  Eid INT UNIQUE,
  Ename VARCHAR(20),
  Eage INT
)


INSERT into EMP1 VALUES (1, 'Suresh', 20)
INSERT into EMP1 (Eid, Ename, Eage) VALUES (1, 'Ramesh', 20) -- Error bcz duplicate value not allowed in UNIQUE constraint
INSERT into EMP1 (Ename, Eage) VALUES ('Ramesh', 20) -- Allowed bcz NULL value allowed in UNIQUE constraint
-- But again if we add then it gives an error 

Drop TABLE EMP1


-- CHECK Constraint

CREATE TABLE EMP1 (
  Eid INT ,
  Ename VARCHAR(20),
  Eage INT,
  Salary Money CHECK (Salary > 18000)
)


INSERT into EMP1 VALUES (1, 'Suresh', 20, 20000)
INSERT into EMP1 VALUES (2, 'Ramesh', 22, 15000) -- Error bcz Salary is less than 18000

-- Default Constraint

CREATE TABLE EMP1 (
  Eid INT ,
  Ename VARCHAR(20),
  Eage INT Default 18,

)

INSERT into EMP1 (Eid, Ename, Eage) VALUES (1, 'Suresh', 15) 
INSERT into EMP1 (Eid, Ename) VALUES (2, 'Ramesh')  -- Eage will be 18 by default

SELECT * FROM EMP1

DROP TABLE EMP1


-- Cobination of all 
CREATE TABLE EMP1 (
  Eid INT UNIQUE NOT NULL,
  Ename VARCHAR(20) NOT NULL,
  Eage INT CHECK (Eage >= 18),
  Salary Money DEFAULT 18000,
)


INSERT into EMP1 VALUES (1, 'Suresh', 20, 20000)
INSERT into EMP1 VALUES (1, 'Ramesh', 22, 15000) -- Error bcz duplicate value not allowed in UNIQUE constraint
INSERT into EMP1 (Eid, Ename, Eage) VALUES (2, 'Ramesh', 16) -- Error bcz Eage is less than 18
INSERT into EMP1 (Eid, Ename) VALUES (3, 'Mahesh')  -- Salary will be 18000 by default
SELECT * FROM EMP1



-- Product Table 
CREATE TABLE Product ( productID INT UNIQUE NOT NULL,
productName VARCHAR(50) NOT NULL,
productStatus VARCHAR(20) DEFAULT 'Pending' CHECK (productStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
)

INSERT into Product (productID, productName, productStatus) VALUES (1, 'Laptop', 'Shipped')
INSERT into Product (productID, productName) VALUES (2, 'Mobile') -- productStatus will be 'Pending' by default
INSERT into Product (productID, productName, productStatus) VALUES (3, 'Tablet', 'In Transit') -- Error bcz productStatus not in the CHECK condition
SELECT * FROM Product



DROP TABLE EMP1

CREATE TABLE EMP1 (
  Eid INT PRIMARY KEY,
  Ename VARCHAR(20) NOT NULL,
  Eage INT
)


INSERT INTO EMP1 VALUES (1, 'Suresh', 20)

ALTER Table EMP1 Add EmailID VARCHAR(50) 

INSERT into EMP1 VALUES (3, 'Mahesh', 22, 'mahesh@gmailcom');
INSERT into EMP1 VALUES (2, 'Ramesh', 25, 'ramesh@gmailcom');

SELECT * FROM EMP1

Alter TABLE EMP1 ADD CONSTRAINT UC_Cons UNIQUE (EmailID)
-- UC means Unique Constraint
-- Now we cant able to add a same email id in the table
-- If the same email id is present in the table then we cant able to add constraint using alter in to the table 

ALTER TABLE EMP1 ADD CONSTRAINT CK_cons CHECK (Eage >= 18)

INSERT into EMP1 VALUES (4, 'Vikash', 16, 'vikash@gmailcom'); -- Error bcz Eage is less than 18

CREATE Table ProductDetails ( 
  PID INT,
  Pname VARCHAR(50),
  Quantity Int,
  Status Varchar(30)
)

INSERT into ProductDetails VALUES (1, 'Laptop', 10, 'Shipped')
INSERT into ProductDetails VALUES (2, 'Mobile', 20, 'In Transit')
INSERT into ProductDetails (PID, Pname, Quantity) VALUES (3, 'Tablet', 15)

SELECT * From ProductDetails

ALTER TABLE ProductDetails ADD CONSTRAINT DF_Status DEFAULT 'Pending' FOR Status
-- IN default we have to write for Status col only
-- Now if we dont provide any value for Status col then it will take 'Pending' as default value

INSERT into ProductDetails (PID, Pname, Quantity) VALUES (4, 'Desktop', 5)


-- Drop Constraints
ALTER Table EMP1 DROP CONSTRAINT UC_Cons
ALTER Table EMP1 DROP CONSTRAINT CK_cons

CREATE TABLE New_Emp (
  Eid INT Unique,
  Ename VARCHAR(20) NOT NULL,
  Eage INT,
  Bid INT UNIQUE
)

Alter TABLE New_Emp ADD EmailID VARCHAR(50) UNIQUE

-- IT remove this Unique
ALTER Table New_Emp ALTER COLUMN Eid INT 

Drop TABLE New_Emp


CREATE TABLE Products1 (
  ID INT, Name VARCHAR(10)
)
INSERT INTO Products1 (ID, Name) VALUES (1, 'Widget'), (2, 'Gadget'), (3, 'Super-Long-Product-Name-Exceeding-Column-Limit')

-- Primary Key Constraint - Unique + Not Null

CREATE TABLE EMP1 (EID INT, Ename VARCHAR(20))

INSERT INTO EMP1 VALUES (1, 'Suresh')
INSERT Into EMP1 VALUES (2, 'Mahesh')
INSERT INTO EMP1 VALUES (1, 'Ramesh') -- Allowed bcz no primary key constraint

SELECT * From EMP1

DROP TABLE EMP1

CREATE TABLE EMP1 (
  Eid INT PRIMARY KEY,
  Ename VARCHAR(20) NOT NULL
)

INSERT INTO EMP1 VALUES (1, 'Suresh')
INSERT INTO EMP1 VALUES (2, 'Mahesh')
INSERT INTO EMP1 VALUES (1, 'Ramesh') -- Error bcz duplicate value not allowed in primary key constraint


-- if we randomly assign a EID value like 2,1,3 but still it store it as a 1,2,3 only bcz primary key always store in ascending order only.

SELECT * From EMP1

DROP TABLE EMP1

CREATE TABLE EMP1 (
  Eid INT PRIMARY KEY,
  E_PANCard VARCHAR(20) PRIMARY KEY,
  Ename VARCHAR(20) NOT NULL
)
-- Error bcz we cant able to assign two primary key in a single table

CREATE TABLE EMP1 (
  Eid INT,
  Ename VARCHAR(20) PRIMARY KEY
)

Insert into EMP1 VALUES (1, 'Suresh')
Insert into EMP1 VALUES (2, 'Suresh') -- Error bcz duplicate value not allowed in primary key constraint
INSERT into EMP1 VALUES (3, 'SURESH') -- Cant allowed bcz Sql server is not a case sensitive

DROP  TABLE EMP1

-- For primary key : it will be a fully execution of a query means ,
-- for example if we are inserting 5 records in a single query and if one record is duplicate then all 5 records will not be inserted.


--Foreign Key Constraint - to establish Relation between two tables
-- whenever we are assigning a foreign key in child table that must be a primary key in parent table
-- in a primary key , foreign key relationship column name cant matters but data type should matters
-- To maintain referential data integrity means if someone is not available in parent table then it should not be available in child table also.

CREATE TABLE Courses (
  CID INT PRIMARY KEY,
  CName VARCHAR(20),
  CFee Money
)

INSERT into Courses VALUES (10, 'Full Stack', 1000), (20, 'Cloud', 2000), (30, 'GenAI', 3000)

SELECT * FROM Courses

CREATE TABLE Student (
  SID INT, 
  Sname VARCHAR(20), 
  CID INT FOREIGN KEY REFERENCES Courses (CID)
)

INSERT into Student VALUES (1, 'Shakti', 10), (2, 'Ramesh', 20), (3, 'Mahesh', 30)

-- If we try to insert a CID which is not present in Courses table then it will give an error
INSERT into Student VALUES (4, 'Vikash', 40) -- Error bcz CID 40 is not present in Courses table

SELECT * From Courses
SELECT * FROM Student

INSERT into Courses VALUES (40, 'DevOps', 4000)
INSERT into Student VALUES (4, 'Vikash', 40) -- Now it will work bcz CID 40 is present in Courses table

UPDATE Courses SET CID = 50 Where Cname = 'DevOps' -- It will give an errorx bcz CID 40 is present in Student table

Insert into Courses VALUES (60, 'Data Science', 6000)
Update Courses Set CID = 70 Where Cname = 'Data Science' -- Now it will work bcz CID 60 is not present in Student table

Update Student Set CID = 50 Where Sid = 3 -- It will give an error bcz CID 50 is not present in Courses table

Update Student Set CID = 10 Where Sid = 3 -- Now it will work bcz CID 10 is present in Courses table

SELECT * From Courses
SELECT * FROM Student

Delete From Courses Where CID = 10 -- It will give an error bcz CID 10 is present in Student table
Delete From Student Where CID = 10 -- Now it will work bcz first we have to delete from child table then parent table


DROP TABLE Student
DROP TABLE Courses
-- First we have to delete a child table 
-- if we try to delete parent table 1st then it will gives an error 

--if we want to update automatically in child table when we update in parent table then we have to use cascade option while creating foreign key constraint

CREATE TABLE Courses (
  CID INT PRIMARY KEY,
  CName VARCHAR(20),
  CFee Money
)

CREATE TABLE Student (
  SID INT, 
  Sname VARCHAR(20), 
  CID INT FOREIGN KEY REFERENCES Courses (CID) ON UPDATE CASCADE On DELETE CASCADE
)


INSERT into Courses VALUES (10, 'Full Stack', 1000), (20, 'Cloud', 2000), (30, 'GenAI', 3000)
INSERT into Student VALUES (1, 'Shakti', 10), (2, 'Ramesh', 20), (3, 'Mahesh', 30)


UPDATE Courses Set CID = 40 WHERE Cname = 'GenAI'

Select * FROM Courses
SELECT * From Student

Delete from courses where cid = 40 


INSERT INTO Student (SID, Sname) VALUES (4, 'Shreyey')



Drop TABLE Student
Drop TABLE Courses



CREATE TABLE Courses (
  CID INT,
  CName VARCHAR(20),
  CFee Money
)


Insert into COurses Values (20, 'QA', 1000),(10,'Cloud', 2000)


Alter TABLE courses
Add CONSTRAINT PK_Courses PRIMARY KEY (CID)
--Error bcz of nullable col as we cant define it during the creation of table 
-- So we have to define as not null during Creation of table

ALter Table Courses Alter COLUMN CID INT NOT NULL

ALTER TABLE Courses ADD CONSTRAINT PK_Courses PRIMARY KEY (CID)

Insert into COurses Values (20, 'QA', 1000)

DELETE from Courses WHERE cname = 'Full_Stack'

DROP TABLE Courses


-- Practice 


CREATE TABLE Courses (
  CID INT PRIMARY KEY,
  CName VARCHAR(20),
  CFee Money
)


CREATE Table Student (
  SID INT,
  Sname VARCHAR(20),
  CID INT
)


Insert into Student VALUES (1, 'Suresh', 10)

ALter TABLE Student ADD CONSTRAINT FK_Stu FOREIGN Key (CID) REFERENCES courses (CID)


Insert into Student VALUes (1,'Shakti',50) -- Error bcz there is no any 50 value in the cid in courses 

-- if the 50 is already present in to the student table and if we apply the foreign key then it will give us an error 

SELECT * From Student

DROP Table Courses
Drop Table Student


-- Assigning 2 Primary Key in one table (Composite key) and then make a relation of the 2 tables using Foreign key

Create table courses1 (CID INT, SID INT, Cname Varchar(20), Primary KEY (CID, SID))
-- when we merge 2 col then it is sadi to be composite key
-- During insertion combinotion of both value will be consider not only one 

INSERT INTO courses1 VALUES (10, 1, 'abc'),(10, 2, 'xyz') -- NO error bcz it see the combination of the 2 value not only one
INSERT INTO courses1 VALUES (20, 1, 'fya'), (20, 1, 'abc') -- it gives an error and not even a single row will be inserted in it because of the primary key (fully execute or not)

-- Now making relation between the course 1 and student 1  using foreign key
Create TABLE Student1(CID INT, SID INT, Sname Varchar(20), Foreign Key (CID, SID) REFERENCES courses1 (CID,SID))

Drop table Student1
Drop TABLE courses1

-- Adding constraints in student and course table
Create table courses1 (CID INT, SID INT, Cname Varchar(20))

ALTER TABLE courses1
ALter COLUMN CID INT NOT NUll

ALTER TABLE courses1
ALter COLUMN SID INT NOT NUll


Alter TABLE courses1
ADD CONSTRAINT PK_courses1 PRIMARY KEY (CID, SID)

Create TABLE Student1(CID INT, SID INT, Sname Varchar(20))

Alter TABLE Student1
ADD CONSTRAINT FK_courses1 FOREIGN KEY (CID, SID) REFERENCES courses1 (CID, SID)

-- SUBQUERIES (Nested Query) - Multiple Queries 
-- Sub query = Outer Query + Inner Query 
-- Corelated & Non Corelated Query (Outer Query depandent on Result Query vice versa in non corelated) 

select * from employee

-- Here we will get single output
Select Top 1 EID, Ename, Esalary from employee ORDER BY Esalary DESC

-- Here we get max salary 1st then getting info form that 
Select MAX(Esalary) from employee
select * from employee where Esalary = 60000
-- But here we will get multiple data who hase salary = 60000

-- So we are going to modify this query in to sub query 
-- Find highest salary
Select * from employee Where Esalary = (Select MAX(Esalary) from employee)

-- Finding 2nd highest salary
Select * from employee
Where Esalary = 
(Select MAX(Esalary) from employee  where Esalary < (Select MAX(ESalary) from employee))

--Finding 3rd highest slalry 
Select * from employee
Where Esalary = 
(Select MAX(Esalary) from employee  where Esalary < (Select MAX(ESalary) from employee where Esalary < (select Max(Esalary) from employee)))


--Find all products that have price higher then the average price of all product 
Select * from Products where Price > (select AVG(Price) from Products)

-- Find out emp whose sal is grater than the avg sal
Select * from employee where Esalary > (select AVG(Esalary) from employee)
Select Ename, Esalary from employee where Esalary > (select AVG(Esalary) from employee)

-- list all product name that has atlist one record form vadodara region
Select Distinct productName from products where productName IN (Select productName from Products where Region = 'North')

-- find the names of dept  that have atlist one employee older then 30 years

Select EName, Department from employee where Ename In (Select Ename from employee where Eage > 30)
Select * from employee

-- find ename, departmant from employee having max salary within their respective dept
Select Ename, Department, Esalary as 'Highest Salary in Department' from employee where Esalary IN (Select MAX(Esalary) from employee GROUP BY Department) ORDER BY Esalary DESC


-- Practice 
select * from employee
insert into employee values (10, 'sha', 78, 'QA', 60000)

--ONLY ONE HIGHEST SALARY IN EMP TABLE
SELECT TOP 1 EID, ENAME, ESALARY FROM Employee WHERE ESALARY=60000 ORDER BY ESALARY DESC
--ONLY 2 HIGHEST SALARY IN EMP TABLE
SELECT TOP 2 EID, ENAME, ESALARY FROM Employee WHERE ESALARY=60000 ORDER BY ESALARY DESC
--IF WE DON'T HAVE NUMBER OF SAME HIGHEST SALARY IN THE TABLE THAN WE NEED TO USE SUBQUERY

-- Another method
--top 1 has a limitation it returns only one row even though the 2 person can hase same salary which is maximumu that are solved by sub queries using MAX
Select * from employee Where Esalary = (Select MAX(Esalary) from employee)


-- Joins
-- Combining 2 or more tables 
-- Atleast One common Column between Tables
-- DataTypes must be same 
-- Two types of joins (ANSI and Non ANSI)
-- ANSI - using ON keyword 
-- Non ANSI - using WHERE keyword
-- If we write only join then the inner join is a default 

-- Syntex : SELECT * FROM A <JOIN_NAME> B ON A.key = B.key

-- Inner join will give matching value
-- Left join will give inner + left
-- Right join will give inner + right
-- Right join excluding inner join / vice versa -- in that, in last after On A.key = B.key Where A.key/B.key is Null respectively
-- Full Outer join will give Intersecting + left + right values (same order) 
-- Full Outer join Excluidng inner join -- in that, in last after On A.key is null OR B.key is null (Order - Left then Right)


CREATE TABLE Course (
  CID int,
  Cname Varchar (255),
  Cfee Money
)

Insert Into Course Values
(10, 'Full Stack', 1000),
(20, 'QA', 1000),
(30, 'Cloud', 2000),
(40, 'AI', 3000)

CREATE TABLE Student(
  SID int,
  Sname Varchar(20),
  CID INT
)

Insert into Student Values
(1, 'Suresh', 10),
(2, 'Mahesh', 20),
(3, 'Jayesh', 50)

-- Join examples 

Select * from Course
Select * from Student

Select * from Course
Inner Join Student
ON Course.CID = Student.CID
-- First it will give matching values 

Select * from Course
Left Join Student
ON Course.CID = Student.CID
-- First it will give matching values then left side 

Select * from Course
Right Join Student
ON Course.CID = Student.CID
-- First it will give matching values then Right side 

Select * from Course
Left Join Student
ON Course.CID = Student.CID
where Student.CID is Null
-- It will remove the matching values then give the values of left side (expect inner)

Select * from Course
Right Join Student
ON Course.CID = Student.CID
where Course.CID is Null
-- It will remove the matching values then give the values of Right side (expect inner)

Select * from Course
Full Outer Join Student
ON Course.CID = Student.CID
-- It will gives inner values then left side then right side values

Select * from Course
Full Outer Join Student
ON Course.CID = Student.CID
where Course.CID is NUll OR Student.CID is NUll
-- It will removes inner values then  gives left side then right side values

-- Cross join (Cartesian Product)
Select * from Course
Cross Join Student

-- Alternative way 
Select * from Course, Student

-- return Course x Student 

CREATE TABLE Customer(
  CustomerID INT,
  CustomerName Varchar(30),
  CustomerCity INT,
  CustomerNo INT
)
Alter Table Customer Alter Column CustomerNo BIGINT

Delete From Customer

Insert into Customer Values
(10, 'Shakti', 'Anand', 9999999999),
(20, 'Krunal', 'Vadodara', 989977666),
(30, 'Kushal', 'Surat', 8320188512),
(70, 'Shyam', 'Bharush', 9900994285)


CREATE TABLE Ord(
  OrderID Int,
  ProductName Varchar(30),
  OrderDate DATE,
  CID INT
)



select * from ord
Insert into Ord Values
(1, 'Laptop', '12/03/2005', 10),
(2, 'Tablet', '1/06/2024', 20),
(3, 'Mobile', '16/12/2025',40)


Select * From Customer AS C
Inner Join Ord AS O
ON C.CID = O.CID

Select * From Customer AS C
Left Join Ord AS O
ON C.CID = O.CID

Select * From Customer AS C
Right Join Ord AS O
ON C.CID = O.CID

Select * From Customer AS C
Full Join Ord AS O
ON C.CID = O.CID

Select * From Customer AS C
Left Join Ord AS O
ON C.CID = O.CID
where O.CID is Null

Select * From Customer AS C
Right Join Ord AS O
ON C.CID = O.CID
where C.CID is Null

Select * From Customer AS C
Full Join Ord AS O
ON C.CID = O.CID
Where C.CID is Null OR O.CID is Null

Select * From Customer AS C
Cross Join Ord AS O

-- Non - ANSI Joins
-- Equi Join (Only equality operator) =
-- Non - equi Join (Expect equality operator) >,>=,<,<=,<>,!=

Select * From Course, Student
where Course.CID = Student.CID -- Act like inner join

Select * From Course, Student
where Course.CID > Student.CID

Select * From Course, Student
where Course.CID <> Student.CID



Create Table Employees (
  EID Varchar(10),
  Ename Varchar(255),
  MID INT,
  DID INT
)

Create Table Department(
  DID INT,
  Dname VARCHAR(255)
)

Create Table Project(
  PID Varchar(10),
  Pname Varchar(255),
  EID Varchar(10)
)

Create Table Manager (
  MID INT,
  Mname Varchar(255)
)

Insert Into Employees Values 
('E106', 'xyz', 10, NULL),
('E101', 'Suresh', 10, 1),
('E102', 'Mahesh', 20, 2),
('E103', 'Krupesh', 30, 3),
('E104', 'Krunal', 40, 4),
('E105', 'Shyam', 50, 5)

Insert into Department Values
(1, 'IT'),
(2, 'QA'),
(3, 'FS'),
(4, 'CL'),
(5, 'AI'),
(6, 'JAVA'),
(7, 'MERN')

Insert Into Project Values
('P2', 'Finance', 'E104'),
('P1', 'Data Mitigation', 'E101'),
('P2', 'Health', 'E102'),
('P3', 'Fintech', 'E105')

Insert Into Manager Values
(10, 'Aliace'),
(20, 'Bob'),
(40, 'Jhon')

-- Views : We create views to save our frequently used queries and to provide security to the data by restricting access to the underlying tables. It is a virtual table that is based on the result set of a SELECT statement. It does not store data physically but provides a way to access data from one or more tables.
Create View vw_Employeedetails AS
  Select Eid, Ename, DID From Employee

Select * from vw_Employeedetails

Alter View vw_Employeedetails AS
  Select Eid, Ename, DID, MID From Employee

Alter View vw_Employeedetails AS
  Select Eid, Ename, DID From Employee  

Drop View vw_Employeedetails

Create View vw_EmployeeProjectDetails AS
  Select e.Ename, p.Pname
  From Employee e
  Join Project p
  On e.Eid = p.Eid

Select * from vw_EmployeeProjectDetails
Drop View vw_EmployeeProjectDetails

--ADVANTAGE OF VIEW : simplicity, security, data abstraction, reusability, maintenance, performance (in some cases)


Create View vw_EmployeeDetails AS
  Select Eid, Ename, DID From Employee

Select * from vw_EmployeeDetails

Update vw_EmployeeDetails
Set DID = 6
Where Eid = 'E106'

Select * from Employee

-- If we update in view table that can update in a base table also. vice versa

Update Employee
Set DID = 7
Where Eid = 'E106'

Create View vw_EmployeeProjectDetails AS
  Select e.Ename, p.Pname
  From Employee e
  Join Project p
  On e.Eid = p.Eid

Select * from vw_EmployeeProjectDetails

Update vw_EmployeeProjectDetails
Set Pname = 'Cyber Security'
Where Ename = 'Krunal'

Select * from Project

--Updating 2 cols using single update statement 
Update vw_EmployeeProjectDetails
Set Pname = 'Cyber Security', Ename = 'Krupesh'
Where Ename = 'Krunal'
-- this gives an error bcz we cant update 2 cols in a single update statement when we are using join in view because of ambiguity. To solve this we have to use alias name of the table with col name while updating

-- To see the details of view

sp_helptext 'vw_EmployeeDetails' -- It will give us the query of the view

-- if we write like this 

Alter View vw_Employeedetails with Encryption AS
  Select Eid, Ename, DID From Employee

-- It will encrypt the query of the view and we cant able to see the query of the view using sp_helptext command
sp_helptext 'vw_EmployeeDetails' -- It will give us the query of the view but it is encrypted so we cant able to understand the query of the view
sp_help 'vw_EmployeeDetails' -- It will give us the details of the view but not the query of the view bcz it is encrypted

Drop View vw_EmployeeDetails

-- Fetch employee name, manager name , department name , project name of all employeee using view

Create View vw_EmployeeAll AS
  Select e.Ename, m.Mname, d.Dname, p.Pname
  From Employee e
  Join Manager m
  On e.MID = m.MID
   Join Department d
  On e.DID = d.DID
   Join Project p
  On e.Eid = p.Eid

Drop View vw_EmployeeAll

Select * from vw_EmployeeAll
---------------------


Create View vw_EmployeeDetails AS
  Select Eid, Ename, DID From Employee

Select * From vw_EmployeeDetails
Select * from employee

Update vw_EmployeeDetails
Set DID = 6
Where Eid = 'E106'

Delete From vw_EmployeeDetails
Where Eid = 'E106'
drop view vw_EmployeeDetails

-- This will update and delete the record from base table also because view is directly connected to base table but if we use join in view then we cant update and delete the record from view because of ambiguity.

Select * from Employee
Select * From Department

Update Employee
SET DID = 1
Where Eid = 'E102'

Create View vw_EmpDeptDetails AS
  Select e.Ename, d.Dname
  From Employee e
  Join Department d
  On e.DID = d.DID

Select * from vw_EmpDeptDetails

Update vw_EmpDeptDetails
  Set Dname = 'QA'
  Where Ename = 'Mahesh'
  Select * from Department
  Select * from Employee

  CREATE VIEW EmployeeView
AS
SELECT EmpID, Name, Salary
FROM Employee
WITH READ ONLY;


Create Table Test (
  TID int,
  TName Varchar(20),
  City Varchar(20)
)

Insert into Test Values
(1, 'QA', 'Anand'),
(2, 'Cloud', 'Vadodara'),
(3, 'AI', 'Ahmadabad')

Create View vw_TestDetails With Schemabinding AS
  Select TID, TName from dbo.Test

-- dbo is a default schema in sql server and we have to write it while creating view with schemabinding and we have to use two part naming convention while creating view with schemabinding
-- When we create view with schemabinding then we cant able to update and delete the record from base table and also we cant able to alter the table structure of base table like adding new col, deleting col, altering data type of col etc. because of schemabinding. It will provide more security to the data by restricting access to the underlying tables.

Select * from vw_TestDetails

Alter Table Test
Drop column TID
--Error bcz we have to drop the view first then we can alter the table structure of base table

-- Index (Clustered and Non Clustered)
-- it is used for faster retrival and faster processing 
-- cluster index can be only one in a table because it stores data physically in sorted order but non clustered index can be multiple in a table because it stores data logically and it has a pointer to the actual data.
-- cluster inxed represent the physical order of the table but non clustered index rep the logical order of the table

Select * from employee

Create Index IX_Empid
ON Employee (Eid ASC)
Select Ename, Eid from employee

Drop Index IX_Empid ON Employee
DROP index IX_EmpNameWithDept ON Employee

Create index IX_EmpNameWithDept
ON Employee (Ename DESC, DID ASC)

-- Cluster Index
Create Clustered Index IX_Empid_Clustered
ON Employee (Eid)

Select * from Employee

Insert into Employee VALUES ('E110', 'Shreyey', 25, 3),
('E120', 'Vikash', 28, 3),
('E130', 'Shivam', 30, 4)


-------------------------------------

Create Table Sample (
  ID INT primary key,
  Name VARCHAR(20),
  Age INT
)

Insert into Sample VALUES 
(3, 'Krunal', 28),
(1, 'Suresh', 25),
(2, 'Mahesh', 30),
(4, 'Shyam', 35)

Select * from Sample

Create Clustered Index IX_Sample_Name
ON Sample (Name)

Drop Table Sample

Drop Index IX_Sample_Name ON Sample

-- Unique index 

Create Unique Index IX_EID 
ON Employee (Eid)

Select * from Employee

Insert into employee VALUES ('E110', 'Shreyey', 25, 3),
('E120', 'Vikash', 28, 3),
('E130', 'Shivam', 30, 4),
('E110', 'Shreyey', 25, 3) -- Error bcz duplicate value not allowed in unique index

-- difference between unique key and unique index is unique key is a constraint that ensures that all values in a column are unique and it automatically creates a unique index on that column to enforce the uniqueness. Unique index is an index that ensures that all values in the indexed column(s) are unique but it does not automatically create a unique key constraint on that column. Unique key can be used to enforce data integrity at the database level, while unique index is primarily used for performance optimization.

--Functions 
select * from Employeedetails

--CAST (expression AS data_type) : It is used to convert an expression from one data type to another data type. It is a standard SQL function and is supported by most of the database management systems.
Select name, '$' + CAST(salary AS VARCHAR(20)) AS 'Esalary_Varchar' from Employeedetails

--Coalesce (expression1, expression2, ... expressionN) : It is used to return the first non-null expression among the given expressions. It is a standard SQL function and is supported by most of the database management systems.
ALter Table Employeedetails 
ADD OfficeEmail VARCHAR(50), PersonalEmail VARCHAR(50)
delete from Employeedetails
Insert into Employeedetails Values (101, 'Shakti', '20', 50000, 'IT','Anand', 'shakti@rise.com', 'shakti@gmailcom')
Insert into Employeedetails Values (102, 'Ramesh', '22', 60000, 'QA','Vadodara', NULL, 'ramesh@gmailcom')
Insert into Employeedetails Values (103, 'Mahesh', '25', 70000, 'FS','Ahmadabad', NULL, NULL)

Select name, Coalesce(OfficeEmail, PersonalEmail, 'No Email') AS 'Email' from Employeedetails


--Datediff (Interval, startdate, enddate) : It is used to return the difference between two dates in terms of the specified date part. It is a standard SQL function and is supported by most of the database management systems.
ALter Table Employeedetails
Add DOB DATE

Update Employeedetails
SET DOB = '2005-01-03' Where EID = 1
Update Employeedetails
SET DOB = '2004-02-13' Where EID = 2
Update Employeedetails
SET DOB = '2005-01-12' Where EID = 3
Update Employeedetails
SET DOB = '2002-01-03' Where EID = 101
Update Employeedetails
SET DOB = '2009-04-12' Where EID = 102
Update Employeedetails
SET DOB = '2002-01-03' Where EID = 103

Select name, DOB, Datediff(year, DOB, GETDATE()) AS 'Age' From Employeedetails
Select name, DATEDIFF(year, DOB, GETDATE()) AS 'Age' from Employeedetails

--replace (string_expression, string_to_replace , string_replacement) : It is used to replace all occurrences of a specified string pattern with a replacement string in a given string expression. It is a standard SQL function and is supported by most of the database management systems.
Select name, REPLACE(name, 'a', '@') AS 'Name_Replace' from Employeedetails

--trim (string_expression) : It is used to remove leading and trailing spaces from a given string expression. It is a standard SQL function and is supported by most of the database management systems.
Select name, TRIM(name) AS 'Name_Trim' from Employeedetails
Select name, LTRIM(name) AS 'Name_Trim' from Employeedetails
Select name, RTRIM(name) AS 'Name_Trim' from Employeedetails
Select TRIM('     Suresh Patel') AS 'Name_Trim' 


Select Len(name) AS 'Length of Name' from Employeedetails
Select Upper(name) AS 'Name in Uppercase' from Employeedetails
Select Lower(name) AS 'Name in Lowercase' from Employeedetails

--Concatenate (string1, string2, ... stringN) : It is used to concatenate two or more string expressions into a single string expression. It is a standard SQL function and is supported by most of the database management systems.
Select CONCAT(name, ' ', 'Patel') AS 'Full Name' from Employeedetails
Select Concat('Suresh', NULL, 'Patel') AS 'Full Name'

Select * from employee

-- Self Join

Select      e1.Eid, e1.ename, e1.department
From        employee e1
Join        employee e2
on          e1.department = e2.department
Where       e1.Eid <> e2.EId





