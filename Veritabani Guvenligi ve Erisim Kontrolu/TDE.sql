-- TDE (Transparent Data Encryption)

-- Master Key oluşturmak
USE master;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'A1q2s3w4';

-- Sertifika oluşturmak
CREATE CERTIFICATE TDE_Cert WITH SUBJECT = 'TDE Certificate';

-- Database Encryption Key oluşturmak
USE OrnekDB;
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE TDE_Cert;

-- Şifrelemeyi etkinleştirmek
ALTER DATABASE OrnekDB SET ENCRYPTION ON;
