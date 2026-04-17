CREATE DATABASE AdoDemo;
USE AdoDemo;

CREATE TABLE Students (
    Id INT,
    Name VARCHAR(50),
    Age INT
);


INSERT INTO Students VALUES 
(1, 'Shakti', 20),
(2, 'Shyam', 22),
(3, 'Kushal', 21);

SELECT * FROM Students;




-- Employees table
CREATE TABLE Employee (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);

SELECT * FROM Employee;


INSERT INTO Employee VALUES 
(1, 'Shakti', 50000.00),
(2, 'Shyam', 60000.00),
(3, 'Kushal', 55000.00);


CREATE PROCEDURE sp_InsertEmployee
    @Name VARCHAR(50),
    @Salary INT
AS
BEGIN
    INSERT INTO Employee(Name, Salary)
    VALUES(@Name, @Salary)
END



CREATE PROCEDURE sp_UpdateEmployee
    @Id INT,
    @Name VARCHAR(50),
    @Salary INT
AS
BEGIN
    UPDATE Employee
    SET Name=@Name, Salary=@Salary
    WHERE Id=@Id
END



CREATE PROCEDURE sp_DeleteEmployee
    @Id INT
AS
BEGIN
    DELETE FROM Employee WHERE Id=@Id
END



CREATE PROCEDURE sp_GetEmployees
AS
BEGIN
    SELECT * FROM Employee
END