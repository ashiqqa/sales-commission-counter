USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblSalaries]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalaries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[SalesCommission] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Commission_Sales]  DEFAULT ((0)),
	[OrdinalCommission] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Commission_Ordinal]  DEFAULT ((0)),
	[InboundCommission] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Commission_Inbound]  DEFAULT ((0)),
	[OutboundCommission] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Commission_Outbound]  DEFAULT ((0)),
	[GbCommission] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Commission_Gb]  DEFAULT ((0)),
	[ProcessedMonth] [varchar](6) NOT NULL CONSTRAINT [DF_tblCommission_Month]  DEFAULT (CONVERT([varchar](6),getdate(),(112))),
 CONSTRAINT [PK_Commission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblSalaries] ON 

INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (125, N'E-001', CAST(3834 AS Decimal(18, 0)), CAST(2880 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1292 AS Decimal(18, 0)), N'202009')
INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (126, N'E-002', CAST(2320 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(478 AS Decimal(18, 0)), N'202009')
INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (127, N'E-003', CAST(750 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'202009')
INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (128, N'E-004', CAST(480 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), CAST(160 AS Decimal(18, 0)), N'202009')
SET IDENTITY_INSERT [dbo].[tblSalaries] OFF
