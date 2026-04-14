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