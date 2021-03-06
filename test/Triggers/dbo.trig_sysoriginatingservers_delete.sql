SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_sysoriginatingservers_delete]
Print 'Create Trigger [dbo].[trig_sysoriginatingservers_delete]'
GO
CREATE TRIGGER dbo.trig_sysoriginatingservers_delete
ON dbo.sysoriginatingservers
WITH ENCRYPTION
FOR DELETE
AS
BEGIN
  SET NOCOUNT ON
  -- Only a single MSX server entry can exist in this table. ie. originating_server_id = 1 and master_server = 1. 
  IF((EXISTS (SELECT *
           FROM deleted AS d
                JOIN dbo.sysjobs AS j ON d.originating_server_id = j.originating_server_id)) OR
    (EXISTS (SELECT *
           FROM deleted AS d
                JOIN dbo.sysschedules AS s ON d.originating_server_id = s.originating_server_id)))
  BEGIN
    RAISERROR(14380, -1, -1)
   ROLLBACK TRANSACTION
    RETURN
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
