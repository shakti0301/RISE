CREATE DATABASE Train_Reserve_System;
USE Train_Reserve_System;

CREATE TABLE Trains  (
    TrainID INT PRIMARY KEY,
    TrainName VARCHAR(50) NOT NULL,
    Source VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalTime TIME NOT NULL,
    Distnce_KM INT NOT NULL CHECK(Distnce_KM > 0)
);


CREATE TABLE Passengers(
    passangerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL CHECK(Age>0),
    Gender VARCHAR(10) CHECK (Gender = 'M' OR Gender = 'F'),
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Reservations(
    ReservationID INT PRIMARY KEY,
    PassangerID INT,
    TrainID INT,
    TravelDate DATE NOT NULL,
    Class VARCHAR(20) NOT NULL CHECK (Class IN ('Sleeper', 'AC1', 'AC2', 'AC3')),
    Fare Money NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Confirmed', 'Waiting', 'Cancelled')),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (PassangerID) REFERENCES Passengers(passangerID)
);


INSERT INTO Trains VALUES
(101, 'Shatabdi Exp', 'Delhi', 'Bhopal', '06:00', '14:00', 700),
(102, 'Rajdhani Exp', 'Delhi', 'Mumbai', '16:00', '08:00', 1400),
(103, 'Duronto Exp', 'Mumbai', 'Chennai', '20:00', '10:00', 1300),
(104, 'Garib Rath', 'Kolkata', 'Delhi', '12:00', '06:00', 1500),
(105, 'Chennai Exp', 'Chennai', 'Delhi', '08:00', '22:00', 2200),
(106, 'Howrah Exp', 'Howrah', 'Mumbai', '10:00', '20:00', 1960),
(107, 'Nizamuddin Exp', 'Delhi', 'Hyderabad', '15:00', '05:00', 1675),
(108, 'Goa Exp', 'Mumbai', 'Goa', '07:00', '15:00', 589),
(109, 'Kashi Exp', 'Varanasi', 'Delhi', '05:30', '13:30', 820),
(110, 'Jammu Tawi Exp', 'Delhi', 'Jammu', '18:00', '07:00', 670),
(111, 'Karnataka Exp', 'Bangalore', 'Delhi', '21:00', '14:00', 2360),
(112, 'Kerala Exp', 'Trivandrum', 'Delhi', '11:00', '22:00', 3045),
(113, 'Punjab Mail', 'Mumbai', 'Firozpur', '19:00', '09:00', 1925),
(114, 'Tamil Nadu Exp', 'Chennai', 'Delhi', '06:30', '20:30', 2180),
(115, 'Andhra Exp', 'Hyderabad', 'Delhi', '06:00', '19:00', 1700),
(116, 'Odisha Sampark', 'Bhubaneswar', 'Delhi', '14:00', '08:00', 1725),
(117, 'Maharashtra Exp', 'Mumbai', 'Nagpur', '09:00', '18:00', 840),
(118, 'Saurashtra Exp', 'Rajkot', 'Mumbai', '06:00', '14:00', 730),
(119, 'Utkal Exp', 'Puri', 'Delhi', '20:00', '12:00', 1850),
(120, 'Konark Exp', 'Mumbai', 'Bhubaneswar', '22:00', '14:00', 1950),
(121, 'Kaveri Exp', 'Mysore', 'Chennai', '23:00', '07:00', 500),
(122, 'Malwa Exp', 'Indore', 'Delhi', '21:00', '08:00', 850),
(123, 'Netravati Exp', 'Mumbai', 'Mangalore', '11:00', '20:00', 720),
(124, 'Ganga Kaveri Exp', 'Chennai', 'Patna', '16:00', '08:00', 2000),
(125, 'Deccan Exp', 'Pune', 'Mumbai', '07:00', '12:00', 192),
(126, 'Shatabdi Kolkata', 'Kolkata', 'Patna', '05:00', '11:00', 535),
(127, 'Sealdah Exp', 'Sealdah', 'Delhi', '15:00', '09:00', 1460),
(128, 'Sundar Exp', 'Bangalore', 'Hyderabad', '18:00', '06:00', 650),
(129, 'Ajmer Exp', 'Ajmer', 'Delhi', '12:00', '21:00', 500);

INSERT INTO Passengers VALUES
(1, 'Ramesh', 45, 'M', 'Delhi'),
(2, 'Sita', 32, 'F', 'Mumbai'),
(3, 'Arjun', 28, 'M', 'Bhopal'),
(4, 'Priya', 19, 'F', 'Chennai'),
(5, 'Anil', 52, 'M', 'Kolkata'),
(6, 'Neha', 27, 'F', 'Delhi'),
(7, 'Vikram', 34, 'M', 'Mumbai'),
(8, 'Sunita', 40, 'F', 'Kolkata'),
(9, 'Rajesh', 50, 'M', 'Chennai'),
(10, 'Meena', 22, 'F', 'Bangalore'),
(11, 'Arvind', 29, 'M', 'Hyderabad'),
(12, 'Kiran', 31, 'M', 'Pune'),
(13, 'Lakshmi', 36, 'F', 'Delhi'),
(14, 'Deepak', 48, 'M', 'Patna'),
(15, 'Swati', 25, 'F', 'Jaipur'),
(16, 'Harish', 55, 'M', 'Varanasi'),
(17, 'Rohit', 19, 'M', 'Lucknow'),
(18, 'Sneha', 23, 'F', 'Ahmedabad'),
(19, 'Manoj', 60, 'M', 'Nagpur'),
(20, 'Kavita', 33, 'F', 'Bhopal'),
(21, 'Ajay', 42, 'M', 'Indore'),
(22, 'Ritu', 28, 'F', 'Mysore'),
(23, 'Pankaj', 37, 'M', 'Goa'),
(24, 'Divya', 30, 'F', 'Surat'),
(25, 'Suresh', 44, 'M', 'Ranchi'),
(26, 'Pooja', 26, 'F', 'Bhubaneswar'),
(27, 'Nitin', 32, 'M', 'Kanpur'),
(28, 'Shalini', 39, 'F', 'Chandigarh'),
(29, 'Gaurav', 21, 'M', 'Shimla'),
(30, 'Anita', 47, 'F', 'Trivandrum');



INSERT INTO Reservations VALUES
(201, 1, 101, '2025-09-01', 'Sleeper', 500, 'Confirmed'),
(202, 2, 102, '2025-09-05', 'AC2', 1800, 'Confirmed'),
(203, 3, 101, '2025-09-01', 'Sleeper', 500, 'Waiting'),
(204, 4, 103, '2025-09-07', 'AC3', 1200, 'Confirmed'),
(205, 5, 104, '2025-09-10', 'Sleeper', 600, 'Cancelled'),
(206, 6, 105, '2025-09-12', 'AC1', 3500, 'Confirmed'),
(207, 7, 106, '2025-09-13', 'AC2', 2200, 'Waiting'),
(208, 8, 107, '2025-09-14', 'Sleeper', 950, 'Confirmed'),
(209, 9, 108, '2025-09-15', 'AC3', 1200, 'Cancelled'),
(210, 10, 109, '2025-09-16', 'AC2', 1400, 'Confirmed'),
(211, 11, 110, '2025-09-17', 'Sleeper', 600, 'Confirmed'),
(212, 12, 111, '2025-09-18', 'AC1', 3800, 'Confirmed'),
(213, 13, 112, '2025-09-19', 'AC3', 2800, 'Waiting'),
(214, 14, 113, '2025-09-20', 'AC2', 2100, 'Confirmed'),
(215, 15, 114, '2025-09-21', 'Sleeper', 950, 'Confirmed'),
(216, 16, 115, '2025-09-22', 'AC2', 1650, 'Cancelled'),
(217, 17, 116, '2025-09-23', 'Sleeper', 800, 'Confirmed'),
(218, 18, 117, '2025-09-24', 'AC3', 1200, 'Confirmed'),
(219, 19, 118, '2025-09-25', 'AC1', 2500, 'Confirmed'),
(220, 20, 119, '2025-09-26', 'Sleeper', 1100, 'Waiting'),
(221, 21, 120, '2025-09-27', 'AC2', 1900, 'Confirmed'),
(222, 22, 121, '2025-09-28', 'AC3', 750, 'Confirmed'),
(223, 23, 122, '2025-09-29', 'Sleeper', 670, 'Cancelled'),
(224, 24, 123, '2025-09-30', 'AC2', 1100, 'Confirmed'),
(225, 25, 124, '2025-10-01', 'AC1', 3100, 'Confirmed'),
(226, 26, 125, '2025-10-02', 'Sleeper', 250, 'Waiting'),
(227, 27, 126, '2025-10-03', 'AC3', 900, 'Confirmed'),
(228, 28, 127, '2025-10-04', 'AC2', 1750, 'Confirmed'),
(229, 29, 128, '2025-10-05', 'Sleeper', 500, 'Confirmed'),
(230, 30, 129, '2025-10-06', 'AC2', 800, 'Cancelled');


--1 List all trains running from Delhi as source station.
SELECT * FROM Trains 
WHERE Source = 'Delhi';

--2 Find all passengers who are above 40 years of age.
SELECT * FROM Passengers
WHERE Age > 40;

--3 Get the total number of reservations made.
SELECT COUNT(*) AS TotalReservations 
FROM Reservations;

--4 Count how many reservations are in 'Confirmed' status.
SELECT COUNT(status) AS TotalComfirmed 
FROM Reservations 
WHERE status = 'Confirmed';

--5 Show the average fare paid for each train.
SELECT TrainID, AVG(Fare) AS AverageFare
FROM Reservations
GROUP BY TrainID;

--6 List reservations ordered by fare in descending order.
SELECT * 
FROM Reservations
ORDER BY Fare DESC;

--7 Find passengers who booked AC classes (AC2, AC3).
SELECT Name AS 'Passengers who booked AC classes (AC2, AC3)' 
FROM Passengers
WHERE passangerID IN (
    SELECT PassangerID 
    FROM Reservations 
    WHERE Class IN ('AC2', 'AC3')
);


--8 Find the average age of passengers who booked 'Confirmed' tickets.
SELECT TrainID, SUM(Fare) AS TotalRevenue 
FROM Reservations
WHERE status = 'Confirmed'
GROUP BY TrainID;

--9 Display travel_date and number of reservations made on that date.
SELECT  TravelDate, COUNT(*) AS TotalReservationsPerTrain
FROM Reservations
GROUP BY TravelDate;

--10 Show all reservations where fare is greater than 1000.
SELECT * 
FROM Reservations 
WHERE Fare > 1000

--11 List all passengers who live in Delhi or Mumbai.
SELECT Name AS 'Passengers from Delhi and Mumbai'
FROM Passengers
WHERE City = 'Delhi'
OR City = 'Mumbai'

--12 Show all trains whose distance is more than 1200 km.
SELECT *
FROM Trains
WHERE Distnce_KM > 1000

--13 Find reservations which are not "Cancelled".
SELECT *
FROM Reservations
WHERE status <> 'Cancelled'

--14 Show the details of trains that have "Exp" in their name.
SELECT *
FROM Trains
WHERE TrainName LIKE '%Exp%'

--15 List all passengers ordered by their age in descending order.
SELECT *
FROM Passengers
ORDER BY Age DESC

--16 Display reservations sorted by travel_date (earliest first).
SELECT *
FROM Reservations
ORDER BY TravelDate ASC

--17 Find all trains ordered by distance (longest route first).
SELECT *
FROM Trains
ORDER BY Distnce_KM DESC

--18 Show passengers ordered by name alphabetically.
SELECT *
FROM Passengers
ORDER BY Name ASC

--19 List reservations ordered by class and then by fare.
SELECT *
FROM Reservations
ORDER BY Class ASC, Fare DESC

--20 Count how many passengers are from each city.
SELECT city, COUNT(*) AS TotalPassengers
FROM Passengers
GROUP BY city

--21 Find the total fare collected from all Confirmed reservations.
SELECT SUM(Fare) AS 'Total Fare from Confirmed Reservations'
FROM Reservations
WHERE status = 'Confirmed'

--22 Show the minimum, maximum, and average age of passengers.
SELECT MIN(Age) AS 'Minimum age of passengers', 
MAX(Age) AS 'Maximum age of passengers', 
AVG(Age) AS 'Average age of passengers'
FROM Passengers

--23 Get the average fare per travel_date.
SELECT TravelDate, AVG(Fare) AS 'Average Fare per Travel Date'
FROM Reservations
GROUP BY TravelDate

--24 Show each class and the total number of reservations in it.
SELECT class, COUNT(*) AS 'Total Reservations per Class'
FROM Reservations
GROUP BY class

--25 Find trains that have more than 1 reservation.
SELECT TrainID, COUNT(*) AS 'Total Reservations'
FROM Reservations
GROUP BY TrainID
HAVING COUNT(*) > 1

--26 List cities where more than 1 passenger lives.
SELECT City, COUNT(*) AS 'Total Passengers'
FROM Passengers
GROUP BY City
HAVING COUNT(*) > 1

--27 Show gender-wise average age of passengers.
SELECT Gender, AVG(Age)
FROM Passengers
GROUP BY Gender

--28 Find passengers who booked more than 1 ticket.
SELECT p.Name, COUNT(r.ReservationID) AS 'Total Tickets Booked'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
GROUP BY p.Name
HAVING COUNT(r.ReservationID) > 1

--29 Show passenger name, train name, and fare for each reservation.
SELECT p.Name, t.TrainName, r.Fare
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
JOIN Trains t
    ON r.TrainID = t.TrainID

--30 List all passengers and the train name they booked (if any).
SELECT p.Name, t.TrainName
FROM Passengers p
LEFT JOIN Reservations r
    ON p.PassangerID = r.PassangerID
LEFT JOIN Trains t
    ON r.TrainID = t.TrainID

--31 Show all trains and the number of passengers booked in each.
SELECT t.TrainName, COUNT(r.ReservationID) AS 'Total Passengers Booked'
FROM Trains t
LEFT JOIN Reservations r
    ON t.TrainID = r.TrainID
GROUP BY t.TrainName

--32 Find all passengers who booked Rajdhani Exp.
SELECT p.Name AS 'Passengers who booked Rajdhani Exp'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
JOIN Trains t
    ON r.TrainID = t.TrainID
WHERE t.TrainName = 'Rajdhani Exp'

--33 List passenger names with their travel_date and status.
SELECT p.Name, r.TravelDate, r.Status
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID;

--34 Find the top 2 highest fare reservations.
SELECT Top 2 *
FROM Reservations
ORDER BY Fare DESC

--35 Find the train with the lowest average fare.
SELECT TOP 1 TrainID, AVG(Fare) AS 'Average Fare'
FROM Reservations
GROUP BY TrainID
ORDER BY AVG(Fare) ASC

--36 Show the train(s) where total distance travelled by all passengers > 1000 km.
SELECT t.TrainName, SUM(r.Fare) AS 'Total Fare Collected'
FROM Trains t
JOIN Reservations r
    ON t.TrainID = r.TrainID
GROUP BY t.TrainName
HAVING SUM(r.Fare) > 1000

--37 Find passengers whose reservation status is "Waiting".
SELECT p.Name AS 'Passengers with Waiting Status'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
WHERE Status = 'Waiting'

--38 Show the passenger(s) who paid the maximum fare overall.
SELECT Top 1 p.Name AS 'Passenger with Highest Fare'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
ORDER BY Fare DESC

--39 Show all passengers whose age is between 20 and 40.
SELECT *
FROM Passengers
WHERE Age BETWEEN 20 AND 40

--40 Find trains that start from Kolkata or Chennai.
SELECT *
FROM Trains
WHERE Source = 'Kolkata' OR Source = 'Chennai'

--41 Show all reservations made after 2025-09-05.
SELECT *
FROM Reservations
WHERE TravelDate > '2025-09-05'

--42 Display passengers whose name starts with 'A'.
SELECT *
FROM Passengers
WheRE Name LIKE 'A%'

--43 List passengers whose city is NOT Delhi.
SELECT Name AS 'Passengers who do not live in Delhi'
FROM Passengers
WHERE City <> 'Delhi'

--44 Show the 3 youngest passengers.
SELECT Top 3 *
FROM Passengers
ORDER BY Age ASC

--45 Show the 2 longest-distance trains.
SELECT Top 2 *
FROM Trains
ORDER BY Distnce_KM DESC

--46 Display the 5 most expensive reservations (highest fare).
SELECT Top 5 *
FROM Reservations
ORDER BY Fare DESC

--47 List trains in alphabetical order of train_name.
SELECT *
FROM Trains
ORDER BY TrainName ASC

--48 Show passengers sorted by age (youngest first).
SELECT *
FROM Passengers
ORDER BY Age ASC


--49 Find the average fare of all reservations.
SELECT AVG(Fare) AS 'Average Fare of All Reservations'
FROM Reservations

--50 Count the total number of male passengers.
SELECT COUNT(Gender) AS 'Total Male Passengers'
FROM passengers
WHERE Gender = 'M'

--51 Show the maximum distance among all trains.
SELECT MAX(Distnce_KM) AS 'Longest Distance'
FROM Trains

--52 Find the total number of Sleeper class reservations.
SELECT COUNT(*) AS 'Total Sleeper Reservations'
FROM Reservations
WHERE Class = 'Sleeper' 

--53 Find the total fare paid by passengers from Mumbai.
SELECT SUM(Fare) AS 'Total Fare Paid by Passengers from Mumbai'
FROM Reservations r
JOIN Passengers p
    ON r.PassangerID = p.PassangerID
WHERE p.City = 'Mumbai'

--54 Count the number of reservations per status (Confirmed/Waiting/Cancelled).
SELECT Status, COUNT(*) AS 'Total Reservations per Status'
FROM Reservations
GROUP BY Status

--55 Find the total number of passengers per gender.
SELECT Gender, COUNT(*) AS 'Total number of passengers'
FROM Passengers
GROUP BY Gender

--56 Show the average fare for each class.
SELECT Class, AVG(Fare) AS 'Average Fare per Class'
FROM Reservations
GROUP BY Class

--57 Display the number of trains starting from each source city.
SELECT Source, COUNT(*) AS 'Total Trains from Source City'
FROM Trains
GROUP BY Source

--58 Show total reservations grouped by travel_date.
SELECT TravelDate, COUNT(*) AS 'Total Reservations per Travel Date'
FROM Reservations
GROUP BY TravelDate

--59 Show passenger name, city, and train_name they booked.
SELECT p.Name, p.City, t.TrainName
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
JOIN Trains t
    ON r.TrainID = t.TrainID

--60 List all reservations with passenger name and status.
SELECT p.Name, r.Status
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID

--61 Show train_name and number of confirmed passengers on it.
SELECT t.TrainName, COUNT(*) AS 'Total Confirmed Passengers'
FROM Trains t
JOIN Reservations r
    ON t.TrainID = r.TrainID
WHERE r.Status = 'Confirmed'
GROUP BY t.TrainName

--62 Display all passengers with train_name (if booked, else show NULL).
SELECT p.Name, t.TrainName
FROM Passengers p
LEFT JOIN Reservations r
    ON p.PassangerID = r.PassangerID
LEFT JOIN Trains t
    ON r.TrainID = t.TrainID

--63 Find which passengers booked Garib Rath train.
SELECT p.Name AS 'Passengers who booked Garib Rath'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
JOIN Trains t
    ON r.TrainID = t.TrainID
WHERE t.TrainName = 'Garib Rath'

--64 Show train_id and total fare collected, but only where fare > 1000.
SELECT TrainID, SUM(Fare) AS 'Total Fare Collected'
FROM Reservations
GROUP BY TrainID
HAVING SUM(Fare) > 1000

--65 List source cities that have more than 1 train.
SELECT Source, COUNT(*) AS 'Total Trains'
FROM Trains
GROUP BY Source
HAVING COUNT(*) > 1

--66 Find passengers grouped by city where count > 1.
SELECT City, COUNT(*) AS 'Total Passengers'
FROM Passengers
GROUP BY City
HAVING COUNT(*) > 1

--67 Show classes that earned more than 2000 fare in total.
SELECT Class, SUM(Fare) AS 'Total Fare Collected'
FROM Reservations
GROUP BY Class
HAVING SUM(Fare) > 2000

--68 List trains that have at least 2 passengers booked.
SELECT t.TrainName, COUNT(*) AS 'Total Passengers Booked'
FROM Trains t
JOIN Reservations r
    ON t.TrainID = r.TrainID
GROUP BY t.TrainName
HAVING COUNT(*) >= 2

--69 Find the passenger(s) with the highest age.
SELECT Name AS 'Oldest Passenger', Age
FROM Passengers
WHERE Age = (SELECT MAX(Age) FROM Passengers)

--70 Show the train(s) with the shortest distance.
SELECT TrainName, Distnce_KM
FROM Trains
WHERE Distnce_KM = (SELECT MIN(Distnce_KM) FROM Trains)

--71 Find the reservation(s) with the lowest fare.
SELECT *
FROM Reservations
WHERE Fare = (SELECT MIN(Fare) FROM Reservations)

--72 List passengers who paid above the average fare.
SELECT Name AS 'Passengers who paid above average fare', Fare
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
WHERE r.Fare > (SELECT AVG(Fare) FROM Reservations)

--73 Find trains whose distance is above the average train distance.
SELECT TrainName, Distnce_KM
FROM Trains
WHERE Distnce_KM > (SELECT AVG(Distnce_KM) FROM Trains)

--74 Show all reservations in September 2025.
SELECT *
FROM Reservations
WHERE MONTH(TravelDate) = 9 AND YEAR(TravelDate) = 2025

--75 Find the earliest travel_date booked.
SELECT MIN(TravelDate) AS 'Earliest Travel Date'
FROM Reservations

--76 Find the latest travel_date booked.
SELECT MAX(TravelDate) AS 'Latest Travel Date'
FROM Reservations

--77 Count how many reservations are made per day.
SELECT TravelDate, COUNT(*) AS 'Total Reservations per Day'
FROM Reservations
GROUP BY TravelDate

--78 List passengers who booked tickets on the same date.
SELECT p.Name AS 'Passengers who booked on the same date', r.TravelDate
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
WHERE r.TravelDate IN (
    SELECT TravelDate
    FROM Reservations
    GROUP BY TravelDate
    HAVING COUNT(*) > 1
)

--79 Show passenger name, train_name, and distance travelled.
SELECT p.Name, t.TrainName, t.Distnce_KM
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
JOIN Trains t
    ON r.TrainID = t.TrainID

--80 Find the city that contributed the highest number of passengers.
SELECT City, COUNT(*) AS 'Total Passengers'
FROM Passengers
GROUP BY City
ORDER BY COUNT(*) DESC

--81 Display each train and its average fare (confirmed only).
SELECT t.TrainName, AVG(r.Fare) AS 'Average Fare (Confirmed Only)'
FROM Trains t
JOIN Reservations r
    ON t.TrainID = r.TrainID
WHERE r.Status = 'Confirmed'
GROUP BY t.TrainName

--82 Show passengers who booked tickets in more than one class.
SELECT p.Name AS 'Passengers who booked in more than one class'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
GROUP BY p.Name
HAVING COUNT(DISTINCT r.Class) > 1

--83 Find train_name with maximum number of reservations.
SELECT TOP 1 t.TrainName, COUNT(*) AS 'Total Reservations'
FROM Trains t
JOIN Reservations r
    ON t.TrainID = r.TrainID
GROUP BY t.TrainName
ORDER BY COUNT(*) DESC

--84 Get total revenue collected per train (only Confirmed reservations).
SELECT TrainID, SUM(Fare) AS TotalRevenue
FROM Reservations
WHERE status = 'Confirmed'
GROUP BY TrainID;

--85 Find the train with the maximum distance_km.
SELECT TOP 1 TrainName, Distnce_KM
FROM Trains
ORDER BY Distnce_KM DESC

--86 Show the passenger(s) with the minimum age.
SELECT Name AS 'Youngest Passenger', Age
FROM Passengers
WHERE Age = (SELECT MIN(Age) FROM Passengers)

--87 Get the passenger names who have booked tickets in Sleeper class.
SELECT Name AS 'Passengers who booked Sleeper class'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
WHERE r.Class = 'Sleeper'

--88 Find total number of reservations made from each city (JOIN with Passengers).
SELECT p.City, COUNT(*) AS 'Total Reservations from City'
FROM Passengers p
JOIN Reservations r
    ON p.PassangerID = r.PassangerID
GROUP BY p.City

--89 Show train name and total passengers booked for it, ordered by passenger count descending.
SELECT t.TrainName, COUNT(*) AS 'Total Passengers Booked'
FROM Trains t
JOIN Reservations r
    ON t.TrainID = r.TrainID
GROUP BY t.TrainName
ORDER BY COUNT(*) DESC

--90 Get total revenue collected per train (only Confirmed reservations).
SELECT TrainID, SUM(Fare) AS TotalRevenue
FROM Reservations
WHERE status = 'Confirmed'
GROUP BY TrainID;
