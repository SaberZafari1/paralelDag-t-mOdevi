
USE AdventureWorks2020;
GO

-- 1. IDENTITY_INSERT ON yap
SET IDENTITY_INSERT Person.BusinessEntity ON;
GO

-- 2. Veri ekle (explicit ID ile)
INSERT INTO Person.BusinessEntity (BusinessEntityID, rowguid, ModifiedDate)
VALUES (21001, NEWID(), GETDATE());
GO

-- 3. IDENTITY_INSERT OFF yap (zorunludur)
SET IDENTITY_INSERT Person.BusinessEntity OFF;
GO




-- Test verisi ekleme
INSERT INTO Person.Person (BusinessEntityID, PersonType, FirstName, LastName)
VALUES (21001, 'EM', 'Ali', 'Yılmaz');

-- Veri sorgulama testi
SELECT TOP 5 * FROM Person.Person ORDER BY ModifiedDate DESC;

-- DDL trigger testi: bir tablo ekleyip SchemaChangeLog’a kaydını kontrol et
CREATE TABLE TestTrigger (ID INT);
SELECT * FROM SchemaChangeLog ORDER BY ChangeDate DESC;
