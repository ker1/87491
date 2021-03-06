SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create User [MS_DataCollectorInternalUser]
Print 'Create User [MS_DataCollectorInternalUser]'
GO
CREATE USER [MS_DataCollectorInternalUser]
	WITHOUT LOGIN
	WITH DEFAULT_SCHEMA = [dbo]
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
