SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Contract [//www.microsoft.com/databasemail/contracts/SendMail/v1.0]
Print 'Create Contract [//www.microsoft.com/databasemail/contracts/SendMail/v1.0]'
GO
CREATE CONTRACT [//www.microsoft.com/databasemail/contracts/SendMail/v1.0]
	AUTHORIZATION [dbo]
	([{//www.microsoft.com/databasemail/messages}SendMail] SENT BY INITIATOR, [{//www.microsoft.com/databasemail/messages}SendMailStatus] SENT BY TARGET)
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
