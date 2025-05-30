-- Mevcut veritabanının yedeğini al
BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2019.bak'
WITH FORMAT,
     MEDIANAME = 'AdventureWorks2019Backup',
     NAME = 'Full Backup of AdventureWorks2019';


