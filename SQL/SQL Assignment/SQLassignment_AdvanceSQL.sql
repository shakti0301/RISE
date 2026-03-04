CREATE DATABASE AdvanceSQL

USE AdvanceSQL

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Budget DECIMAL(12,2)
)

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    HireDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    ReorderLevel INT DEFAULT 10
)

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

CREATE TABLE EmployeeAudit (
    AuditID INT PRIMARY KEY,
    EmployeeID INT,
    Action VARCHAR(50),
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME
)


INSERT INTO Departments VALUES
(1,'IT','New York',500000),
(2,'HR','Chicago',300000),
(3,'Sales','Boston',400000)

INSERT INTO Employees 
(EmployeeID,FirstName,LastName,Email,DepartmentID,Salary,HireDate)
VALUES
(101,'John','Smith','john@email.com',1,55000,'2022-05-01'),
(102,'Sarah','Johnson','sarah@email.com',2,62000,'2021-03-10'),
(103,'Michael','Brown','michael@email.com',1,48000,'2023-01-15'),
(104,'Emily','Davis','emily@email.com',3,71000,'2020-09-21'),
(105,'David','Wilson','david@email.com',2,54000,'2022-12-05')

INSERT INTO Products VALUES
(201,'Laptop','Electronics',1200,50,10),
(202,'Mouse','Electronics',25,150,20),
(203,'Desk Chair','Furniture',250,30,5),
(204,'Monitor','Electronics',300,8,10),
(205,'Keyboard','Electronics',75,100,15)

