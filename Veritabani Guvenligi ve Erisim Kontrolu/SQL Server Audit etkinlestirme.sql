-- SQL Server Audit etkinleştirme

-- Audit nesnesi oluşturmak
USE master;
CREATE SERVER AUDIT Audit_OrnekDB
TO FILE ( FILEPATH = 'C:\AuditLogs\' ); -- klasörü mevcut olmalı
ALTER SERVER AUDIT Audit_OrnekDB WITH (STATE = ON);




-- Audit Specification oluşturmak
USE OrnekDB;
CREATE DATABASE AUDIT SPECIFICATION Audit_Spec_OrnekDB
FOR SERVER AUDIT Audit_OrnekDB
ADD (SELECT ON OBJECT::Users BY public),
ADD (INSERT ON OBJECT::Users BY public)
WITH (STATE = ON);
