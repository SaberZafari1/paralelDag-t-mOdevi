--Veritabanı Güvenliği ve Erişim Kontrolü
--Erişim Yönetimi:
--Bu işlem, SQL Server Management Studio (SSMS) arayüzü üzerinden "Logins" > "New Login" yoluyla yapılmıştır. SQL Server authentication seçeneğinden limit2 adı verilerek şifre oluşturuldu. 
--Server Roles kısmından kullanıcıya public belirlendi. Daha sonrasında ise İlgili veritabanı üzerinde kullanıcıya sınırlı erişim tanımlandı.Tablo düzeyinde okuma/yazma izinleri kısıtlandı. 


--Veri Şifreleme
--Sertifika oluşturuluyor
CREATE CERTIFICATE TDE_Cert
WITH SUBJECT = 'TDE Sertifikası';

--AdventureWorks2019 üzerinde şifreleme anahtarı oluşturuluyor
USE AdventureWorks2019;
CREATE DATABASE ENCRYPTION KEY 
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE TDE_Cert;

--Şifreleme aktif ediliyor
ALTER DATABASE AdventureWorks2019 SET ENCRYPTION ON;

--Doğrulama
SELECT name, is_encrypted
FROM sys.databases
WHERE name = 'AdventureWorks2019'


--SQL Injection Testleri:
--Normal sorgu
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
Where BusinessEntityID = 1;

--SQL injection testi (güvensiz örnek)
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID = 1 OR 1=1;


--Audit Logları:
--Audit nesnesi oluşturuluyor
USE master;
CREATE SERVER AUDIT Audit_AdventureWorks2019
TO FILE
(
	FILEPATH = 'C:\SQLAudit\'
)
WITH 
(
	ON_FAILURE = CONTINUE
)
GO 
ALTER SERVER AUDIT Audit_AdventureWorks2019
WITH (State = ON);
GO

--Audit aktif hale getiriliyor
ALTER SERVER AUDIT Audit_AdventureWorks2019
WITH (STATE = ON);

--Merve Nur Dogru