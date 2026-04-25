---------EmployeeDB-------------
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




-----------CompanyDB----------------
CREATE DATABASE CompanyDB
USE CompanyDB


CREATE Table Departments(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100)
)

CREATE TABLE Employees
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Salary DECIMAL(18,2),
    DepartmentId INT,

    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

INSERT INTO Departments (Name) VALUES ('IT'),('HR'),('Finance')

INSERT INTO Employees (Name, Salary, DepartmentId) VALUES ('Shakti', 50000, 1),('Rohit', 60000, 2),( 'Anjali', 55000, 3)


CREATE PROCEDURE GetEmployees
AS
BEGIN
    SELECT E.Id, E.Name, E.Salary, D.Name AS DepartmentName, E.DepartmentId
    FROM Employees E
    JOIN Departments D ON E.DepartmentId = D.Id
END


CREATE PROCEDURE GetDepartments
AS
BEGIN
    SELECT * FROM Departments
END


CREATE PROCEDURE AddEmployee
    @Name NVARCHAR(100),
    @Salary DECIMAL(18,2),
    @DepartmentId INT
AS
BEGIN
    INSERT INTO Employees (Name, Salary, DepartmentId)
    VALUES (@Name, @Salary, @DepartmentId)
END


CREATE PROCEDURE UpdateEmployee
    @Id INT,
    @Name NVARCHAR(100),
    @Salary DECIMAL(18,2),
    @DepartmentId INT
AS
BEGIN
    UPDATE Employees
    SET Name = @Name, Salary = @Salary, DepartmentId = @DepartmentId
    WHERE Id = @Id
END


CREATE PROCEDURE DeleteEmployee
    @Id INT
AS
BEGIN
    DELETE FROM Employees WHERE Id = @Id
END

CREATE PROCEDURE GetEmployeeById
    @Id INT
AS
BEGIN
    SELECT * FROM Employees WHERE Id = @Id
END

