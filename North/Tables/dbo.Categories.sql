SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Categories]
Print 'Create Table [dbo].[Categories]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories] (
		[CategoryID]       [int] IDENTITY(1, 1) NOT NULL,
		[CategoryName]     [nvarchar](15) NOT NULL,
		[Description]      [ntext] NULL,
		[Picture]          [image] NULL,
		CONSTRAINT [PK_Categories]
		PRIMARY KEY
		CLUSTERED
		([CategoryID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CategoryName]
	ON [dbo].[Categories] ([CategoryName])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] SET (LOCK_ESCALATION = TABLE)
GO

