SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Synonym [dbo].[syn_sysutility_ucp_cpu_utilization]
Print 'Create Synonym [dbo].[syn_sysutility_ucp_cpu_utilization]'
GO
CREATE SYNONYM [dbo].[syn_sysutility_ucp_cpu_utilization] FOR [msdb].[dbo].[sysutility_ucp_cpu_utilization_stub]
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
