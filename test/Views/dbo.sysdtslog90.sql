SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create View [dbo].[sysdtslog90]
Print 'Create View [dbo].[sysdtslog90]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[sysdtslog90]
AS
	SELECT [id]
		  ,[event]
		  ,[computer]
		  ,[operator]
		  ,[source]
		  ,[sourceid]
		  ,[executionid]
		  ,[starttime]
		  ,[endtime]
		  ,[datacode]
		  ,[databytes]
		  ,[message]
	  FROM [msdb].[dbo].[sysssislog]

GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
