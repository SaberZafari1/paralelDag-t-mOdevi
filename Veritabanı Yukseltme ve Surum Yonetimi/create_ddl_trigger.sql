
USE AdventureWorks2020;
GO

-- Değişiklikleri izlemek için log tablosu oluştur
CREATE TABLE SchemaChangeLog (
    ChangeID INT IDENTITY(1,1),
    EventData XML,
    ChangedBy SYSNAME,
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO

-- Veritabanı seviyesinde DDL trigger oluştur
CREATE TRIGGER trg_SchemaChangeLog
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS
BEGIN
    INSERT INTO SchemaChangeLog(EventData, ChangedBy)
    VALUES (EVENTDATA(), SYSTEM_USER);
END;
GO
