Use AdventureWorks2019;
GO

SELECT 
    c.CustomerID,
    p.FirstName,
    p.LastName,
    a.AddressLine1,
    a.City,
    a.PostalCode
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID;




SELECT * 
FROM Person.Address
WHERE PostalCode IS NULL OR PostalCode = '';



SELECT *
FROM Person.Person
WHERE LEN(FirstName) < 2;



UPDATE Person.Address
SET PostalCode = '00000'
WHERE PostalCode IS NULL OR PostalCode = '';



UPDATE Person.Address
SET City = UPPER(City)
WHERE City COLLATE Latin1_General_CS_AS != UPPER(City);



SELECT 
    FirstName + ' ' + LastName AS FullName
FROM Person.Person;



SELECT 
    OrderDate,
    CONVERT(varchar, OrderDate, 23) AS OrderDateFormatted
FROM Sales.SalesOrderHeader;




CREATE TABLE dbo.CleanedCustomerData (
    CustomerID INT,
    FullName NVARCHAR(100),
    AddressLine1 NVARCHAR(100),
    City NVARCHAR(50),
    PostalCode NVARCHAR(20)
);

INSERT INTO dbo.CleanedCustomerData
SELECT 
    c.CustomerID,
    p.FirstName + ' ' + p.LastName AS FullName,
    a.AddressLine1,
    UPPER(a.City),
    ISNULL(a.PostalCode, '00000')
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID;

