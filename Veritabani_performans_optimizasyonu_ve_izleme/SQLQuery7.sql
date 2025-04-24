Use AdventureWorks2019;

SELECT * 
FROM Sales.SalesOrderDetail
WHERE ProductID IN (SELECT ProductID FROM Production.Product WHERE Color = 'Red');