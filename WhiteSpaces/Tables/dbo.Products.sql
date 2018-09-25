SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Products]
Print 'Create Table [dbo].[Products]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [dbo].[Products] (
		[ProductID]           [int] IDENTITY(1, 1) NOT NULL,
		[ProductName]         [nvarchar](40) NOT NULL,
		[SupplierID]          [int] NULL,
		[CategoryID]          [int] NULL,
		[QuantityPerUnit]     [nvarchar](20) NULL,
		[UnitPrice]           [money] NULL,
		[UnitsInStock]        [smallint] NULL,
		[UnitsOnOrder]        [smallint] NULL,
		[ReorderLevel]        [smallint] NULL,
		[Discontinued]        [bit] NOT NULL,
		CONSTRAINT [PK_Products]
		PRIMARY KEY
		CLUSTERED
		([ProductID])
	ON [PRIMARY]
) ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Products_UnitPrice]
	CHECK
	([UnitPrice] >= 0)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
CHECK CONSTRAINT [CK_Products_UnitPrice]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_ReorderLevel]
	CHECK
	([ReorderLevel] >= 0)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
CHECK CONSTRAINT [CK_ReorderLevel]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_UnitsInStock]
	CHECK
	([UnitsInStock] >= 0)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
CHECK CONSTRAINT [CK_UnitsInStock]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_UnitsOnOrder]
	CHECK
	([UnitsOnOrder] >= 0)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
CHECK CONSTRAINT [CK_UnitsOnOrder]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	ADD
	CONSTRAINT [DF_Products_UnitPrice]
	DEFAULT (0) FOR [UnitPrice]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	ADD
	CONSTRAINT [DF_Products_UnitsInStock]
	DEFAULT (0) FOR [UnitsInStock]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	ADD
	CONSTRAINT [DF_Products_UnitsOnOrder]
	DEFAULT (0) FOR [UnitsOnOrder]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	ADD
	CONSTRAINT [DF_Products_ReorderLevel]
	DEFAULT (0) FOR [ReorderLevel]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	ADD
	CONSTRAINT [DF_Products_Discontinued]
	DEFAULT (0) FOR [Discontinued]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [CategoriesProducts]
	ON [dbo].[Products] ([CategoryID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [CategoryID]
	ON [dbo].[Products] ([CategoryID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [ProductName]
	ON [dbo].[Products] ([ProductName])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [SupplierID]
	ON [dbo].[Products] ([SupplierID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [SuppliersProducts]
	ON [dbo].[Products] ([SupplierID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Products_Categories]
	FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID])
ALTER TABLE [dbo].[Products]
	CHECK CONSTRAINT [FK_Products_Categories]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Products]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Products_Suppliers]
	FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
ALTER TABLE [dbo].[Products]
	CHECK CONSTRAINT [FK_Products_Suppliers]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
