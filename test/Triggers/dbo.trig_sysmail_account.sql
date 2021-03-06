SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_sysmail_account]
Print 'Create Trigger [dbo].[trig_sysmail_account]'
GO

CREATE TRIGGER dbo.trig_sysmail_account
ON msdb.dbo.sysmail_account
WITH ENCRYPTION
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_account'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_account 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_account a, inserted i
      WHERE a.account_id = i.account_id
   END
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
