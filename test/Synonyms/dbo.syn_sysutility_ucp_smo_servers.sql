SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Synonym [dbo].[syn_sysutility_ucp_smo_servers]
Print 'Create Synonym [dbo].[syn_sysutility_ucp_smo_servers]'
GO
CREATE SYNONYM [dbo].[syn_sysutility_ucp_smo_servers] FOR [msdb].[dbo].[sysutility_ucp_smo_servers_stub]
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
