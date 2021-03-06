USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](6) NOT NULL,
	[OperationDate] [datetime] NOT NULL CONSTRAINT [DF_tblSalesmanAccounts_OperationDate]  DEFAULT (getdate()),
	[Amount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_tblSalesmanAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblAccounts] ON 

INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (1, N'E-002', CAST(N'2020-09-30 04:51:54.270' AS DateTime), CAST(3500 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (2, N'E-002', CAST(N'2020-09-30 04:52:25.390' AS DateTime), CAST(2100 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (3, N'E-002', CAST(N'2020-09-30 04:55:19.640' AS DateTime), CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (4, N'E-002', CAST(N'2020-09-30 04:58:18.453' AS DateTime), CAST(1100 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (5, N'E-002', CAST(N'2020-09-30 05:06:23.327' AS DateTime), CAST(-5000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (6, N'E-003', CAST(N'2020-09-30 05:06:23.327' AS DateTime), CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (7, N'E-002', CAST(N'2020-09-30 05:07:35.733' AS DateTime), CAST(-4000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (8, N'B-001', CAST(N'2020-09-30 05:07:35.733' AS DateTime), CAST(4000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (9, N'E-003', CAST(N'2020-09-30 10:36:21.267' AS DateTime), CAST(-8000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (10, N'E-003', CAST(N'2020-09-30 10:37:05.487' AS DateTime), CAST(4000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (11, N'E-002', CAST(N'2020-09-30 10:37:05.487' AS DateTime), CAST(-4000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (12, N'E-002', CAST(N'2020-09-30 10:40:38.590' AS DateTime), CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (13, N'E-002', CAST(N'2020-09-30 10:41:03.907' AS DateTime), CAST(-5000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (14, N'E-004', CAST(N'2020-09-30 10:41:03.907' AS DateTime), CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (15, N'E-004', CAST(N'2020-09-30 10:44:09.520' AS DateTime), CAST(-1000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (16, N'E-003', CAST(N'2020-09-30 10:44:09.520' AS DateTime), CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (17, N'E-004', CAST(N'2020-09-30 10:44:54.257' AS DateTime), CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[tblAccounts] ([Id], [Code], [OperationDate], [Amount]) VALUES (18, N'E-002', CAST(N'2020-09-30 10:44:54.257' AS DateTime), CAST(-3000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tblAccounts] OFF
