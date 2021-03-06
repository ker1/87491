SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Type [dbo].[syspolicy_target_filters_type]
Print 'Create Type [dbo].[syspolicy_target_filters_type]'
GO
CREATE TYPE [dbo].[syspolicy_target_filters_type]
AS TABLE (
		[target_filter_id]     [int] NULL,
		[policy_id]            [int] NULL,
		[type]                 [sysname] NOT NULL,
		[filter]               [nvarchar](max) NOT NULL,
		[type_skeleton]        [sysname] NOT NULL
)
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
