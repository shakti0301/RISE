USE January2026

SELECT * FROM Employee

--A. Arithmetic Operators (+, -, , /)
--1. Display the Ename and a 10% bonus amount for every employee
SELECT Ename, ESalary * 0.10 AS 'Bonus_Amount' FROM Employee

--2. Calculate the new salary for all employees if everyone gets a flat raise of ₹5,000.
SELECT Ename, ESalary + 5000 AS 'New_Salary' FROM Employee

--3. If an employee's age is increased by 2, what would it be? Display Ename and ProjectedAge.
SELECT Ename, Eage + 2 AS 'Projected_Age' FROM Employee

--4. Show the Ename and the monthly salary deduction if a 2% professional tax is applied to the current salary.
SELECT Ename, ESalary - (ESalary * 0.02) AS 'Monthly_Salary_After_Tax' FROM Employee

--B. Comparison Operators (=, <>, !=, <, >, <=, >=)
--6. List all employees who are exactly 20 years old.
SELECT * FROM Employee Where Eage = 20

--7. Find all employees whose salary is greater than 20,000.
SELECT * FROM Employee WHERE ESalary > 20000

--8. Display details of employees who do not belong to the 'Cloud' department.
SELECT * FROM Employee Where Department <> 'Cloud'

--9. List employees who were hired at an age of 25 or younger.
ALTER TABLE Employee ADD Joining_Date DATE;
SELECT * FROM Employee WHERE Eage <= 25

--10. Find employees whose salary is less than or equal to 25,000.
SELECT * FROM Employee WHERE ESalary <= 25000

--C. Logical Operators (AND, OR, NOT)
--11. List employees who work in the 'IT' department AND have a salary greater than 30,000.
SELECT * FROM Employee WHERE Department = 'IT' AND ESalary > 30000

--12. Find employees who are either in the 'Sales' department OR the 'Marketing' department.
SELECT * FROM Employee WHERE Department = 'Sales' OR Department = 'Marketing'

--13.Display employees who are older than 30 but do NOT work in the 'Finance' department.
SELECT * FROM Employee WHERE Eage > 30 AND Department <> 'Finance'

--14. Find employees whose age is 28 AND salary is exactly 30,000.
SELECT * FROM Employee WHERE Eage = 28 AND ESalary = 30000

--15. List all employees who are NOT in the 'Admin' department and have a salary above 20,000.
SELECT * FROM Employee WHERE Department <> 'Admin' AND ESalary > 20000

-- D. Special Operators (BETWEEN, IN, LIKE, IS NULL)
--16. Find employees whose age is between 25 and 35 (inclusive).
SELECT * FROM Employee WHERE Eage BETWEEN 25 AND 35

--17. List employees who work in any of these departments: 'IT', 'HR', or 'Operations'.
SELECT * FROM Employee WHERE Department IN ('IT', 'HR', 'Operations')

--18. Find all employees whose name starts with the letter 'A'.
SELECT * FROM Employee Where Ename LIKE 'A%'

--19. List employees whose salary is in the range of 25,000 to 35,000 using the BETWEEN operator.
SELECT * FROM Employee WHERE ESalary BETWEEN 25000 AND 35000

--20. Find employees whose Department value is missingList employees who are NOT in the 'IT' or 'Sales' departments using the NOT IN operator.
SELECT * FROM Employee WHERE Department NOT IN ('IT', 'Sales')

--21. Find employees whose name ends with the letter 'n'.
SELECT * FROM Employee WHERE Ename LIKE '%n'

--22. Show employees whose age is NOT between 20 and 30.
SELECT * FROM Employee WHERE Eage NOT BETWEEN 20 AND 30