SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_sysmail_profile]
Print 'Create Trigger [dbo].[trig_sysmail_profile]'
GO

CREATE TRIGGER dbo.trig_sysmail_profile
ON msdb.dbo.sysmail_profile
WITH ENCRYPTION
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_sysmail_profile'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_profile 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_profile p, inserted i
      WHERE p.profile_id = i.profile_id
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
