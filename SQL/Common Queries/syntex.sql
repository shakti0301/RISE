--Here in this file there are the syntex of SQL Language

---------To create and use a DataBase---------
CREATE DATABASE <DB_NAME>
USE <DB_NAME>

-- To change the name of the database
--1
ALTER DATABASE <DB_NAME> 
RENAME TO <NEW_DB_NAME>

--2
Alter DATABASE <DB_NAME>
MODIFY NAME = <NEW_DB_NAME>

--To display list of all  the database in server
--1.
SHOW DATABASES

--2.
SELECT name FROM sys.databases

----------------------------------------------

-- Types of SQL Language
-- DDL (Data Defination Language) to create a structure - Create, Alter, Dorp, Truncate
-- DML (Data Manipulation Language) to modify the table or DB - Update, Insert, Delete
-- DQL (Data Query Language) to fetching data - Select 
-- TCL (Transaction Control Language) to control transaction / logs- commit, Rollback, Savepoint 

---------To create a table---------

CREATE TABLE <TABLE_NAME> (
    <COLUMN_NAME> <DATA_TYPE>,
    <COLUMN_NAME> <DATA_TYPE>,
    ...
);

-- To change the name of the table
--1.
ALTER TABLE <TABLE_NAME>
RENAME TO <NEW_TABLE_NAME>

--2.
sp_rename '<TABLE_NAME>', '<NEW_TABLE_NAME>'


-- To change the name of the column
--1.
ALTER TABLE <TABLE_NAME>
RENAME COLUMN <COLUMN_NAME> TO <NEW_COLUMN_NAME>

--2.
sp_rename '<TABLE_NAME>.<COLUMN_NAME>', '<NEW_COLUMN_NAME>', 'COLUMN'

-- To display list of all the tables in database
--1.
SHOW TABLES

--2.
SELECT name FROM sys.tables

-- To display the structure of the table
--1.
sp_help <TABLE_NAME>
sp_helptext <TABLE_NAME> -- To display the data type of the column

--To add a Col 
ALTER TABLE <TABLE_NAME>
ADD <COLUMN_NAME> <DATA_TYPE>

--To delete a Col
ALTER TABLE <TABLE_NAME>
DROP COLUMN <COLUMN_NAME>

--To change the data type of a column
ALTER TABLE <TABLE_NAME>
ALTER COLUMN <COLUMN_NAME> <NEW_DATA_TYPE>

--To change the name of the column
ALTER TABLE <TABLE_NAME>
RENAME COLUMN <COLUMN_NAME> TO <NEW_COLUMN_NAME>

--To drop a table
DROP TABLE <TABLE_NAME>

--To delete all the data from the table but structure will be same
TRUNCATE TABLE <TABLE_NAME>

--To delete spectifc data from the table
DELETE FROM <TABLE_NAME> --Only this will delete all the data from the table so we have to write condition also
WHERE <CONDITION>

----------------------------------------------

---------To insert data into the table---------
--1.
INSERT INTO <TABLE_NAME> (<COLUMN_NAME>, <COLUMN_NAME>, ...)
VALUES (<VALUE>, <VALUE>, ...)

--2.
INSERT INTO <TABLE_NAME>
VALUES (<VALUE>, <VALUE>, ...)

--3.
INSERT INTO <TABLE_NAME>
VALUES 
(<VALUE>, <VALUE>, ...),
(<VALUE>, <VALUE>, ...),
(<VALUE>, <VALUE>, ...)

----------------------------------------------

--To update data in the table
UPDATE <TABLE_NAME>
SET <COLUMN_NAME> = <NEW_VALUE>, <COLUMN_NAME> = <NEW_VALUE>, ...
WHERE <CONDITION>

--To update all the data in the table
UPDATE <TABLE_NAME>
SET <COLUMN_NAME> = <NEW_VALUE>, <COLUMN_NAME> = <NEW_VALUE>, ...

----------------------------------------------

--To fetch data from the table
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME>
WHERE <CONDITION>

--To fetch all the data from the table
SELECT *
FROM <TABLE_NAME>

----------------------------------------------

-- Identity Function (Auto - Incremant)
CREATE TABLE <TABLE_NAME> (
    <COLUMN_NAME> <DATA_TYPE> IDENTITY(1,1), --1 is the seed value and 1 is the increment value
    <COLUMN_NAME> <DATA_TYPE>,
    ...
);
--While inserting data into the table with identity column we have to skip the identity column 

--If we want to insert value into the identity column then we have to set identity_insert on
SET IDENTITY_INSERT <TABLE_NAME> ON
--Now we can insert value into the identity column

--To set identity_insert off
SET IDENTITY_INSERT <TABLE_NAME> OFF
--Now we can't insert value into the identity column

-----------------------------------------------

-- To fetch data based on multiple conditions there are three types of operators in SQL

-- Arithmatic Operators in SQL (+, -, *, /, %)
-- + is used to add two numbers or concatenate two strings
-- - is used to subtract two numbers
-- * is used to multiply two numbers
-- / is used to divide two numbers
-- % is used to find the remainder of a division operation


-- Comparison Operators in SQL (=, <>, >, <, >=, <=)
-- = is used to compare two values for equality
-- <> is used to compare two values for inequality
-- > is used to compare if the left value is greater than the right value
-- < is used to compare if the left value is less than the right value
-- >= is used to compare if the left value is greater than or equal to the right value
-- <= is used to compare if the left value is less than or equal to the right value


-- Logical Operators in SQL (AND, OR, NOT)
-- AND is used to combine two conditions and returns true if both conditions are true
-- OR is used to combine two conditions and returns true if at least one condition is true
-- NOT is used to negate a condition and returns true if the condition is false

--There is also BETWEEN operator which is used to fetch data between a range of values
--IN operator is used to fetch data based on multiple values
--LIKE operator is used to fetch data based on a pattern

-- To fetch data based on multiple conditions we can use the above operators in the WHERE clause of the SELECT statement

----------------------------------

-- Set Operators (UNION, UNIONALL, INTERSECT, EXCEPT)
-- UNION is used to combine the result set of two or more SELECT statements and returns only distinct values
-- UNION ALL is used to combine the result set of two or more SELECT statements and returns all values including duplicates
-- INTERSECT is used to return the common records from two SELECT statements
-- EXCEPT is used to return the records from the first SELECT statement that are not present in the second SELECT statement

-- To use set operators the number of columns and their data types in the SELECT statements must be same
-- The order of the columns in the SELECT statements must be same
-- The column names in the result set will be taken from the first SELECT statement

---------------------------------

-- Aggregate Functions (COUNT (Used in Numeric as well as Non Numeric), SUM (Numeric), AVG(Numeric), MIN(Both), MAX(both))
-- COUNT is used to count the number of rows in a table or the number of non-null values in a column
-- SUM is used to calculate the total sum of a numeric column
-- AVG is used to calculate the average value of a numeric column
-- MIN is used to find the minimum value in a column
-- MAX is used to find the maximum value in a column
-- To use aggregate functions we can use them in the SELECT statement along with the GROUP BY clause to group the result set based on a column

----------------------------------

-- constraints (NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT)
-- NOT NULL is used to ensure that a column cannot have a null value
-- UNIQUE is used to ensure that all values in a column are unique
-- PRIMARY KEY is used to uniquely identify each record in a table and it cannot have null values
-- FOREIGN KEY is used to establish a relationship between two tables and it references the primary key of another table
-- CHECK is used to ensure that the values in a column satisfy a specific condition
-- DEFAULT is used to provide a default value for a column when no value is specified during insertion

-- To add constraints to a table we can use the ALTER TABLE statement along with the ADD CONSTRAINT clause
Alter TABLE <TABLE_NAME>
ADD CONSTRAINT <CONSTRAINT_NAME (given by user)> <CONSTRAINT_TYPE> FOR <COLUMN_NAME> -- For NOT NULL, UNIQUE, CHECK, DEFAULT


Alter TABLE <TABLE_NAME>
ADD CONSTRAINT <CONSTRAINT_NAME (given by user)> PRIMARY KEY (<COLUMN_NAME>) -- For PRIMARY KEY

Alter TABLE <TABLE_NAME>
ADD CONSTRAINT <CONSTRAINT_NAME (given by user)> FOREIGN KEY (<COLUMN_NAME>) REFERENCES <REFERENCED_TABLE_NAME> (<REFERENCED_COLUMN_NAME>) -- For FOREIGN KEY

-- To drop a constraint from a table we can use the ALTER TABLE statement along with the DROP CONSTRAINT clause
ALTER TABLE <TABLE_NAME>
DROP CONSTRAINT <CONSTRAINT_NAME>

------------------------------

------------Primary Key and Foreign Key--------------
-- Primary Key is a column or a set of columns that uniquely identifies each record in a table. It cannot have null values and must contain unique values. A table can have only one primary key.
-- Foreign Key is a column or a set of columns that establishes a relationship between two tables. It references the primary key of another table and can have null values. A table can have multiple foreign keys.

-- To create a primary key we can use the PRIMARY KEY constraint while creating a table or we can use the ALTER TABLE statement to add a primary key constraint to an existing table.
Alter TABLE <TABLE_NAME>
ADD CONSTRAINT <CONSTRAINT_NAME (given by user)> PRIMARY KEY (<COLUMN_NAME>)

-- To create a foreign key we can use the FOREIGN KEY constraint while creating a table or we can use the ALTER TABLE statement to add a foreign key constraint to an existing table.
Alter TABLE <TABLE_NAME>
ADD CONSTRAINT <CONSTRAINT_NAME (given by user)> FOREIGN KEY (<COLUMN_NAME>) REFERENCES <REFERENCED_TABLE_NAME> (<REFERENCED_COLUMN_NAME>)

-- To drop a primary key constraint from a table we can use the ALTER TABLE statement along with the DROP CONSTRAINT clause
ALTER TABLE <TABLE_NAME>
DROP CONSTRAINT <CONSTRAINT_NAME>

-- To drop a foreign key constraint from a table we can use the ALTER TABLE statement along with the DROP CONSTRAINT clause
ALTER TABLE <TABLE_NAME>
DROP CONSTRAINT <CONSTRAINT_NAME>

------------------------------


---------------Sub Queries--------------
-- A subquery is a query that is nested inside another query. It is used to fetch data based on the result of another query. A subquery can be used in the SELECT, FROM, WHERE, and HAVING clauses of a SQL statement.
-- To use a subquery in the SELECT clause
SELECT <COLUMN_NAME>, (SELECT <AGGREGATE_FUNCTION> FROM <TABLE_NAME> WHERE <CONDITION>) AS <ALIAS_NAME>

-- To use a subquery in the FROM clause
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM (SELECT <COLUMN_NAME>, <COLUMN_NAME>, ... FROM <TABLE_NAME> WHERE <CONDITION>) AS <ALIAS_NAME>

-- To use a subquery in the WHERE clause
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME>
WHERE <COLUMN_NAME> = (SELECT <COLUMN_NAME> FROM <TABLE_NAME> WHERE <CONDITION>)

-- To use a subquery in the HAVING clause
SELECT <COLUMN_NAME>, <AGGREGATE_FUNCTION>(<COLUMN_NAME>)
FROM <TABLE_NAME>
GROUP BY <COLUMN_NAME>
HAVING <AGGREGATE_FUNCTION>(<COLUMN_NAME>) > (SELECT <AGGREGATE_FUNCTION>(<COLUMN_NAME>) FROM <TABLE_NAME> WHERE <CONDITION>)

-- Correlated Subquery
-- A correlated subquery is a subquery that references a column from the outer query. It is executed for each row of the outer query and returns a result based on the value of the referenced column.
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME> AS T1
WHERE <COLUMN_NAME> = (SELECT <COLUMN_NAME> FROM <TABLE_NAME> AS T2 WHERE T2.<COLUMN_NAME> = T1.<COLUMN_NAME>)

-------------------------------


-----------Joins-------------
-- A join is used to combine rows from two or more tables based on a related column between them. There are different types of joins in SQL: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN.
-- INNER JOIN returns only the matching rows from both tables
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
INNER JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>

-- LEFT JOIN returns all the rows from the left table and the matching rows from the right table. If there is no match, NULL values are returned for columns from the right table.
-- First it will give matching values then left side 
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
LEFT JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>

--LEFT JOIN EXCLUDING MATCHING VALUES
-- It will give only left side values which are not matching with right side values
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
LEFT JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>
WHERE <TABLE_NAME2>.<COLUMN_NAME> IS NULL

-- RIGHT JOIN returns all the rows from the right table and the matching rows from the left table. If there is no match, NULL values are returned for columns from the left table.
-- First it will give matching values then right side
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
RIGHT JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>

--RIGHT JOIN EXCLUDING MATCHING VALUES
-- It will give only right side values which are not matching with left side values
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
RIGHT JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>
WHERE <TABLE_NAME1>.<COLUMN_NAME> IS NULL

-- FULL OUTER JOIN returns all the rows from both tables. If there is no match, NULL values are returned for columns from the table that does not have a match.
-- It will gives inner values then left side then right side values
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
FULL OUTER JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>

--FULL OUTER JOIN EXCLUDING MATCHING VALUES
-- It will give only left side and right side values which are not matching with each other
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
FULL OUTER JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>
WHERE <TABLE_NAME1>.<COLUMN_NAME> IS NULL OR <TABLE_NAME2>.<COLUMN_NAME> IS NULL

-- CROSS JOIN returns the Cartesian product of the two tables, which means it returns all possible combinations of rows from both tables.
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME1>
CROSS JOIN <TABLE_NAME2>
--It will give all possible combinations of rows from both tables. If TABLE_NAME1 has m rows and TABLE_NAME2 has n rows, the result will have m*n rows.
-- another method 
SELECT * FROM <TABLE_NAME1>, <TABLE_NAME2>

--Self Join is a join that is used to join a table with itself. It is used to fetch data based on the relationship between the rows of the same table.
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME> AS T1
JOIN <TABLE_NAME> AS T2
ON T1.<COLUMN_NAME> = T2.<COLUMN_NAME>
WHERE <CONDITION>

----------------------


-- Views : We create views to save our frequently used queries and to provide security to the data by restricting access to the underlying tables. It is a virtual table that is based on the result set of a SELECT statement. It does not store data physically but provides a way to access data from one or more tables.
--ADVANTAGE OF VIEW : simplicity, security, data abstraction, reusability, maintenance, performance (in some cases)


-- To create a view
CREATE VIEW <VIEW_NAME> AS
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME>
WHERE <CONDITION>

-- To Alter a view
ALTER VIEW <VIEW_NAME> AS
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME>

-- To fetch data from a view
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <VIEW_NAME>
WHERE <CONDITION>

-- To update data in a view
-- If we update in view table that can update in a base table also. vice versa
UPDATE <VIEW_NAME>
SET <COLUMN_NAME> = <NEW_VALUE>, <COLUMN_NAME> = <NEW_VALUE>, ...
WHERE <CONDITION>

-- To delete data from a view
DELETE FROM <VIEW_NAME>
WHERE <CONDITION>

-- To drop a view
DROP VIEW <VIEW_NAME>

sp_helptext <VIEW_NAME> -- To display the definition of the view / query
-- But if we use with encryption option while creating the view then we can't see the definition of the view
sp_help <VIEW_NAME> -- To display the structure of the view

-- To create a view with encryption option
CREATE VIEW <VIEW_NAME> WITH ENCRYPTION AS
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME>
WHERE <CONDITION>

-- To create a view with join
CREATE VIEW <VIEW_NAME> AS
SELECT <TABLE_NAME1>.<COLUMN_NAME>, <TABLE_NAME2>.<COLUMN_NAME>, ...
FROM <TABLE_NAME1>
JOIN <TABLE_NAME2>
ON <TABLE_NAME1>.<COLUMN_NAME> = <TABLE_NAME2>.<COLUMN_NAME>
WHERE <CONDITION>

-- To create a view with schema binding option
-- Schema binding is used to bind the view to the underlying tables. It ensures that the structure of the underlying tables cannot be changed without first dropping the view. This can help improve performance and maintain data integrity.
-- When we create view with schemabinding then we cant able to update and delete the record from base table and also we cant able to alter the table structure of base table like adding new col, deleting col, altering data type of col etc. because of schemabinding. It will provide more security to the data by restricting access to the underlying tables.

CREATE VIEW <VIEW_NAME> WITH SCHEMABINDING AS
SELECT <COLUMN_NAME>, <COLUMN_NAME>, ...
FROM <TABLE_NAME>
WHERE <CONDITION>

---------------------------------------

--Indexes : An index is a database object that is used to improve the performance of data retrieval operations on a table. It is created on one or more columns of a table and provides a quick way to access data based on the values in those columns. 
--There are different types of indexes in SQL: clustered index, non-clustered index, unique index, composite index.

-- To create an index
CREATE INDEX <INDEX_NAME> ON <TABLE_NAME> (<COLUMN_NAME>, <COLUMN_NAME>, ...)

-- To drop an index
DROP INDEX <INDEX_NAME> ON <TABLE_NAME>

-- To display list of all the indexes in a table
--1.
SHOW INDEXES FROM <TABLE_NAME>
--2.
SELECT name FROM sys.indexes WHERE object_id = OBJECT_ID('<TABLE_NAME>')

-- To create a clustered index
CREATE CLUSTERED INDEX <INDEX_NAME> ON <TABLE_NAME> (<COLUMN_NAME>)

-- To create a non-clustered index
CREATE NONCLUSTERED INDEX <INDEX_NAME> ON <TABLE_NAME> (<COLUMN_NAME>)

-- To create a unique index
CREATE UNIQUE INDEX <INDEX_NAME> ON <TABLE_NAME> (<COLUMN_NAME>)

-- To create a composite index
CREATE INDEX <INDEX_NAME> ON <TABLE_NAME> (<COLUMN_NAME>, <COLUMN_NAME>, ...)

-------------------------------------

--Functions 

--CAST (expression AS data_type) : It is used to convert an expression from one data type to another data type. It is a standard SQL function and is supported by most of the database management systems.
SELECT CAST(<EXPRESSION> AS <DATA_TYPE>) AS <ALIAS_NAME>

--Coalesce (expression1, expression2, ... expressionN) : It is used to return the first non-null expression among the given expressions. It is a standard SQL function and is supported by most of the database management systems.
SELECT COALESCE(<EXPRESSION1>, <EXPRESSION2>, ... <EXPRESSIONN>) AS <ALIAS_NAME>

--Datediff (Interval, startdate, enddate) : It is used to return the difference between two dates in terms of the specified date part. It is a standard SQL function and is supported by most of the database management systems.
SELECT DATEDIFF(<INTERVAL>, <STARTDATE>, <ENDDATE>) AS <ALIAS_NAME>

--replace (string_expression, string_to_replace , string_replacement) : It is used to replace all occurrences of a specified string pattern with a replacement string in a given string expression. It is a standard SQL function and is supported by most of the database management systems.
SELECT REPLACE(<STRING_EXPRESSION>, <STRING_TO_REPLACE>, <STRING_REPLACEMENT>) AS <ALIAS_NAME>

--trim (string_expression) : It is used to remove leading and trailing spaces from a given string expression. It is a standard SQL function and is supported by most of the database management systems.
SELECT TRIM(<STRING_EXPRESSION>) AS <ALIAS_NAME>
Select LTRIM(RTRIM(<STRING_EXPRESSION>)) AS <ALIAS_NAME> -- Another method to remove leading and trailing spaces from a given string expression

--Length (string_expression) : It is used to return the number of characters in a given string expression. It is a standard SQL function and is supported by most of the database management systems.
SELECT LENGTH(<STRING_EXPRESSION>) AS <ALIAS_NAME>

--Upper and Lower (string_expression) : It is used to convert a given string expression to uppercase or lowercase. It is a standard SQL function and is supported by most of the database management systems.
SELECT UPPER(<STRING_EXPRESSION>) AS <ALIAS_NAME>
SELECT LOWER(<STRING_EXPRESSION>) AS <ALIAS_NAME>

--Concatenate (string1, string2, ... stringN) : It is used to concatenate two or more string expressions into a single string expression. It is a standard SQL function and is supported by most of the database management systems.
SELECT CONCAT(<STRING1>, <STRING2>, ... <STRINGN>) AS <ALIAS_NAME>

