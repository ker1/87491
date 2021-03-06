SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[syspolicy_validate_events]
Print 'Create Trigger [dbo].[syspolicy_validate_events]'
GO
CREATE TRIGGER dbo.[syspolicy_validate_events] on [dbo].[syspolicy_facet_events]
WITH ENCRYPTION
AFTER INSERT, UPDATE
AS
BEGIN
    -- make sure that caller is dbo and all events inserted are real events.
    IF  (USER_ID() != 1) OR
        EXISTS (SELECT event_name FROM inserted 
                    WHERE event_name NOT IN(SELECT type_name from sys.event_notification_event_types))
    BEGIN
        RAISERROR(N'Unknown event name inserted into [dbo].[syspolicy_facet_events]', 1,1)
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
