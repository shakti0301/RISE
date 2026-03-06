CREATE DATABASE TRIGGERS_1101

USE TRIGGERS_1101

--1. Create Stored Procedure to get orders placed by Customers based on City.
CREATE PROCEDURE spGetOrdersByCity
@City VARCHAR(20)
AS
    SELECT CustName, City, ProductName
    FROM tblProducts
    WHERE City = @City

spGetOrdersByCity @City = 'Mumbai'

--2. Create Stored Procedure to find out total employees department-wise 
CREATE PROCEDURE spTotalEmpInDept
@DeptName VARCHAR(40)
AS
    SELECT Department, COUNT(Eid) AS 'Total Employees'
    FROM tblEmployee
    WHERE Department = @DeptName
    GROUP BY Department

spTotalEmpInDept @DeptName = 'IT'

--3. Create Stored Procedure to find products by productname in e-commerce website 
CREATE PROCEDURE spProductByName
@ProductName VARCHAR(50)
AS
    SELECT *
    FROM tblProducts
    WHERE ProductName = @ProductName

spProductByName @ProductName = 'Laptop'

--4. Create procedure to increase or decrease product price of a specific category
CREATE PROCEDURE spChangePrice
@NewPrice Money,
@ProductName VARCHAR(100)
AS
    UPDATE tblProducts
    SET Price = @NewPrice
    WHERE ProductName = @ProductName

spChangePrice @ProductName = 'Laptop', @NewPrice = 67999

--5. Create a procedure that returns max salary of employees with respect to their  department. 
CREATE PROCEDURE spMaxSalaryByDept
@DeptName VARCHAR(40)
AS
    SELECT Department, MAX(ESalary) AS 'MaxSalary'
    FROM tblEmployee
    WHERE Department = @DeptName
    GROUP BY Department

spMaxSalaryByDept @DeptName = 'Full Stack'

--6. Create a Trigger to ensure that Salary is non negative 
CREATE TRIGGER tgrSalaryCheck
ON tblEmployee
FOR INSERT, UPDATE
    AS
BEGIN
    IF EXISTS(SELECT * FROM inserted WHERE Esalary < 0)
    BEGIN
        PRINT 'Salary Cannot be Negative'
        ROLLBACK TRANSACTION
    END
END

INSERT INTO tblEmployee VALUES (101, 'Shakti', 20, 'IT', -12)

UPDATE tblEmployee
SET ESalary = -13
WHERE Eid = 1

--7. Create a Update Trigger to log Salary change 

CREATE TRIGGER tgrUpdateLog
ON tblEmployee
FOR UPDATE
    AS
BEGIN
    PRINT 'Your Data has been updated'
END

UPDATE tblEmployee
SET ESalary = 12000
WHERE Eid = 1

--8. Create a Trigger to ensure that Product Price never exceeds 9999.
CREATE TRIGGER tgrCheckProdPrice
ON tblProducts
FOR INSERT, UPDATE
    AS
BEGIN
    IF EXISTS(SELECT * FROM inserted WHERE Price > 9999)
    BEGIN
        PRINT 'Product Price Should be less then 10000'
        ROLLBACK TRANSACTION
    END
END

--9. Create a trigger that prevents a user from deleting more than 5 products in a single  DELETE statement. 
CREATE TRIGGER tgrCheckDltCount
ON tblProducts
FOR DELETE
    AS
BEGIN
    IF EXISTS(SELECT COUNT(*) FROM deleted) > 5
    BEGIN
        PRINT 'You cannot delete more then 5 products'
        ROLLBACK TRANSACTION
    END
END

--10.Create a trigger to prevent Schema changes/ Structure modification on a database.
CREATE TRIGGER tgrSchemaChanges
ON DATABASE
FOR ALTER_TABLE
    AS
BEGIN
    PRINT 'You Cannot able to change Structure of the table'
    ROLLBACK TRANSACTION
END

