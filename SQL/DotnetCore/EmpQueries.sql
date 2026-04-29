CREATE DATABASE EmpTravelDB

USE EmpTravelDB

CREATE TABLE Employees
(
    EmployeeId INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE TravelRequests
(
    RequestId INT PRIMARY KEY IDENTITY,
    EmployeeId INT,
    Destination VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
) 

CREATE PROCEDURE spAddTravelRequest
    @EmployeeId INT,
    @Destination NVARCHAR(100),
    @StartDate DATE,
    @EndDate DATE,
    @Status NVARCHAR(50)
AS
BEGIN
    INSERT INTO TravelRequests (EmployeeId, Destination, StartDate, EndDate, Status)
    VALUES (@EmployeeId, @Destination, @StartDate, @EndDate, @Status)
END


CREATE PROCEDURE spGetAllRequests
AS
BEGIN
    SELECT * FROM TravelRequests
END


CREATE PROCEDURE spGetRequestsById
    @EmployeeId INT
AS
BEGIN
    SELECT * FROM TravelRequests WHERE EmployeeId = @EmployeeId
END


CREATE PROCEDURE spUpdateRequest
    @RequestId INT,
    @EmployeeId INT,
    @Destination NVARCHAR(100),
    @StartDate DATE,
    @EndDate DATE,
    @Status NVARCHAR(50)
AS
BEGIN
    UPDATE TravelRequests
    SET EmployeeId = @EmployeeId,
        Destination = @Destination,
        StartDate = @StartDate,
        EndDate = @EndDate,
        Status = @Status
    WHERE RequestId = @RequestId
END


CREATE PROCEDURE spDeleteRequest
    @RequestId INT
AS
BEGIN
    DELETE FROM TravelRequests WHERE RequestId = @RequestId
END