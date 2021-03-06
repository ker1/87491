SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_notification_ins_or_upd]
Print 'Create Trigger [dbo].[trig_notification_ins_or_upd]'
GO
CREATE TRIGGER dbo.trig_notification_ins_or_upd
ON msdb.dbo.sysnotifications
WITH ENCRYPTION
FOR INSERT,
    UPDATE
AS
BEGIN
  SET NOCOUNT ON

  -- First, throw out 'non-notification' rows
  DELETE FROM msdb.dbo.sysnotifications
  WHERE (notification_method = 0)

  -- Reset the has_notification flag for the affected alerts
  UPDATE msdb.dbo.sysalerts
  SET has_notification = 0
  FROM inserted           i,
       msdb.dbo.sysalerts sa
  WHERE (i.alert_id = sa.id)

  -- Update sysalerts.has_notification (for email)
  UPDATE msdb.dbo.sysalerts
  SET has_notification = has_notification | 1
  FROM msdb.dbo.sysalerts        sa,
       msdb.dbo.sysnotifications sn,
       inserted                  i
  WHERE (sa.id = sn.alert_id)
    AND (sa.id = i.alert_id)
    AND ((sn.notification_method & 1) = 1)

  -- Update sysalerts.has_notification (for pager)
  UPDATE msdb.dbo.sysalerts
  SET has_notification = has_notification | 2
  FROM msdb.dbo.sysalerts        sa,
       msdb.dbo.sysnotifications sn,
       inserted                  i
  WHERE (sa.id = sn.alert_id)
    AND (sa.id = i.alert_id)
    AND ((sn.notification_method & 2) = 2)

  -- Update sysalerts.has_notification (for netsend)
  UPDATE msdb.dbo.sysalerts
  SET has_notification = has_notification | 4
  FROM msdb.dbo.sysalerts        sa,
       msdb.dbo.sysnotifications sn,
       inserted                  i
  WHERE (sa.id = sn.alert_id)
    AND (sa.id = i.alert_id)
    AND ((sn.notification_method & 4) = 4)
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
