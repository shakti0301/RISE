CREATE DATABASE EmpTravelDB
USE EmpTravelDB;
GO

-- 1. GET ALL
CREATE OR ALTER PROCEDURE spGetAllRequests
AS
BEGIN
    SELECT * FROM TravelRequests
END
GO

-- 2. GET BY ID (FIXED)
CREATE OR ALTER PROCEDURE spGetRequestsById
    @RequestId INT
AS
BEGIN
    SELECT * FROM TravelRequests WHERE RequestId = @RequestId
END
GO

-- 3. ADD
CREATE OR ALTER PROCEDURE spAddTravelRequest
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
GO

-- 4. UPDATE
CREATE OR ALTER PROCEDURE spUpdateRequest
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
GO

-- 5. DELETE
CREATE OR ALTER PROCEDURE spDeleteRequest
    @RequestId INT
AS
BEGIN
    DELETE FROM TravelRequests WHERE RequestId = @RequestId
END
GO



ALTER PROCEDURE spGetRequestsById
    @RequestId INT
AS
BEGIN
    SELECT * FROM TravelRequests WHERE RequestId = @RequestId
END
GO
SELECT DB_NAME();
SELECT name FROM sys.procedures;

INSERT INTO Employees (Name, Email)
VALUES ('Shakti', 'shakti@email.com');
