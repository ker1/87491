SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Synonym [dbo].[syn_sysutility_ucp_space_utilization]
Print 'Create Synonym [dbo].[syn_sysutility_ucp_space_utilization]'
GO
CREATE SYNONYM [dbo].[syn_sysutility_ucp_space_utilization] FOR [msdb].[dbo].[sysutility_ucp_space_utilization_stub]
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
