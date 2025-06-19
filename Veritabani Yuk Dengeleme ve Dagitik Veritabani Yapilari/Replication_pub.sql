
-- publisher

CREATE DATABASE ReplicationDB;
GO

USE ReplicationDB;
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Department NVARCHAR(100)
);

-- test
USE ReplicationDB;
INSERT INTO Employees VALUES (1, 'Saber', 'IT');