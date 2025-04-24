CREATE LOGIN ReportUser WITH PASSWORD = '123456';
USE AdventureWorks2019;
CREATE USER ReportUser FOR LOGIN ReportUser;
EXEC sp_addrolemember 'db_datareader', 'ReportUser';


SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
