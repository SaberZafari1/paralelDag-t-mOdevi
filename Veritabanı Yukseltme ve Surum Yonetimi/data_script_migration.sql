
USE master;
GO

-- 2. Hedef veritabanını tek kullanıcı moduna al (bağlantıları sonlandırarak)
ALTER DATABASE AdventureWorks2020 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO


-- verileri ve scriptleri AdventureWorks2020'ye aktarmak
RESTORE DATABASE AdventureWorks2020
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2019.bak'
WITH MOVE 'AdventureWorks2019' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2020.mdf',
     MOVE 'AdventureWorks2019_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2020_log.ldf',
     REPLACE;


ALTER DATABASE AdventureWorks2020 SET MULTI_USER;
GO