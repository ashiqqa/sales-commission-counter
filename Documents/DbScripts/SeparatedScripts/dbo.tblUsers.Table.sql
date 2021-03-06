USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserType] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (1, N'E-001', N'E-001', 1, N'E-001')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (2, N'E-002', N'E-002', 4, N'E-002')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (3, N'E-003', N'E-003', 4, N'E-003')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (4, N'E-004', N'E-004', 4, N'E-004')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (5, N'AL-001', N'AL-001', 2, N'AL-001')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (6, N'B-001', N'B-001', 3, N'B-001')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
