Use AdventureWorks2019;
SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013 AND TotalDue > 5000
ORDER BY TotalDue DESC;