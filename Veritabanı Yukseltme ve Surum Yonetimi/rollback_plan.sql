
-- Geri dönüş planı: eski yedeği geri yükleme
USE master;
GO
RESTORE DATABASE AdventureWorks2019
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2019.bak'
WITH REPLACE;
