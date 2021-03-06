USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblDesignations]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDesignations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblDesignations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblDesignations] ON 

INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (1, N'A')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (2, N'B')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (3, N'C')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (4, N'D')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (5, N'E')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (6, N'F')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (7, N'G')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (8, N'H')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (9, N'I')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (10, N'J')
INSERT [dbo].[tblDesignations] ([Id], [Name]) VALUES (11, N'K')
SET IDENTITY_INSERT [dbo].[tblDesignations] OFF
