SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Synonym [dbo].[syn_sysutility_ucp_filegroups]
Print 'Create Synonym [dbo].[syn_sysutility_ucp_filegroups]'
GO
CREATE SYNONYM [dbo].[syn_sysutility_ucp_filegroups] FOR [msdb].[dbo].[sysutility_ucp_filegroups_stub]
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
