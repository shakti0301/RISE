CREATE DATABASE Assignment_2;
USE Assignment_2;

CREATE TABLE employee (Eid INT Identity(101,1), name VARCHAR(20), age INT, Salary Money, Edepartment VARCHAR(30))

-- 1. Add a record for 'Suresh Patel’, age 28, salary 55000, in 'IT' with EID 101.
INSERT INTO employee VALUES ('Suresh Patel', 28, 55000, 'IT')
SELECT * FROM employee

-- 2. Add a record for 'Mahesh Patel' (EID 102) where the Edepartment is explicitly set to NULL.
INSERT INTO employee (name, age, Salary) VALUES ('Mahesh Patel', 29, 65000)

-- 3. Add three employees (EIDs 103, 104, 105) using a single VALUES list.
INSERT INTO employee (name, age, Salary, Edepartment) VALUES ('Krupesh Patel', 25, 60000, 'IT'), ('Jayesh Patel', 23, 33000, 'Sales'), ('Ramesh Patel', 29, 90000, 'HR')

-- 4. Add a record for 'Jayesh Patel' (EID 106) specifying only the EID and Ename columns.
INSERT INTO employee (name) VALUES ('Jayesh')

--5. Add a record for a new hire in 'HR' with EID 107.
INSERT INTO employee (name, age, Salary, Edepartment) VALUES ('Shailesh', 34, 76000, 'HR')

--6. Change the Edepartment to 'Marketing' for any employee whose current department IS NULL.
UPDATE employee SET Edepartment = 'Marketing' WHERE Edepartment is Null

--7. Change the Edepartment to 'Tech' for any employee whose City is Vadodara
ALTER TABLE employee ADD City VARCHAR(30);
UPDATE employee SET City = 'Anand' WHERE Eid in (101, 104, 105)
UPDATE employee SET City = 'Vadodara' WHERE Eid = 102
UPDATE employee SET City = 'Surat' Where Eid in (103, 106, 107)
UPDATE employee SET Edepartment = 'Tech' WHERE City = 'Vadodara'

--8. Update the salary to 75000 for employees whose EID is IN the list (101, 103).
UPDATE employee SET Salary = 75000 WHERE Eid in (101, 103)

--9. Update the Edepartment to 'Management' for employees whose Eage is 22.
UPDATE employee SET age = 22 Where name = 'Mahesh Patel'
UPDATE employee SET Edepartment = 'Management' Where age = 22

--10.Update the Esalary to 80000 for everyone whose name is Suresh
UPDATE employee SET Salary = 80000 WHERE name = 'Suresh'

--11. Remove the record for the employee whose EID is (105).
DELETE employee WHERE Eid = 105

--12. Remove all employees who work in departments 'Marketing'.
DELETE employee WHERE Edepartment = 'Marketing'

--13. Remove employees whose Eage is 25.
DELETE employee WHERE age = 25

--14. Remove records where the Esalary IS NULL.
DELETE employee WHERE Salary is NULL

--15.Use the TRUNCATE command to empty the entire table at once
TRUNCATE TABLE employee