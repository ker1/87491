SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[syspolicy_instead_delete_policy_trigger]
Print 'Create Trigger [dbo].[syspolicy_instead_delete_policy_trigger]'
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- when changing logic in this trigger, please remember to change the logic in #sp_syspolicy_cascade_delete_policy of alwayson.sql
-------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[syspolicy_instead_delete_policy_trigger] on [dbo].[syspolicy_policies_internal]
WITH ENCRYPTION
INSTEAD OF DELETE 
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

	-- This trigger deletes references in given order to protect from deadlocks
	DELETE msdb.dbo.syspolicy_policy_execution_history_internal	WHERE policy_id in (SELECT policy_id FROM deleted)
	DELETE msdb.dbo.syspolicy_system_health_state_internal		WHERE policy_id in (SELECT policy_id FROM deleted)
	DELETE msdb.dbo.syspolicy_policies_internal		WHERE policy_id in (SELECT policy_id FROM deleted)
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
