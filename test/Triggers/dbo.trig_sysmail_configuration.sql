SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_sysmail_configuration]
Print 'Create Trigger [dbo].[trig_sysmail_configuration]'
GO

CREATE TRIGGER dbo.trig_sysmail_configuration
ON msdb.dbo.sysmail_configuration
WITH ENCRYPTION
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_configuration'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_configuration 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_configuration c, inserted i
      WHERE c.paramname = i.paramname
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
