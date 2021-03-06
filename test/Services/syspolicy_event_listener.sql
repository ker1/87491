SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Service [syspolicy_event_listener]
Print 'Create Service [syspolicy_event_listener]'
GO
CREATE SERVICE [syspolicy_event_listener]
	AUTHORIZATION [dbo]
	ON QUEUE [dbo].[syspolicy_event_queue]
	([http://schemas.microsoft.com/SQL/Notifications/PostEventNotification])
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
