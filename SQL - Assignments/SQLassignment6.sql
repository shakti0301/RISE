CREATE DATABASE Assignment6
USE Assignment6

Create Table Employee (
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

Insert Into Employee Values 
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
('P2', 'Finance', 'E104')
('P1', 'Data Mitigation', 'E101'),
('P2', 'Health', 'E102'),
('P3', 'Fintech', 'E105')

Insert Into Manager Values
(10, 'Aliace'),
(20, 'Bob'),
(40, 'Jhon')

-- 1. Display each employee's name and their corresponding department name.
Select E.Ename, D.Dname 
From Employee E
Inner Join Department D
ON E.DID = D.DID

--2. List all projects along with the name of the employee assigned to them.
SELECT P.Pname, E.Ename 
From Project P
Inner Join Employee E
On P.EID = E.EID

--3. Show the names of employees and the names of their managers.
SELECT M.Mname, E.Ename 
From Manager M
Inner Join Employee E
On M.MID = E.MID

--4. Display the Project ID and the Department ID for every project.
SELECT P.PID, D.DID 
From Project P
Inner Join Employee E 
On P.EID = E.EID
Inner Join Department D
ON E.DID = D.DID

--5. List employees who work in the 'IT' department.
SELECT E.Ename, D.Dname
From Employee E
Inner Join Department D 
ON E.DID = D.DID
Where D.Dname = 'IT'

--6. Display employee names and their manager names for all employees in department 1.
Select E.Ename,M.Mname
From Employee E
Inner Join Manager M
ON E.MID = M.MID
Where E.DID = 1

--7. Show all projects handled by ‘Suresh’.
Select P.Pname, E.Ename 
From Project P
Inner Join Employee E 
ON P.EID = E.EID
Where E.Ename = 'Suresh'

--8. Find the department name associated with Project ID P1.
Select D.Dname
From Department D
Inner Join Employee E
ON D.DID = E.DID
Inner Join Project P
ON E.EID = P.EID
Where P.PID = 'P1'

--9. List all employees whose manager's name is 'Bob'.
Select M.Mname, E.Ename
From Manager M
Inner Join Employee E
ON M.MID = E.MID
Where M.Mname = 'Bob'

--10. Display the count of employees in each department name.
Select D.Dname, Count(E.EID) AS 'Number of Employee'
From Department D
Left Join Employee E
ON D.DID = E.DID
GROUP BY D.Dname

--11. List all departments and the employees working in them (including departments with no employees).
Select D.Dname, E.Ename
From Department D
Left Join Employee E
ON D.DID = E.DID

--12. Display all employees and the projects they are assigned to (including those with no projects).
Select E.Ename, P.Pname
From Employee E
Left Join Project P
ON P.EID = E.EID

--13. Show the names of employees, their department names, and their manager names in one result.
Select E.Ename, D.Dname, M.Mname
From Department D
Inner Join Employee E
ON D.DID = E.DID
Inner Join Manager M
ON M.MID = E.MID

--14. Find all projects and the department name they belong to.
Select P.Pname, D.Dname
From Project P
Inner Join Employee E
ON P.EID = E.EID
Inner join Department D
ON E.DID = D.DID

--15. List all managers and the names of employees reporting to them (including managers with no reporters).
Select M.Mname, E.Ename
From Manager M
Left Join Employee E
ON M.MID = E.MID

--16. Find employees who are NOT assigned to any project.
Select E.Ename AS 'Employee with no Project'
From Employee E
Left Join Project P
ON P.EID = E.EID
Where P.PID IS NUll

--17. Display the names of all employees and the names of projects, but only for those in the ‘IT’ department.
Select P.Pname, E.Ename
From Project P
Inner Join Employee E
ON P.EID = E.EID
Inner Join Department D
ON D.DID = E.DID
Where D.Dname = 'IT'

--18. Show the names of managers who are managing employees in the 'Finance' department.
Select M.Mname , E.Ename
FROM Manager M
INNER JOIN Employee E
ON M.MID = E.MID
Inner Join Department D
ON D.DID = E.DID
where D.Dname = 'Finance'

--19.Display Department Name, Employee Name, and Project Name for all matches.
Select D.Dname, E.Ename, P.Pname
From Department D
Inner JOIN Employee E
ON D.DID = E.DID
Inner Join Project P
ON P.EID = E.EID

--20. List all projects and the manager's name responsible for the employee assigned to that project.
Select P.Pname, M.Mname
From Project P
Inner Join Employee E
ON P.EID = E.EID
Inner Join Manager M
ON M.MID = E.MID