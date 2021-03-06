SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_sysmail_profile_delete]
Print 'Create Trigger [dbo].[trig_sysmail_profile_delete]'
GO

CREATE TRIGGER dbo.trig_sysmail_profile_delete
ON msdb.dbo.sysmail_profile
WITH ENCRYPTION
FOR DELETE
AS
BEGIN
   DELETE FROM msdb.dbo.sysmail_profileaccount
   WHERE profile_id IN (SELECT profile_id FROM deleted)
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
