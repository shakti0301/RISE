CREATE DATABASE Shaktisinh_INT1101

USE Shaktisinh_INT1101

CREATE TABLE Specializations (
    SpecializationID INT PRIMARY KEY,
    SpecializationName VARCHAR(255) NOT NULL
)

CREATE TABLE Students(
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Age INT,
    SpecializationID INT FOREIGN KEY REFERENCES Specializations(SpecializationID)
)

CREATE TABLE Courses(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Credits INT 
)

CREATE TABLE Enrollments (
    EnrollmentID INT NOT NULL UNIQUE,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Grade CHAR(1) NOT NULL
)

INSERT INTO Specializations VALUES
(1, 'Cloud'),
(2, 'QA'),
(3, 'Data Eng'),
(4, 'Full Stack'),
(5, 'AI')

INSERT INTO Students VALUES
(101, 'Shakti', 'Raolji', 22, 4),
(102, 'Shyam', 'Patel', 23, 5),
(103, 'Shiv', 'Patel', 22, 2),
(104, 'Rudra', 'Sharma', 23, 1),
(105, 'Krish', 'Patel', 21, 3)

INSERT INTO Courses VALUES
(1, 'RISE', 5),
(2, 'Eng', 9),
(3, 'D2D', 2),
(4, 'CU', 3),
(5, 'Diploma', 2)

INSERT INTO Enrollments VALUES
(110, 101, 1, 'A'),
(111, 102, 2, 'B'),
(112, 103, 5, 'C'),
(113, 104, 3, 'A'),
(114, 105, 2, 'A')

--1. Retrieve a list of Students and their Specialization names. 
SELECT s.FirstName, s.LastName, sp.SpecializationName
FROM Students s
JOIN Specializations sp
ON s.SpecializationID = sp.SpecializationID

--2. List all Course names that 'Suresh Patel' is enrolled in. 
SELECT c.CourseName AS 'Course names that Suresh Patel is enrolled'
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON c.CourseID = e.CourseID
WHERE s.FirstName = 'Suresh' AND s.LastName = 'Patel'

--3. Display Student names along with the Grade they received in 'Full Stack'
SELECT s.FirstName, s.LastName, e.Grade
FROM Students s
JOIN Enrollments e
ON s.StudentID = e. StudentID
JOIN Courses c
ON c.CourseID = e.CourseID
WHERE CourseName = 'Full Stack'

--4. Show all Specializations that currently have no students assigned.
SELECT sp.SpecializationName AS 'Specializations that currently have no students assigned'
FROM Specializations sp
LEFT JOIN Students s
ON sp.SpecializationID = s.SpecializationID
WHERE s.StudentID IS NULL

--5. List every Enrollment ID with the corresponding Student's Full Name and the Course  Credits.
SELECT e.EnrollmentID, (s.FirstName + ' ' + s.LastName) AS 'Full Name', c.Credits
FROM Students s
JOIN Enrollments e
ON e.StudentID = s.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID

--6. Count how many students are in each specialization, but only show specializations  with more than 5 students. 
SELECT sp.SpecializationName, COUNT(s.SpecializationID) AS 'Number of Students'
FROM Specializations sp
JOIN Students s
ON sp.SpecializationID = s.SpecializationID
GROUP BY sp.SpecializationName
HAVING COUNT(s.SpecializationID) > 5

--7. Find students who are enrolled in 3 or more courses. 
SELECT s.FirstName AS 'Students who are enrolled in 3 or more courses', Count(c.CourseID)
FROM Students s
JOIN Enrollments e
ON e.StudentID = s.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
GROUP BY (s.FirstName)
HAVING Count(c.CourseID) > 3

--8. Calculate the total number of credits assigned to Student ID 1. 
SELECT SUM(c.Credits) AS 'Total number of credits assigned to Student ID 1'
FROM Courses c
JOIN Enrollments e
ON e.CourseID = c.CourseID
JOIN Students s
ON s.StudentID = e.StudentID
WHERE s.StudentID = 1

--9. Select all students whose age is between 18 and 22 (inclusive). 
SELECT (s.FirstName + ' ' + s.LastName) AS 'Students whose age is between 18 and 22'
FROM Students s
WHERE s.Age  between 18 AND 22

--10. Find the names of students who have enrolled in the course named 'Data 
SELECT (s.FirstName + ' ' + s.LastName) AS 'Students who enrolled in the course named Data'
FROM Students s
JOIN Enrollments e
ON s.StudentID = e. StudentID
JOIN Courses c
ON c.CourseID = e.CourseID
WHERE CourseName = 'Data'