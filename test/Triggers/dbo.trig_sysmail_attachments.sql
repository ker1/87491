SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_sysmail_attachments]
Print 'Create Trigger [dbo].[trig_sysmail_attachments]'
GO

CREATE TRIGGER dbo.trig_sysmail_attachments
ON msdb.dbo.sysmail_attachments
WITH ENCRYPTION
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_attachments'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_attachments 
      SET last_mod_date = GETDATE(), last_mod_user = SUSER_SNAME() 
      FROM sysmail_attachments a, inserted i
      WHERE a.attachment_id = i.attachment_id
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
