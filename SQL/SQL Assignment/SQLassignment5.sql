CREATE DATABASE Assignment
USE Assignment

Create Table Products( ProductID INT, ProductName VARCHAR(255), Quantity INT CHECK (Quantity>0), SalesUnit INT, Price Money, City Varchar(255))

INSERT INTO Products VALUES
(1, 'Smartphone', 30, 12, 28000, 'Vadodara'),
(2, 'Laptop', 20, 10, 65000, 'Vadodara'),
(3, 'Smartphone', 50, 25, 30000, 'Ahmedabad'),
(4, 'Laptop', 40, 18, 78000, 'Ahmedabad'),
(5, 'Smartphone', 10, 5, 22000, 'Surat'),
(6, 'Laptop', 60, 30, 82000, 'Surat'),
(7, 'Laptop', 19, 8, 70000, 'Mumbai'),
(8, 'Laptop', 15, 8, 70000, 'Mumbai'),
(9, 'Smartphone', 25, 14, 26000, 'Pune'),
(10,'Laptop', 35, 20, 90000, 'Pune');

--1. Find all products that have a Quantity greater than the average quantity of all products.
SELECT ProductID, ProductName, Quantity FROM Products WHERE Quantity > (SELECT AVG(Quantity) FROM Products)

--2. Display the ProductName of products sold in the same city as 'Laptop'.
SELECT ProductName FROM Products WHERE City IN (SELECT City FROM Products WHERE ProductName = 'Laptop')

--3. SELECT MAX(Quantity) FROM Products₹
SELECT * FROM Products WHERE Quantity = (SELECT MAX(Quantity) FROM Products)

--4. List products whose salesUnit is higher than the salesUnit of ProductID 5.
SELECT ProductName, ProductID FROM Products WHERE Quantity > (SELECT MAX(Quantity) FROM Products)

--5. Find products that have a lower Quantity than the minimum Quantity found in 'Vadodara'.
SELECT ProductName, ProductID FROM Products WHERE Quantity < (SELECT MIN(Quantity) FROM Products WHERE City = 'Vadodara')

--6. Display products whose salesUnit is greater than the average salesUnit of products in 'Mumbai'.
SELECT ProductName FROM Products WHERE SalesUnit > (SELECT AVG(SalesUnit) FROM Products WHERE City = 'Mumbai')

--7.Find the product name with the lowest salesUnit
SELECT ProductName FROM Products WHERE SalesUnit = (SELECT MIN(SalesUnit) FROM Products)

--8. List all products sold in cities that have more than 50 total Quantity across all their products.
SELECT * FROM Products WHERE City IN (SELECT City FROM Products GROUP BY City HAVING SUM(Quantity) > 50)

--9. Show products whose Quantity is exactly equal to the salesUnit of 'Smartphone'.
SELECT * FROM Products WHERE Quantity IN (SELECT SalesUnit FROM Products WHERE ProductName = 'SmartPhone')

--10. Find the city which has the product with the highest salesUnit.
SELECT City FROM Products WHERE SalesUnit = (SELECT MAX(SalesUnit) FROM Products)

--11. Find all products sold in cities where at least one product has a Quantity of zero.
SELECT * FROM Products WHERE City IN (SELECT City FROM Products WHERE Quantity = 0)

--12. List products whose salesUnit is greater than the salesUnit of all products in 'Surat'.
SELECT ProductName FROM Products WHERE SalesUnit > ALL(SELECT MAX(SalesUnit) FROM Products WHERE City = 'Surat')

--13. Find products that belong to cities where the average salesUnit is greater than 10.
SELECT * FROM Products WHERE City IN (SELECT City FROM Products GROUP BY City HAVING AVG(SalesUnit) > 10)

--14. Display products that have a Quantity greater than any product's Quantity in 'Pune'.
SELECT * FROM Products WHERE Quantity > ANY (SELECT Quantity FROM Products WHERE City = 'Pune')

--15. Find all products whose ProductName is the same as any product sold in 'Ahmadabad'.
SELECT * FROM Products WHERE ProductName = ANY (SELECT ProductName FROM Products WHERE City = 'Ahmedabad')

--16. Select products where the Quantity is greater than the average Quantity of their own City.


--17. Find cities where the total salesUnit is higher than the total salesUnit of 'Vadodara'.
SELECT City FROM Products WHERE salesUnit > (SELECT SUM(salesUnit) FROM Products WHERE City = 'Vadodara')

--18. List products that are sold in the city that has the maximum variety (count) of products.


--19. Find the second highest Quantity from the Product table using a subquery.
SELECT MAX(Quantity) AS SecondHighestQuantity FROM Products WHERE Quantity < (SELECT MAX(Quantity) FROM Products)

--20. Display the ProductName and a calculated column showing the difference between its Quantity and the global average Quantity.
SELECT ProductName, Quantity - (SELECT AVG(Quantity) FROM Products) AS Quantity_Difference FROM Products;

SELECT * FROM products
