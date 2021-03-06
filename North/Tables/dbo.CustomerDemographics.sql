SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[CustomerDemographics]
Print 'Create Table [dbo].[CustomerDemographics]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDemographics] (
		[CustomerTypeID]     [nchar](10) NOT NULL,
		[CustomerDesc]       [ntext] NULL,
		CONSTRAINT [PK_CustomerDemographics]
		PRIMARY KEY
		NONCLUSTERED
		([CustomerTypeID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerDemographics] SET (LOCK_ESCALATION = TABLE)
GO

