-- ==========================================
-- Yük Dengeleme ve Failover Kurulumu
-- AdventureWorks2019 Veritabanı
-- ==========================================

-- Principal Sunucusunda FULL ve LOG Backup Al
BACKUP DATABASE AdventureWorks2019 
TO DISK = 'C:\Backup\AdventureWorks2019.bak';

BACKUP LOG AdventureWorks2019 
TO DISK = 'C:\Backup\AdventureWorks2019.trn';

-- Mirror Sunucusunda Full Backup ve Log Backup'ı NORECOVERY ile Restore Et
RESTORE DATABASE AdventureWorks2019 
FROM DISK = 'C:\Backup\AdventureWorks2019.bak'
WITH NORECOVERY;

RESTORE LOG AdventureWorks2019 
FROM DISK = 'C:\Backup\AdventureWorks2019.trn'
WITH NORECOVERY;

-- Principal Sunucusunda Mirroring Endpoint Oluştur
CREATE ENDPOINT Mirroring
STATE=STARTED
AS TCP (LISTENER_PORT=5022)
FOR DATABASE_MIRRORING (ROLE=PARTNER);

-- Mirror Sunucusunda Mirroring Endpoint Oluştur
CREATE ENDPOINT Mirroring
STATE=STARTED
AS TCP (LISTENER_PORT=5022)
FOR DATABASE_MIRRORING (ROLE=PARTNER);

-- Principal Sunucusunda Partner Ayarla
ALTER DATABASE AdventureWorks2019 
SET PARTNER = 'TCP://SQLServer2:5022';

-- Mirror Sunucusunda Partner Ayarla
ALTER DATABASE AdventureWorks2019 
SET PARTNER = 'TCP://SQLServer1:5022';

-- (Opsiyonel) Witness Sunucusu Ekleyerek Otomatik Failover Sağla
-- ALTER DATABASE AdventureWorks2019 
-- SET WITNESS = 'TCP://WitnessServer:5023';

-- Mirroring Durumunu Kontrol Et
SELECT mirroring_state_desc, mirroring_role_desc, mirroring_partner_name 
FROM sys.database_mirroring
WHERE database_id = DB_ID('AdventureWorks2019');

-- (Opsiyonel) Manuel Failover Yap
-- ALTER DATABASE AdventureWorks2019 SET PARTNER FAILOVER;
