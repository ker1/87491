SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Trigger [dbo].[trig_principalprofile]
Print 'Create Trigger [dbo].[trig_principalprofile]'
GO

CREATE TRIGGER dbo.trig_principalprofile
ON msdb.dbo.sysmail_principalprofile
WITH ENCRYPTION
FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON  

   IF (TRIGGER_NESTLEVEL( OBJECT_ID('dbo.trig_principalprofile'), 'AFTER' , 'DML' ) <= 1) 
   BEGIN  
      UPDATE msdb.dbo.sysmail_principalprofile 
      SET last_mod_datetime = getdate(),last_mod_user = suser_sname() 
      FROM sysmail_principalprofile p, inserted i
      WHERE p.profile_id = i.profile_id and p.principal_sid = i.principal_sid
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
