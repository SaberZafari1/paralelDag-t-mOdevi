USE msdb;
GO

EXEC msdb.dbo.sp_add_operator  
    @name = N'DBAOperator',  
    @enabled = 1,            
    @email_address = N'saberzafari3@gmail.com';  


EXEC sp_add_alert
    @name = N'Yedekleme Başarılı Alert',
    @message_id = 0,
    @severity = 16,
    @enabled = 1,
    @delay_between_responses = 300,
    @include_event_description_in = 1,
    @notification_message = N'AdventureWorks2020 yedeklemesi başarılı oldu.',
    @job_name = N'OtomatikAdventureWorksYedekleme';
GO

-- Bu alert'e bildirim bağlayalım
EXEC msdb.dbo.sp_add_notification
    @alert_name = N'Yedekleme Başarılı Alert',
    @operator_name = N'DBAOperator',
    @notification_method = 1; 
