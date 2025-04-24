Use AdventureWorks2019;

SELECT * FROM Person.Person WHERE LastName LIKE 'S%';
SELECT * FROM Sales.SalesOrderHeader WHERE OrderDate > '2013-01-01';
SELECT * FROM Production.Product WHERE Color = 'Black';

SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.index_id,
    user_seeks, user_scans, user_lookups, user_updates
FROM 
    sys.dm_db_index_usage_stats AS s
INNER JOIN 
    sys.indexes AS i ON i.object_id = s.object_id AND i.index_id = s.index_id
WHERE 
    database_id = DB_ID('AdventureWorks2019')
    AND OBJECTPROPERTY(i.object_id,'IsUserTable') = 1;

SELECT 
    migs.avg_total_user_cost * migs.avg_user_impact * (migs.user_seeks + migs.user_scans) AS improvement_measure,
    mid.statement AS [Table],
    mid.equality_columns, mid.inequality_columns, mid.included_columns
FROM 
    sys.dm_db_missing_index_group_stats AS migs
INNER JOIN 
    sys.dm_db_missing_index_groups AS mig ON migs.group_handle = mig.index_group_handle
INNER JOIN 
    sys.dm_db_missing_index_details AS mid ON mig.index_handle = mid.index_handle
ORDER BY 
    improvement_measure DESC;
