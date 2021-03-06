USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblMembers]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMembers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](6) NOT NULL,
	[Name] [varchar](50) NULL,
	[MemberType] [int] NOT NULL,
	[ThanaId] [int] NOT NULL,
	[Sidc] [nvarchar](6) NOT NULL CONSTRAINT [DF_tblMembers_IsApproved]  DEFAULT ((0)),
	[Address] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](15) NOT NULL,
	[JoiningDate] [datetime] NULL CONSTRAINT [DF_tblMembers_JoiningDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblMembers] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblMembers] ON 

INSERT [dbo].[tblMembers] ([Id], [Code], [Name], [MemberType], [ThanaId], [Sidc], [Address], [Email], [ContactNo], [JoiningDate]) VALUES (1, N'AL-001', N'Alpha Member 01', 2, 1024, N'E-003', N'Banglamotor', N'alpha@gmail.com', N'0178965478', CAST(N'2020-09-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblMembers] ([Id], [Code], [Name], [MemberType], [ThanaId], [Sidc], [Address], [Email], [ContactNo], [JoiningDate]) VALUES (2, N'B-001', N'Beta Member', 3, 1024, N'E-004', N'Hatirpul', N'beta@gmail.com', N'01478654874', CAST(N'2020-09-30 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblMembers] OFF
ALTER TABLE [dbo].[tblMembers]  WITH CHECK ADD  CONSTRAINT [FK_tblMembers_tblThana] FOREIGN KEY([ThanaId])
REFERENCES [dbo].[tblThana] ([Id])
GO
ALTER TABLE [dbo].[tblMembers] CHECK CONSTRAINT [FK_tblMembers_tblThana]
GO
/****** Object:  Trigger [dbo].[tr_tblMembersForInsert]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_tblMembersForInsert]
ON [dbo].[tblMembers] FOR INSERT
AS BEGIN
DECLARE @Code VARCHAR(10),@MemberType INT, @Sidc VARCHAR(6)

SELECT @Code = Code, @MemberType=MemberType, @Sidc = Sidc FROM inserted
INSERT INTO tblUsers (Name,Password,UserType, Code)
VALUES (@Code,@Code,@MemberType,@Code)
IF @MemberType=2
	BEGIN UPDATE tblSalesman SET IsAlphaMember=1 WHERE Code=@Sidc END
IF @MemberType=3
	BEGIN UPDATE tblSalesman SET IsBetaMember=1 WHERE Code=@Sidc END
END

GO
