CREATE LOGIN ReportUser WITH PASSWORD = '123456';
USE AdventureWorks2019;
CREATE USER ReportUser FOR LOGIN ReportUser;
EXEC sp_addrolemember 'db_datareader', 'ReportUser';


SELECT 
    dp.name AS PrincipalName,
    dp.type_desc AS PrincipalType,
    o.name AS ObjectName,
    p.permission_name,
    p.state_desc
FROM 
    sys.database_permissions p
JOIN 
    sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
LEFT JOIN 
    sys.objects o ON p.major_id = o.object_id
WHERE 
    dp.name = 'ReportUser';
