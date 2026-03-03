CREATE DATABASE TriggerPracticeDB

USE TriggerPracticeDB

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Role VARCHAR(50),
    Salary INT
)

--1. Create an AFTER INSERT trigger to log new employees.
CREATE TABLE EmployeeLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    Action VARCHAR(50),
    Timestamp DATETIME DEFAULT GETDATE()
)

CREATE TRIGGER trg_AfterInsertEmployee
ON Employees
FOR INSERT
AS
BEGIN
    INSERT INTO EmployeeLog (EmployeeID, Action)
    SELECT EmployeeID, 'Inserted' FROM inserted
END

INSERT INTO Employees (EmployeeID, Name, Email, Role, Salary)
VALUES (1, 'Shakti Raolji', 'shakti.raolji@gmail.com', 'Software Engineer', 75000)

SELECT * FROM EmployeeLog
SELECT * FROM Employees


--2. Create a trigger to prevent salary < 10000.
CREATE TRIGGER trg_PreventLowSalary
ON Employees
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Salary < 10000)
    BEGIN
        PRINT 'Salary must be at least 10000. Transaction rolled back.'
        ROLLBACK TRANSACTION
    END
END

INSERT INTO Employees (EmployeeID, Name, Email, Role, Salary)
VALUES (2, 'Happy Patel', 'happy.patel@gmail.com', 'Data Analyst', 9000)

INSERT INTO Employees (EmployeeID, Name, Email, Role, Salary)
VALUES (3, 'Kathan Darji', 'kathan.darji@gmail.com', 'Project Manager', 12000)

UPDATE Employees
SET Salary = 8000
WHERE EmployeeID = 3

SELECT * FROM EmployeeLog
SELECT * FROM Employees


--3. Create AFTER DELETE trigger to log deleted records.

CREATE TRIGGER trg_AfterDeleteEmployee
ON Employees
FOR DELETE
AS
BEGIN
    INSERT INTO EmployeeLog (EmployeeID, Action)
    SELECT EmployeeID, 'Deleted' FROM deleted
END

DELETE FROM Employees
WHERE EmployeeID = 1


--4. How to disable a trigger?
DISABLE TRIGGER trg_AfterInsertEmployee ON Employees


--5. How to enable a trigger?
ENABLE TRIGGER trg_AfterInsertEmployee ON Employees


--6. How to drop a trigger?
DROP TRIGGER trg_AfterInsertEmployee


--7. Prevent deletion of Manager role.
CREATE TRIGGER trg_PreventDeletionOfManager
ON Employees
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM deleted WHERE role LIKE '%Manager%')
    BEGIN
        PRINT 'You Cant able to delete data of Manager'
        ROLLBACK TRANSACTION
    END
END

DELETE From Employees WHERE EmployeeID = 3


--8. Create trigger to prevent duplicate email.
CREATE TRIGGER trg_PreventDuplicateEmail
ON Employees
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        JOIN Employees e
        ON i.Email = e.Email
        AND i.EmployeeID <> e.EmployeeID
    )
    BEGIN
        PRINT 'Duplicate email detected. Transaction rolled back.'
        ROLLBACK TRANSACTION
    END
END

INSERT INTO Employees (EmployeeID, Name, Email, Role, Salary)
VALUES (5, 'Kushal Parikh', 'kushal.parikh@gmail.com', 'Data Scientist', 90000)

UPDATE Employees
SET Email = 'kushal.parikh@gmail.com'
WHERE EmployeeID = 3


--9. How to check existing triggers on a table?
SELECT name AS TriggerName
FROM sys.triggers


--10.Create a trigger to prevent UPDATE of primary key.
CREATE TRIGGER trg_PreventUpdatePrimaryKey
ON Employees
FOR UPDATE
AS
BEGIN
    IF UPDATE(EmployeeID)
    BEGIN
        PRINT 'Updating EmployeeID is not allowed.'
        ROLLBACK TRANSACTION
    END
END

UPDATE Employees
SET EmployeeID = 10
WHERE EmployeeID = 5

--11.Create a trigger to prevent table drop.
CREATE TRIGGER trg_PreventTableDrop
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
    PRINT 'Dropping tables is not allowed.'
    ROLLBACK TRANSACTION
END

DROP TABLE Employees

--12.Create a trigger to log when an employee record is deleted.
CREATE TRIGGER trg_AfterDeleteEmployee
ON Employees
FOR DELETE
AS
BEGIN
    INSERT INTO EmployeeLog (EmployeeID, Action)
    SELECT EmployeeID, 'Deleted' FROM deleted
END

--13.Create a trigger to prevent negative Salary.
CREATE TRIGGER trg_PreventNegativeSalary
ON Employees
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Salary < 0)
    BEGIN
        PRINT 'Salary cannot be negative. Transaction rolled back.'
        ROLLBACK TRANSACTION
    END
END

INSERT INTO Employees (EmployeeID, Name, Email, Role, Salary)
VALUES (6, 'Shiv Patel', 'shiv.patel@gmail.com', 'Data Analyst', -1)
--'trg_PreventLowSalary' fires first and rolls back the transaction, so 'trg_PreventNegativeSalary' never executes.


--14.Create a trigger to ensure the Salary is non negative.
CREATE TRIGGER trg_EnsureSlaryNonNegative
ON Employees
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Salary < 0)
    BEGIN
        PRINT 'Salary cannot be negative. Transaction rolled back.'
        ROLLBACK TRANSACTION
    END
END

--'trg_PreventLowSalary' fires first and rolls back the transaction, so 'trg_EnsureSlaryNonNegative' never executes.


--15.Disable all triggers on a table.
DISABLE TRIGGER ALL ON Employees
