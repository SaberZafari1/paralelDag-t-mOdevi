Use AdventureWorks2019;
SELECT TOP 10 c.CustomerID, SUM(soh.TotalDue) AS TotalSpent
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC;
