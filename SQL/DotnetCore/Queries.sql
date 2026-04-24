CREATE DATABASE EmployeeDB

USE EmployeeDB

CREATE TABLE Employees
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Salary DECIMAL(18, 2)
)

INSERT INTO Employees (Name, Salary) VALUES ('Shakti', 50000),('Rohit', 60000),( 'Anjali', 55000)

-- Stored Procedure for get, add, update and delete employee
CREATE PROCEDURE GetEmployees
AS
BEGIN
    SELECT * FROM Employees
END

--get by id
CREATE PROCEDURE GetEmployeeById
    @Id INT
AS
BEGIN
    SELECT * FROM Employees WHERE Id = @Id
END

CREATE PROCEDURE AddEmployee
    @Name NVARCHAR(100),
    @Salary DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO Employees (Name, Salary) VALUES (@Name, @Salary)
END

CREATE PROCEDURE UpdateEmployee
    @Id INT,
    @Name NVARCHAR(100),
    @Salary DECIMAL(18, 2)
AS
BEGIN
    UPDATE Employees SET Name = @Name, Salary = @Salary WHERE Id = @Id
END

CREATE PROCEDURE DeleteEmployee
    @Id INT
AS
BEGIN
    DELETE FROM Employees WHERE Id = @Id
END