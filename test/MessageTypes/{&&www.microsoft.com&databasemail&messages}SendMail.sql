SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Message Type [{//www.microsoft.com/databasemail/messages}SendMail]
Print 'Create Message Type [{//www.microsoft.com/databasemail/messages}SendMail]'
GO
CREATE MESSAGE TYPE [{//www.microsoft.com/databasemail/messages}SendMail]
	AUTHORIZATION [dbo]
	VALIDATION = NONE
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
