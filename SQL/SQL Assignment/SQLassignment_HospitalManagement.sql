CREATE DATABASE Hospital_DB
USE Hospital_DB

CREATE TABLE Patients (PatientID INT, Aadhaar BIGINT, Gender VARCHAR(20), DOB DATE)
CREATE TABLE Doctors (DoctorID INT, Email VARCHAR(50), DepartmentID INT, Experience INT)
CREATE TABLE Departments (DepartmentID INT, DepartmentName VARCHAR(30))
CREATE TABLE Rooms (RoomID INT, RoomType VARCHAR(30), ChargesPerDay MONEY)
CREATE TABLE Appointments (AppointmentID INT, PatientID INT, DoctorID INT, AppointmentDate DATE)
CREATE TABLE Admissions (AdmissionID INT, PatientID INT, RoomID INT, AdmitDate DATE, DischargeDate DATE)
CREATE TABLE Treatments (TreatmentID INT, AdmissionID INT, TreatmentCost MONEY)
CREATE TABLE Bills (BillID INT, AdmissionID INT, TotalAmount MONEY)
CREATE TABLE Payments (PaymentID INT, BillID INT, PaymentMode VARCHAR(30), PaidAmount MONEY)

-- Apply Constraints

--Patients Table
ALTER TABLE Patients ALTER COLUMN PatientID INT NOT NULL
ALTER TABLE Patients ADD CONSTRAINT PK_Patients PRIMARY KEY (PatientID)

ALTER TABLE Patients ADD CONSTRAINT UQ_Patients_Aadhaar UNIQUE (Aadhaar)

ALTER TABLE Patients ADD CONSTRAINT CK_Patients_Gender CHECK (Gender IN ('Male','Female'))

ALTER TABLE Patients ALTER COLUMN DOB DATE NOT NULL

--Doctor Table
ALTER TABLE Doctors ALTER COLUMN DoctorID INT NOT NULL
ALTER TABLE Doctors ADD CONSTRAINT PK_Doctors PRIMARY KEY (DoctorID)

ALTER TABLE Doctors ADD CONSTRAINT UQ_Doctors_Email UNIQUE (Email)

ALTER TABLE Doctors ADD CONSTRAINT CK_Doctors_Experience CHECK (Experience > 0)

ALTER TABLE Doctors ADD CONSTRAINT FK_Doctors_Departments FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)


--Department Table
ALTER TABLE Departments ALTER COLUMN DepartmentID INT NOT NULL
ALTER TABLE Departments ADD CONSTRAINT PK_Departments PRIMARY KEY (DepartmentID)

ALTER TABLE Departments ADD CONSTRAINT UQ_Departments_Name UNIQUE (DepartmentName)

--Rooms Table
ALTER TABLE Rooms ALTER COLUMN RoomID INT NOT NULL;
ALTER TABLE Rooms ADD CONSTRAINT PK_Rooms PRIMARY KEY (RoomID);

ALTER TABLE Rooms ADD CONSTRAINT CK_Rooms_Type CHECK (RoomType IN ('General','ICU','Private'));

ALTER TABLE Rooms ADD CONSTRAINT CK_Rooms_Charges CHECK (ChargesPerDay > 0);

--Appointments Table
ALTER TABLE Appointments ALTER COLUMN AppointmentID INT NOT NULL;
ALTER TABLE Appointments ADD CONSTRAINT PK_Appointments PRIMARY KEY (AppointmentID);

ALTER TABLE Appointments ADD CONSTRAINT DF_Appointments_Date DEFAULT GETDATE() FOR AppointmentDate;

ALTER TABLE Appointments ADD CONSTRAINT FK_Appointments_Patients FOREIGN KEY (PatientID) REFERENCES Patients(PatientID);

ALTER TABLE Appointments ADD CONSTRAINT FK_Appointments_Doctors FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID);


--Admissions Table
ALTER TABLE Admissions ALTER COLUMN AdmissionID INT NOT NULL;
ALTER TABLE Admissions ADD CONSTRAINT PK_Admissions PRIMARY KEY (AdmissionID);

ALTER TABLE Admissions ADD CONSTRAINT DF_Admissions_Date DEFAULT GETDATE() FOR AdmitDate;

ALTER TABLE Admissions ADD CONSTRAINT FK_Admissions_Patients FOREIGN KEY (PatientID) REFERENCES Patients(PatientID);

ALTER TABLE Admissions ADD CONSTRAINT FK_Admissions_Rooms FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID);

--Treatments Table
ALTER TABLE Treatments ALTER COLUMN TreatmentID INT NOT NULL;
ALTER TABLE Treatments ADD CONSTRAINT PK_Treatments PRIMARY KEY (TreatmentID);

ALTER TABLE Treatments ADD CONSTRAINT CK_Treatments_Cost CHECK (TreatmentCost > 0);

ALTER TABLE Treatments ADD CONSTRAINT FK_Treatments_Admissions FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID);

--Bills Table
ALTER TABLE Bills ALTER COLUMN BillID INT NOT NULL;
ALTER TABLE Bills ADD CONSTRAINT PK_Bills PRIMARY KEY (BillID);

ALTER TABLE Bills ADD CONSTRAINT CK_Bills_Amount CHECK (TotalAmount > 0);

ALTER TABLE Bills ADD CONSTRAINT FK_Bills_Admissions FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID);

--Payments Table
ALTER TABLE Payments ALTER COLUMN PaymentID INT NOT NULL;
ALTER TABLE Payments ADD CONSTRAINT PK_Payments PRIMARY KEY (PaymentID);
ALTER TABLE Payments ADD CONSTRAINT CK_Payments_Mode CHECK (PaymentMode IN ('Cash','Card','UPI'));
ALTER TABLE Payments ADD CONSTRAINT CK_Payments_Amount CHECK (PaidAmount > 0);
ALTER TABLE Payments ADD CONSTRAINT FK_Payments_Bills FOREIGN KEY (BillID) REFERENCES Bills(BillID);


-- Inserting Values

INSERT INTO Departments VALUES
(1,'Cardiology'),
(2,'Neurology'),
(3,'Orthopedics'),
(4,'Pediatrics'),
(5,'General Medicine');

INSERT INTO Patients VALUES
(1,'123456789001','Male','1999-05-12'),
(2,'123456789002','Female','2001-03-18'),
(3,'123456789003','Male','1998-07-25'),
(4,'123456789004','Female','2002-11-02'),
(5,'123456789005','Male','1997-01-10'),
(6,'123456789006','Female','2000-06-14'),
(7,'123456789007','Male','1995-09-09'),
(8,'123456789008','Female','2003-12-21'),
(9,'123456789009','Male','1996-04-30'),
(10,'123456789010','Female','2001-08-19'),
(11,'123456789011','Male','1994-02-11'),
(12,'123456789012','Female','1999-10-05'),
(13,'123456789013','Male','2000-07-07'),
(14,'123456789014','Female','1998-03-03'),
(15,'123456789015','Male','1997-06-16'),
(16,'123456789016','Female','2002-09-27'),
(17,'123456789017','Male','1996-12-01'),
(18,'123456789018','Female','2001-01-22'),
(19,'123456789019','Male','1995-08-08'),
(20,'123456789020','Female','1999-11-11');


INSERT INTO Doctors VALUES
(1,'doc1@hospital.com',1,10),
(2,'doc2@hospital.com',2,8),
(3,'doc3@hospital.com',3,12),
(4,'doc4@hospital.com',4,6),
(5,'doc5@hospital.com',5,15),
(6,'doc6@hospital.com',1,9),
(7,'doc7@hospital.com',2,7),
(8,'doc8@hospital.com',3,5);


INSERT INTO Rooms VALUES
(1,'General',1500),(2,'General',1500),(3,'General',1500),
(4,'Private',3500),(5,'Private',3500),(6,'Private',3500),
(7,'ICU',7000),(8,'ICU',7000),(9,'ICU',7000),
(10,'General',1500),(11,'Private',3500),(12,'ICU',7000),
(13,'General',1500),(14,'Private',3500),(15,'ICU',7000);


INSERT INTO Appointments (AppointmentID,PatientID,DoctorID) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,1),(10,10,2),
(11,11,3),(12,12,4),(13,13,5),(14,14,6),(15,15,7),
(16,16,8),(17,17,1),(18,18,2),(19,19,3),(20,20,4),
(21,1,5),(22,2,6),(23,3,7),(24,4,8),(25,5,1),
(26,6,2),(27,7,3),(28,8,4),(29,9,5),(30,10,6);


INSERT INTO Admissions (AdmissionID,PatientID,RoomID) VALUES
(1,1,7),(2,2,8),(3,3,4),(4,4,5),(5,5,1),
(6,6,2),(7,7,9),(8,8,6),(9,9,10),(10,10,11),
(11,11,12),(12,12,3),(13,13,13),(14,14,14),(15,15,15);


INSERT INTO Treatments VALUES
(1,1,12000),(2,1,8000),(3,2,15000),(4,2,7000),
(5,3,6000),(6,3,9000),(7,4,11000),(8,4,5000),
(9,5,4000),(10,6,7500),(11,7,20000),(12,7,9000),
(13,8,6500),(14,9,3000),(15,10,8500),
(16,11,14000),(17,12,4500),(18,13,6000),
(19,14,9500),(20,15,10000),(21,5,5000),
(22,6,6500),(23,8,7000),(24,9,4000),(25,10,9000);

INSERT INTO Bills VALUES
(1,1,20000),(2,2,22000),(3,3,15000),(4,4,16000),(5,5,9000),
(6,6,14000),(7,7,29000),(8,8,18000),(9,9,7000),(10,10,17500),
(11,11,14000),(12,12,4500),(13,13,6000),(14,14,9500),(15,15,10000);

INSERT INTO Payments VALUES
(1,1,'Cash',10000),(2,1,'UPI',10000),
(3,2,'Card',22000),
(4,3,'Cash',15000),
(5,4,'UPI',16000),
(6,5,'Cash',9000),
(7,6,'Card',14000),
(8,7,'UPI',20000),(9,7,'Cash',9000),
(10,8,'Card',18000),
(11,9,'Cash',7000),
(12,10,'UPI',17500),
(13,11,'Cash',14000),
(14,12,'UPI',4500),
(15,13,'Card',6000),
(16,14,'Cash',9500),
(17,15,'UPI',10000),
(18,2,'Cash',5000),
(19,3,'UPI',5000),
(20,4,'Card',6000);


--Section 4 — Basic Queries (DQL)

SELECT * FROM Patients;
SELECT * FROM Patients WHERE DOB > '2000-12-31';
SELECT * FROM Rooms WHERE RoomType = 'ICU';
SELECT * FROM Doctors WHERE Experience > 5;
SELECT COUNT(*) AS TotalPatients FROM Patients;


-- Section 5 — GROUP BY / HAVING
SELECT DepartmentID, COUNT(*) AS DoctorCount FROM Doctors GROUP BY DepartmentID;
--
--
SELECT DoctorID, COUNT(*) AS AppointmentCount FROM Appointments GROUP BY DoctorID;


-- Section 6 — Subqueries
--
--
SELECT * FROM Patients WHERE PatientID NOT IN (SELECT PatientID FROM Admissions)
SELECT * FROM Rooms WHERE RoomID NOT IN (SELECT RoomID FROM Admissions)


-- Section 7 — Update / Delete
UPDATE Rooms SET ChargesPerDay = ChargesPerDay * 1.10;
UPDATE Doctors SET DepartmentID = 2 WHERE DoctorID = 1;
--
UPDATE Admissions SET DischargeDate = GETDATE() WHERE DischargeDate IS NULL;


-- Section 8 — Alter Table
ALTER TABLE Patients ADD BloodGroup VARCHAR(5);
ALTER TABLE Doctors ADD Qualification VARCHAR(50);
ALTER TABLE Doctors ALTER COLUMN Email VARCHAR(100);
ALTER TABLE Doctors DROP COLUMN Qualification;