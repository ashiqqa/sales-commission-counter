USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblDistricts]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDistricts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DivisionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblDistricts] ON 

INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (2, N'Barguna', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (3, N'Barisal', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (4, N'Bhola', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (5, N'Jhalokati', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (6, N'Patuakhali', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (7, N'Pirojpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (8, N'Bandarban', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (9, N'Brahmanbaria', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (10, N'Chandpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (11, N'Chittagong', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (12, N'Comilla', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (13, N'CoxsBazar', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (14, N'Feni', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (15, N'Khagrachari', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (16, N'Lakshmipur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (17, N'Noakhali', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (18, N'Rangamati', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (19, N'Dhaka', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (20, N'Faridpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (21, N'Gazipur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (22, N'Gopalganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (23, N'Jamalpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (24, N'Kishoreganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (25, N'Madaripur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (26, N'Manikganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (27, N'Munshiganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (28, N'Mymensingh', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (29, N'Narayanganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (30, N'Narsingdi', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (31, N'Netrokona', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (32, N'Rajbari', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (33, N'Shariatpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (34, N'Sherpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (35, N'Tangail', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (36, N'Bagerhat', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (37, N'Chuadanga', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (38, N'Jessore', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (39, N'Jhenaidah', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (40, N'Khulna', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (41, N'Kushtia', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (42, N'Magura', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (43, N'Meherpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (44, N'Narail', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (45, N'Satkhira', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (46, N'Bogra', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (47, N'Joypurhat', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (48, N'Naogaon', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (49, N'Natore', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (50, N'Nawabganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (51, N'Pabna', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (52, N'Rajshahi', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (53, N'Sirajganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (54, N'Dinajpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (55, N'Gaibandha', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (56, N'Kurigram', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (57, N'Lalmonirhat', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (58, N'Nilphamari', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (59, N'Panchagarh', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (60, N'Rangpur', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (61, N'Thakurgaon', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (62, N'Habiganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (63, N'Moulvibazar', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (64, N'Sunamganj', NULL)
INSERT [dbo].[tblDistricts] ([Id], [Name], [DivisionId]) VALUES (65, N'Sylhet', NULL)
SET IDENTITY_INSERT [dbo].[tblDistricts] OFF
