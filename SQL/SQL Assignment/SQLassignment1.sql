CREATE DATABASE assignment_1
USE assignment_1

-- Literal SELECT Statement Practice Problems
-- 1)Execute a literal select statement that returns your name.
SELECT 'Shakti'

-- 2) Write the literal select statement that evaluates the product of 7 and 4.
SELECT 7 * 4 AS Product

-- 3) Write the literal select statement that takes the difference of 7 and 4 then multiplies that difference by 8.
SELECT (7 - 4) * 8

-- 4) Write a literal select statement that returns the phrase “Brewster’s SQL Training Class”. 
SELECT 'Brewster’s SQL Training Class' AS Phrase

-- 5) Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in one column and the result of 5*3 in another column.
SELECT 'Day 1 of Training'AS Phrase, 5 * 3 AS Product

-- Select Statement Practice Problems
-- 1) Retrieve all rows from the HumanResources.Employee table. Return only the
CREATE TABLE Employee (EmployeeID INT, Name varchar(20), Age INT, National_id_no varchar(20))
SELECT National_id_no FROM Employee

-- 2) Retrieve all rows from the HumanResources.Employee table. Return the NationalIDNumber and JobTitle columns.
ALTER TABLE Employee ADD Job_Title VARCHAR(20)
SELECT National_id_no, Job_Title From Employee

-- 3) Retrieve the top 20 percent of rows from the HumanResources.Employee table. Return the NationalIDNumber, JobTitle and BirthDate columns.
ALTER TABLE Employee ADD Birth_Date DATE
SELECT top (20) PERCENT National_id_no, Job_Title, Birth_Date FROM Employee

-- 4) Retrieve the top 500 rows from the HumanResources.Employee table. Return the NationalIDNumber, JobTitle and BirthDate columns. Give the NationalIDNumber column an alias, “SSN”, and the JobTitle column an alias, “Job Title”.
SELECT top (500) National_id_no AS SSN, Job_Title AS 'Job Title', Birth_Date FROM Employee

-- 5) Return all rows and all columns from the Sales.SalesOrderHeader table.
CREATE TABLE SalesOrderHeader (Product_id INT, Order_date DATE, Product_name VARCHAR(20), Description VARCHAR(MAX))
SELECT * FROM SalesOrderHeader

-- 6) Return the top 50 percent of rows and all columns from the Sales.Customer table.
CREATE TABLE Customer (Customer_id INT, Customer_name varchar(20), Email VARCHAR(100), Phone_no VARCHAR(15))
SELECT top (50) PERCENT * FROM Customer

-- 7)7) Return the Name column from the Production.vProductAndDescription view. Give this column an alias “Product’s Name”.
CREATE TABLE ProductAndDescription (Product_id INT, Product_name VARCHAR(20), Description VARCHAR(MAX))
SELECT Product_name AS "Product's Name" FROM ProductAndDescription

-- 8) Return the top 400 rows from HumanResources.Department
CREATE TABLE Departmant (Dept_name VARCHAR(20), Dept_code INT)
SELECT top (400)  * FROM Customer

-- 9) Return all rows and columns from the table named Production.BillOfMaterials
CREATE TABLE BillOfMaterials (Bill_id INT, Bill_date DATE, Product VARCHAR(20))
SELECT * FROM Customer

-- 10) Return the top 1500 rows and columns from the view named Sales.vPersonDemographics
CREATE TABLE  vPersonDemographics (Id INT, purchase_date DATE, Gender CHAR(1), Edu VARCHAR(20))
SELECT TOP 1500 * FROM vPersonDemographics;
