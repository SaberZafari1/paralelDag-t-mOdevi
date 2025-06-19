
-- SQL Server Authentication kullanıcı
CREATE LOGIN Saber WITH PASSWORD = 'H7f4gt!';
USE OrnekDB;
CREATE USER Saber FOR LOGIN Saber;
ALTER ROLE db_datareader ADD MEMBER Saber;

-- Windows Authentication kullanıcı (örnek)
CREATE LOGIN [saz-pc\saber] FROM WINDOWS;
CREATE USER [saz-pc\saber] FOR LOGIN [saz-pc\saber];
ALTER ROLE db_datareader ADD MEMBER [saz-pc\saber];
