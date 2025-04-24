Use AdventureWorks2019;
SELECT 
    soh.SalesOrderID,
    p.Name AS ProductName,
    per.FirstName + ' ' + per.LastName AS CustomerName,
    sod.LineTotal
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person per ON c.PersonID = per.BusinessEntityID
ORDER BY LineTotal DESC;
