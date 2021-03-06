USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblSalesman]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalesman](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](6) NOT NULL,
	[Name] [varchar](100) NULL,
	[ReferenceCode] [nvarchar](6) NULL,
	[JoiningDate] [datetime] NULL,
	[Designation] [int] NOT NULL CONSTRAINT [DF_tblSalesman_DesignationId]  DEFAULT ((1)),
	[IsAlphaMember] [bit] NOT NULL CONSTRAINT [DF_tblSalesman_IsAlphaMember]  DEFAULT ((0)),
	[IsBetaMember] [bit] NOT NULL CONSTRAINT [DF_tblSalesman_IsBetaMember]  DEFAULT ((0)),
	[ThanaId] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[ContactNo] [nvarchar](15) NULL,
 CONSTRAINT [PK_tblSalesman] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblSalesman] ON 

INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (1, N'E-001', N'AITS Ltd', N'', CAST(N'2020-09-25 00:00:00.000' AS DateTime), 1, 0, 0, 1024, N'aits@gmail.com', N'Dhaka', N'01856426575')
INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (2, N'E-002', N'Md Ashiqur Rahman', N'E-001', CAST(N'2020-09-01 00:00:00.000' AS DateTime), 2, 0, 0, 1024, N'ashiq.mail.net@gmail.com', N'Dhaka', N'01862460421')
INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (3, N'E-003', N'Mr Kamal', N'E-002', CAST(N'2020-09-26 00:00:00.000' AS DateTime), 1, 1, 0, 1024, N'kamal@gmail.com', N'Mipur', N'01598746254')
INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (4, N'E-004', N'Mr Jamal', N'E-002', CAST(N'2020-09-25 00:00:00.000' AS DateTime), 1, 0, 1, 901, N'jamal@gmail.com', N'Maijdee', N'0154789654')
SET IDENTITY_INSERT [dbo].[tblSalesman] OFF
ALTER TABLE [dbo].[tblSalesman]  WITH CHECK ADD  CONSTRAINT [FK_tblSalesman_tblSalesman] FOREIGN KEY([Code])
REFERENCES [dbo].[tblSalesman] ([Code])
GO
ALTER TABLE [dbo].[tblSalesman] CHECK CONSTRAINT [FK_tblSalesman_tblSalesman]
GO
ALTER TABLE [dbo].[tblSalesman]  WITH CHECK ADD  CONSTRAINT [FK_tblSalesman_tblThana] FOREIGN KEY([ThanaId])
REFERENCES [dbo].[tblThana] ([Id])
GO
ALTER TABLE [dbo].[tblSalesman] CHECK CONSTRAINT [FK_tblSalesman_tblThana]
GO
/****** Object:  Trigger [dbo].[tr_tblSalesmanForInsert]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_tblSalesmanForInsert]
ON [dbo].[tblSalesman] FOR INSERT
AS BEGIN
DECLARE @Code VARCHAR(10)
DECLARE @RefCode VARCHAR(10)
SELECT @RefCode = ReferenceCode FROM inserted
SELECT @Code = Code FROM inserted
DECLARE @UserType INT = CASE WHEN (@RefCode IS NULL OR @RefCode='') THEN 1 ELSE 4 END

INSERT INTO tblUsers (Name,Password,UserType, Code)
VALUES (@Code,@Code,@UserType,@Code)
END

GO
