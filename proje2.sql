--2. Veritabanı Yedekleme ve Felaketten Kurtarma Planı
--Tam, Artık, Fark Yedeklemeleri: 
--Tam Yedekleme: Veritabanının tüm verisini yedekler.
BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\SQLYedek\Adventureworks2019_TamYedek.bak'
WITH FORMAT, INIT,
NAME = 'Adventureworks2019 Tam Yedekleme';

--Fark Yedekleme: En son tam yedekten bu yana değişen verileri yedekler. Geri yükleme için hem tam hem fark yedeği gerekir.
BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\SQLYedek\AdventureWorks2019_DIFF.bak'
WITH DIFFERENTIAL,
NAME = 'Adventureworks2019 Fark Yedekleme';

--Artırımlı (Transaction Log) Yedekleme: Veritabanındaki işlemleri (logları) yedekleyerek veri kaybını en aza indirir.
ALTER DATABASE AdventureWorks2019
SET RECOVERY FULL;
GO

BACKUP LOG AdventureWorks2019
TO DISK = 'C:\SQLYedek\Adventureworks2019_LOG.trn'
WITH NAME = 'Adventureworks2019 LOG Yedegi';

--Zamanlayıcılarla Yedekleme:
--SQL Server Agent üzerinden “New Job” tanımlanarak günlük/tarifeli yedek alma işlemleri yapılmıştır. Maintenance Plan Wizard ile Full, Differential ve Log yedekleri zamanlanmıştır.

--Felaketten Kurtarma Senaryoları:
--FULL
--Back up Database ile ayarlama yapılmış ve aşağıdaki kodla tamamlanmıştır.
BACKUP DATABASE [AdventureWorks2019] TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2019Full.bak'

--Differential
--Back up Database ile ayarlama yapılmış

--Transaction Log
--Back up Database ile ayarlama yapılmış


--Test Yedekleme Senaryoları:
RESTORE VERIFYONLY
FROM DISK = 'C:\SQLYedek\Adventureworks2019_TamYedek2.bak';

RESTORE VERIFYONLY 
FROM DISK = 'C:\SQLYedek\Adventureworks2019_DIFF2.bak';

RESTORE VERIFYONLY 
FROM DISK = 'C:\SQLYedek\Adventureworks2019_LOG2.trn'



--Merve nur dogru