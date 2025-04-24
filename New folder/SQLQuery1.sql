USE AdventureWorks2019;
SELECT p.Color, SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Color
ORDER BY TotalSales DESC;
