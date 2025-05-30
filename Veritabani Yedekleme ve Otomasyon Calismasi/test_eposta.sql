-- Test e-postası gönderme
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'YedeklemeMailProfili',
    @recipients = 'saberzafari3@gmail.com',
    @subject = 'Test Mail from SQL Server',
    @body = 'Bu bir test e-postasıdır.';


