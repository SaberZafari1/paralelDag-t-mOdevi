USE AdventureWorks2020;
GO
--şema değişikliği:
-- yeni sütun ekleme
ALTER TABLE Person.Person
ADD SocialSecurityNumber NVARCHAR(11) NULL;

-- Ürün tablosuna üretim tarihi sütunu ekle
ALTER TABLE Production.Product
ADD ManufacturingDate DATE NULL;

-- Sütun adını değiştir (Name → ProductName)
EXEC sp_rename 'Production.Product.Name', 'ProductName', 'COLUMN';

-- Product tablosundan eski bir sütunu sil
ALTER TABLE Production.Product
DROP COLUMN ProductLine;

-- Sütun veri tipini NVARCHAR(50) → NVARCHAR(100) olarak değiştir
ALTER TABLE Person.Person
ALTER COLUMN LastName NVARCHAR(100);

-- yeni tablo ekleme
CREATE TABLE EmployeeLeave (
    LeaveID INT PRIMARY KEY IDENTITY(1,1),
    BusinessEntityID INT,
    LeaveType NVARCHAR(50),
    StartDate DATE,
    EndDate DATE
);
