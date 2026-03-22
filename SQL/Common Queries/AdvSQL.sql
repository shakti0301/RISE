USE Jan2026

--ADVANCE SQL
------------------STORED PROCEDURE----------------------

--Simple stored procedure

CREATE PROCEDURE spGetEmpSalary_
AS
BEGIN
    SELECT Eid, Esalary
    FROM Employee
END


-- It has 3 method to execute the stored procedure
spGetEmpSalary_
EXEC spGetEmpSalary_
Execute spGetEmpSalary_


--Alter
Alter PROCEDURE spGetEmpSalary_
AS
BEGIN
    SELECT Eid, Department, Esalary
    FROM Employee
END


spGetEmpSalary_


sp_helptext 'spGetEmpSalary_'    -- It will show the code of the stored procedure, but if use with encryption then it will not show the code of the stored procedure
sp_help 'spGetEmpSalary_'        -- It will show the information of the stored procedure
sp_depends 'spGetEmpSalary_'     -- It will show the dependencies of the stored procedure, but it is not recommended to use this command because it may give wrong information


spGetEmpSalary_ WHERE Eid = 1      -- It will give error because we cannot use where clause with stored procedure, but we can use where clause with function

--For predefine stored procedure we write 'sp_' and for user defined stored procedure we write 'sp' but it is not mandatory, it is just a convention to write 'sp_' for predefine stored procedure and 'sp' for user defined stored procedure

-- Drop Procedure
DROP PROCEDURE spGetEmpSalary_


-- Stored procedure with parameters

-- Using input parameters

CREATE PROCEDURE spGetEmpDetailsById
    @Eid INT
    AS
BEGIN
    SELECT *
    FROM Employee
    WHERE Eid = @Eid
END

spGetEmpDetailsById 1

SELECT * FROM Employee

CREATE PROCEDURE spGetEmpDetailsByTwoVar
    @Age INT,
    @DeptName VARCHAR(255)
    AS
BEGIN
    SELECT *
    FROM Employee
    WHERE Eage >= @Age
    AND Department = @DeptName
END

spGetEmpDetailsByTwoVar @Age = 3, @DeptName = 'Full Stack'



--Using Output parameter

CREATE PROCEDURE spGetEmpDeptCount
    @Deptname varchar(20),
    @Empcount INT Output
    AS
BEGIN
    SELECT @Empcount = COUNT(Eid) From Employee
    WHERE Department = @Deptname
END

DECLARE @Total INT
EXECUTE spGetEmpDeptCount 'Full Stack', @Total Output  -- If i didnt write 'output here then it will conside null, not gives an error but return null value'
Print @Total

SELECT * FROM Employee

-- Get Orders placed by customers based on Customer ID using stored procedure with input parameter
CREATE TABLE Customers
(
    CustomerId INT PRIMARY KEY,
    CustomerName VARCHAR(255)
)
CREATE TABLE Orders
(
    OrderId INT PRIMARY KEY,
    CustomerId INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
)

INSERT INTO Customers (CustomerId, CustomerName) 
VALUES (1, 'John Doe'), 
(2, 'Jane Smith'), 
(3, 'Alice Johnson')

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount) 
VALUES (1, 1, '2024-01-01', 100.00), 
(2, 1, '2024-01-15', 150.00), 
(3, 2, '2024-02-01', 200.00), 
(4, 3, '2024-03-01', 250.00), 
(5, 3, '2024-03-15', 300.00)


CREATE PROCEDURE spGetOrdersByCustomerId
    @CustomerId INT
    AS
BEGIN
    SELECT o.OrderId, o.OrderDate, o.TotalAmount
    FROM Orders o
    INNER JOIN Customers c 
    ON o.CustomerId = c.CustomerId
    WHERE c.CustomerId = @CustomerId
END

EXEC spGetOrdersByCustomerId 1


-- Total Spent by customer 

Create PROCEDURE spGetTotalAmountByCustomerId
    @CustomerId INT,
    @TotalAmount DECIMAL(10, 2) OUTPUT
    AS
BEGIN 
    SELECT @TotalAmount = SUM(o.TotalAmount * o.Quantity)
    FROM Order o
    JOIN Customer c
    ON o.CustomerID = c.CustomerID
    WHERE c.CostomerID = @CustomerId
END


DECLARE @TotalBill DECIMAL(10,2)
Execute spGetTotalAmountByCustomerId 1, @TotalBill Output
PRINT 'The Total bill of the Customer is ' + CAST (@TotalBill as Varchar)


-- Inserting Velues in a table using stored procedure
CREATE PROCEDURE spInsertCustomer
    @CustomerName VARCHAR(255)
    AS
BEGIN
    INSERT INTO Customers (CustomerName)
    VALUES (@CustomerName)
END
EXEC spInsertCustomer 'Shakti Raolji'
SELECT * FROM Customers


--Updating values in a table using stored procedure
CREATE PROCEDURE spUpdateCustomerName
    @CustomerId INT,
    @NewCustomerName VARCHAR(255)
    AS
BEGIN
    UPDATE Customers
    SET CustomerName = @NewCustomerName
    WHERE CustomerId = @CustomerId
END

EXEC spUpdateCustomerName 1, 'Shakti Raolji'
SELECT * FROM Customers

-- Deleting values from a table using stored procedure
CREATE PROCEDURE spDeleteCustomer
    @CustomerId INT
    AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerId = @CustomerId
END
EXEC spDeleteCustomer 1

-- To find products by productname in a e-commerse website
Create PROCEDURE spSearchProduct
@Proname VARCHAR(20)
    AS
BEGIN
    SELECT ProductID, ProductName, Price
    FROM Products
    WHERE ProductName LIKE '%' + @Proname + '%'
END

spSearchProduct 'Laptop'

-- To decrease dtock of a product after purchase
CREATE PROCEDURE spDecreaseStock
    @ProductId INT,
    @Quantity INT
    AS
BEGIN
    UPDATE Products
    SET Stock = Stock - @Quantity
    WHERE ProductID = @ProductId
END

spDecreaseStock 1, 4

-- Create SP to retrive details of all employees working in a given project 
CREATE PROC spProjectEmpDetails
@Projectname Varchar(200)
    AS
BEGIN
    SELECT e.Eid, e.Ename, p.pname
    FROM Employees e
    JOIN Project p
    ON e. Eid = p.Eid
    WHERE Pname = @Projectname
END


spProjectEmpDetails 'Data Migration'


-- Select SP that retrives all employees details with the specific Eid 

CREATE PROCEDURE spEmpDetailsByEid
@EID INT
AS
BEGIN
    SELECT *
    FROM Employee
    WHERE Eid = @EID
END

spEmpDetailsByEid 2

--Create procedure to imcrease or decrease product price
CREATE PROCEDURE spProductPriceChange
@Productname Varchar(20),
@percentageChange Decimal (5,2)
AS
BEGIN
    UPDATE Products
    SET Price = Price + (Price * @percentageChange)
    WHERE ProductName = @Productname
END 

spProductPriceChange 'Product A', 0.10


-- Max Salary of emp in dept

Create proc spMaxSalaryDept
@Department varchar(20),
@MaxSalary Money Output
AS
BEGIN
    Select @MaxSalary = Max(Esalary) 
    from employee
    where department = @Department
END

DECLARE @Highest Money
Execute spMaxSalaryDept 'Full Stack', @Highest out
Print @Highest


Create proc spSalaryDept
@Department varchar(20),
@MaxSalary Money Output,
@MinSalary Money Output,
@AvgSalary Money Output
AS
BEGIN
    Select @MaxSalary = Max(Esalary),
           @MinSalary = Min(Esalary),
           @AvgSalary = Avg(Esalary) 
    from employee
    where department = @Department
END


DECLARE @Highest Money,
        @Lowest Money,
        @Average Money
Execute spSalaryDept 'Full Stack', @Highest out, @Lowest out, @Average out
Print @Highest
Print @Lowest
Print @Average



-- Triggers --

-- Event Driven means whenever something happen trigger are execute
-- It has 3 type 
-- DML (After (For), Instead of Trigger)
-- DDL 
-- Logon

--- Syntex ----

-- Create Trigger <TriggerName>
-- on <Tablename>
-- For <DML/DDL>
-- As
-- Begin
-- 	Print 'MSG'
-- End

-- Disable Trigger <TriggerName> ON <Tablename>
-- Enable Trigger <TriggerName> ON <Tablename>
-- Disable Trigger All ON <Tablename>
-- Enable Trigger All ON <Tablename>

-- Drop Trigger <TriggerName> 


Create Trigger InsertMsg
on Employee
For INSERT
As
Begin
	Print 'Your Record has been successfuly inserted into Employee Table'
End


Create Trigger UpdateMsg
on Employee
For Update
As
Begin
	Print 'Your Record has been successfuly Update into Employee Table'
End

Create Trigger DeleteMsg
on Employee
For DELETE
As
Begin
	Print 'Your Record has been successfuly Delete from Employee Table'
End
Select * from employee

Insert into Employee values (10, 'Shakti', 25, 'Full Stack', 50000)
Insert into Employee values (11, 'Raolji', 30, 'Data Science', 60000)
(12, 'Shakti Raolji', 35, 'Data Migration', 70000)

Update Employee set Esalary = Esalary + 5000 where Eid = 10

Delete from Employee where Eid = 11

-- ADVANTAGE of triggers 
-- login and security 

-- Create trigger to ristrict from creating 

CREATE Trigger trRestrictTableCreation
ON Database
For Create_Table
AS
BEGIN
    Print 'You are not able to create table in this DataBase'
    rollback;
END

Create Table Test 
(TID INT)
--give trigger error 
Drop trigger trRestrictTableCreation ON DataBase

-- if we want to restrict the access to create a new database on the server
CREATE Trigger trNoAccess
ON All server
For Create_Database
AS
BEGIN
    Print 'You are not able to create DB in this Server'
    rollback;
END

Create database new1

Drop trigger trNoAccess ON All Server

-- to alter the trigger
Alter Trigger trRestrictTableCreation
ON Database
For Create_Table
AS
BEGIN
    Print 'You are not able to create table in this DataBase'
    rollback;
END

Drop trigger trRestrictTableCreation ON Database

-- trigger for alteration restricting the alteration of table
CREATE Trigger trRestrictTableAlteration
ON Database
For Alter_Table
AS
BEGIN
    Print 'You are not able to Alter table in this DataBase'
    rollback;
END

Drop trigger trRestrictTableAlteration ON Database
--We can perform on server also 

-- for dropping also 

-- Temporary Table / Magical Table
-- inserted i , deleted d


Create Table Test(TID INT)

Create Trigger tr_tblEmployee_ForInsert
ON Test
FOR Insert
AS
Begin
    PRINT 'A new employee has been added';
    
    SELECT * FROM inserted;
END

Select * From Test

Insert into Test values(9)
Insert into Test values(1),(8)


Create Trigger tr_tblEmployee_ForInsertAndDelete
ON Test
FOR UPDATE
AS
Begin
    PRINT 'A new employee has been added';
    SELECT * FROM deleted;
    SELECT * FROM inserted;
End


UPDATE Test
set TID = 2
where tid = 1


Create Trigger tr_tblEmployee_ForDelete
ON Test
FOR Delete
AS
Begin
    PRINT 'A new employee has been added';
    SELECT * FROM deleted;
    SELECT * FROM inserted;
End

Delete From Test where TID = 2


Create Trigger DeleteMsg
on Employee
For DELETE
As
Begin
	Print 'Your Record has been successfuly Delete from Employee Table'
    Select * from deleted
End


create Trigger DeleteandUpdateMsg
on Test
For DELETE, Update
As
Begin
	Print 'Your Record has been successfuly ';
    Select * from deleted;
    select * from inserted;
End

Delete from Test where TID = 9

Update Test 
set tid = 2
Where tid = 8

Select * from employee

Select * from emp

Create trigger trPositiveSalary
on employee
after insert, update
as
begin
	if exists (select 1 from inserted where esalary<0)
	begin
		print 'Salary should not be negative. Transaction'
		rollback transaction;
	end
end


--AUDIT

CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)


Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)


CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)


CREATE TRIGGER tr_tblEMployee_ForInsert
ON tblEmployee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted

 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END

Insert into tblEmployee values (7,'Tan', 2300, 'Female', 3)
Select * from tblEmployeeAudit

CREATE TRIGGER tr_tblEMployee_ForDelete
ON tblEmployee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END

Select * From tblEmployee
Delete From tblemployee where id = 7

Select * From tblEmployeeAudit

--for update


-- Instead of insert : 

CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)

CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')


Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3)


Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

Select * from vWEmployeeDetails

Insert into vWEmployeeDetails values(7, 'Valarie', 'Female', 'IT')

Create trigger tr_vWEmployeeDetails_InsteadOfInsert
on vWEmployeeDetails
Instead Of Insert
as
Begin
 Declare @DeptId int
 
 --Check if there is a valid DepartmentId
 --for the given DepartmentName
 Select @DeptId = DeptId 
 from tblDepartment 
 join inserted
 on inserted.DeptName = tblDepartment.DeptName
 
 --If DepartmentId is null throw an error
 --and stop processing
 if(@DeptId is null)
 Begin
  Raiserror('Invalid Department Name. Statement terminated', 16, 1) --16 is the severiaty leval of the error(general error) and 1 is status , instead of htis we can perform it by print also 
  return
 End
 
 --Finally insert into tblEmployee table
 Insert into tblEmployee(Id, Name, Gender, DepartmentId)
 Select Id, Name, Gender, @DeptId
 from inserted
End

Insert into vWEmployeeDetails values(7, 'Valarie', 'Female', 'IT')
select * from vWEmployeeDetails
select * from tblEmployee
select * from tblDepartment

drop table tblDepartment
drop table tblEmployee
drop view vWEmployeeDetails

-- Instead of update 
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)

CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3)

Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId


select * from vWEmployeeDetails

--1st limitation - not possible
Update vWEmployeeDetails 
set Name = 'Johny', DeptName = 'IT'
where Id = 1

--2nd limitation - afftect more rows
Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1

select * from tblDepartment

Create Trigger tr_vWEmployeeDetails_InsteadOfUpdate
on vWEmployeeDetails
instead of update
as
Begin
 -- if EmployeeId is updated
 if(Update(Id))
 Begin
  Raiserror('Id cannot be changed', 16, 1)
  Return
 End
 
 -- If DeptName is updated
 if(Update(DeptName)) 
 Begin
  Declare @DeptId int

  Select @DeptId = DeptId
  from tblDepartment
  join inserted
  on inserted.DeptName = tblDepartment.DeptName
  
  if(@DeptId is NULL )
  Begin
   Raiserror('Invalid Department Name', 16, 1)
   Return
  End
  
  Update tblEmployee set DepartmentId = @DeptId
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
  -- If gender is updated
 if(Update(Gender))
 Begin
  Update tblEmployee set Gender = inserted.Gender
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If Name is updated
 if(Update(Name))
 Begin
  Update tblEmployee set Name = inserted.Name
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
End

Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1

select * from vWEmployeeDetails
select * from tblemployee
select * from tblDepartment

Update vWEmployeeDetails 
set Name = 'Johny', Gender = 'Female', DeptName = 'ITes' 
where Id = 1

-- Instead of Delete 

Delete from vWEmployeeDetails where Id = 1 --Not possible 


Create Trigger tr_vWEmployeeDetails_InsteadOfDelete
on vWEmployeeDetails
instead of delete
as
Begin
 Delete tblEmployee 
 from tblEmployee
 join deleted
 on tblEmployee.Id = deleted.Id
 
 --Subquery
 --Delete from tblEmployee 
 --where Id in (Select Id from deleted)
End

Delete from vWEmployeeDetails where Id = 1

--logon trigger (generally used on server level)

select * from sys.dm_exec_sessions

select is_user_process,login_name 
from sys.dm_exec_sessions
order by login_time DESC



Create trigger trLogonTrigger
ON All Server
For Logon 
As
Begin 
 Declare @LoginName Varchar(100)
 set @LoginName = Original_login()

 If(
    Select COUNT(*) From sys.dm_exec_sessions
    Where is_user_process = 1
    AND Original_login_name = @LoginName) > 3
    Begin
        rollback;
    END
End

Drop trigger trLogonTrigger ON All Server

-- Windows Functions
--Over (to group using rows)

Select * From employee
 

SELECT EID, Ename, ESalary, Department,
SUM(ESalary) over (partition by Department) as deptwise
from Employee

Select EID, Ename, Esalary,
SUM(Esalary) Over (order by esalary) As Total,
Avg(Esalary) Over (order by esalary) As Average,
COUNT(Esalary) Over (order by esalary rows between unbounded preceding and current rows) As Counts
FROM Employee

Select Eid, Ename, Esalary,
dense_rank() Over (Order by esalary) as rankDenseValue
From employee



Select Eid, Ename, Esalary,
dense_rank() Over (Order by esalary DESC) as rankDenseValue
From employee


Select Eid, Ename, Esalary,
row_number() Over (Order by esalary DESC) as rowNum
From employee
