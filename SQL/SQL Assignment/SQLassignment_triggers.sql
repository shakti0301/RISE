CREATE DATABASE TriggerPracticeDB

USE TriggerPracticeDB

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
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
VALUES (2, 'John Doe', 'john.doe@gmail.com', 'Data Analyst', 9000)

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

SELECT * FROM EmployeeLog
SELECT * FROM Employees

--4. How to disable a trigger?
DISABLE TRIGGER trg_AfterInsertEmployee ON Employees

--5. How to enable a trigger?
ENABLE TRIGGER trg_AfterInsertEmployee ON Employees

--6. How to drop a trigger?
DROP TRIGGER trg_AfterInsertEmployee

