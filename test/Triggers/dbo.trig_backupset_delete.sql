SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_backupset_delete]
Print 'Create Trigger [dbo].[trig_backupset_delete]'
GO

CREATE TRIGGER dbo.trig_backupset_delete ON msdb.dbo.backupset WITH ENCRYPTION
FOR DELETE AS
BEGIN
  DELETE FROM msdb.dbo.logmarkhistory from deleted
  WHERE (msdb.dbo.logmarkhistory.database_name = deleted.database_name)
    AND (msdb.dbo.logmarkhistory.lsn >= deleted.first_lsn)
    AND (msdb.dbo.logmarkhistory.lsn < deleted.last_lsn)
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
