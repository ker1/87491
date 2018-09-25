SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Synonym [dbo].[syn_sysutility_ucp_logfiles]
Print 'Create Synonym [dbo].[syn_sysutility_ucp_logfiles]'
GO
CREATE SYNONYM [dbo].[syn_sysutility_ucp_logfiles] FOR [msdb].[dbo].[sysutility_ucp_logfiles_stub]
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
