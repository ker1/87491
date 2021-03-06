SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[sysmanagement_delete_shared_server_group_trigger]
Print 'Create Trigger [dbo].[sysmanagement_delete_shared_server_group_trigger]'
GO
CREATE TRIGGER dbo.[sysmanagement_delete_shared_server_group_trigger] on [msdb].[dbo].[sysmanagement_shared_server_groups_internal] 
WITH ENCRYPTION
FOR DELETE
AS
BEGIN
    -- system server groups should not be deleted
    IF EXISTS (SELECT * FROM deleted where is_system_object = 1)
    BEGIN
        RAISERROR (35008, 1, 1)
        ROLLBACK TRANSACTION
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
