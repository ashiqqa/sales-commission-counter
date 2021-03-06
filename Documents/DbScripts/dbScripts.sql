USE [master]
GO
/****** Object:  Database [SalePurchaseAccountantDb]    Script Date: 9/30/2020 11:57:17 PM ******/
CREATE DATABASE [SalePurchaseAccountantDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalePurchaseAccountantDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SalePurchaseAccountantDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SalePurchaseAccountantDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SalePurchaseAccountantDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalePurchaseAccountantDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET RECOVERY FULL 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET  MULTI_USER 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalePurchaseAccountantDb', N'ON'
GO
USE [SalePurchaseAccountantDb]
GO
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 9/30/2020 11:57:17 PM ******/
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
/****** Object:  Table [dbo].[tblDesignations]    Script Date: 9/30/2020 11:57:17 PM ******/
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
/****** Object:  Table [dbo].[tblDistricts]    Script Date: 9/30/2020 11:57:17 PM ******/
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
/****** Object:  Table [dbo].[tblMembers]    Script Date: 9/30/2020 11:57:17 PM ******/
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
/****** Object:  Table [dbo].[tblSalaries]    Script Date: 9/30/2020 11:57:17 PM ******/
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
/****** Object:  Table [dbo].[tblSalesman]    Script Date: 9/30/2020 11:57:17 PM ******/
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
/****** Object:  Table [dbo].[tblThana]    Script Date: 9/30/2020 11:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblThana](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DistrictId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 9/30/2020 11:57:17 PM ******/
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
SET IDENTITY_INSERT [dbo].[tblMembers] ON 

INSERT [dbo].[tblMembers] ([Id], [Code], [Name], [MemberType], [ThanaId], [Sidc], [Address], [Email], [ContactNo], [JoiningDate]) VALUES (1, N'AL-001', N'Alpha Member 01', 2, 1024, N'E-003', N'Banglamotor', N'alpha@gmail.com', N'0178965478', CAST(N'2020-09-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblMembers] ([Id], [Code], [Name], [MemberType], [ThanaId], [Sidc], [Address], [Email], [ContactNo], [JoiningDate]) VALUES (2, N'B-001', N'Beta Member', 3, 1024, N'E-004', N'Hatirpul', N'beta@gmail.com', N'01478654874', CAST(N'2020-09-30 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblMembers] OFF
SET IDENTITY_INSERT [dbo].[tblSalaries] ON 

INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (125, N'E-001', CAST(3834 AS Decimal(18, 0)), CAST(2880 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1292 AS Decimal(18, 0)), N'202009')
INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (126, N'E-002', CAST(2320 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(478 AS Decimal(18, 0)), N'202009')
INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (127, N'E-003', CAST(750 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'202009')
INSERT [dbo].[tblSalaries] ([Id], [Code], [SalesCommission], [OrdinalCommission], [InboundCommission], [OutboundCommission], [GbCommission], [ProcessedMonth]) VALUES (128, N'E-004', CAST(480 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), CAST(160 AS Decimal(18, 0)), N'202009')
SET IDENTITY_INSERT [dbo].[tblSalaries] OFF
SET IDENTITY_INSERT [dbo].[tblSalesman] ON 

INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (1, N'E-001', N'AITS Ltd', N'', CAST(N'2020-09-25 00:00:00.000' AS DateTime), 1, 0, 0, 1024, N'aits@gmail.com', N'Dhaka', N'01856426575')
INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (2, N'E-002', N'Md Ashiqur Rahman', N'E-001', CAST(N'2020-09-01 00:00:00.000' AS DateTime), 2, 0, 0, 1024, N'ashiq.mail.net@gmail.com', N'Dhaka', N'01862460421')
INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (3, N'E-003', N'Mr Kamal', N'E-002', CAST(N'2020-09-26 00:00:00.000' AS DateTime), 1, 1, 0, 1024, N'kamal@gmail.com', N'Mipur', N'01598746254')
INSERT [dbo].[tblSalesman] ([Id], [Code], [Name], [ReferenceCode], [JoiningDate], [Designation], [IsAlphaMember], [IsBetaMember], [ThanaId], [Email], [Address], [ContactNo]) VALUES (4, N'E-004', N'Mr Jamal', N'E-002', CAST(N'2020-09-25 00:00:00.000' AS DateTime), 1, 0, 1, 901, N'jamal@gmail.com', N'Maijdee', N'0154789654')
SET IDENTITY_INSERT [dbo].[tblSalesman] OFF
SET IDENTITY_INSERT [dbo].[tblThana] ON 

INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (514, N'Dhamrai', 19)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (515, N'Dohar', 19)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (516, N'Keraniganj', 19)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (517, N'Nawabganj', 19)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (518, N'Savar', 19)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (519, N'Alfadanga', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (520, N'Bhanga', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (521, N'Boalmari', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (522, N'Charbhadrasan', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (523, N'Faridpur Sadar', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (524, N'Madhukhali', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (525, N'Nagarkanda', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (526, N'Sadarpur', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (527, N'Saltha', 20)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (528, N'Gazipur Sadar', 21)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (529, N'Kaliakair', 21)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (530, N'Kaliganj', 21)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (531, N'Kapasia', 21)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (532, N'Sreepur', 21)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (533, N'Gopalganj Sadar', 22)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (534, N'Kashiani', 22)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (535, N'Kotalipara', 22)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (536, N'Muksudpur', 22)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (537, N'Tungipara', 22)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (538, N'Baksiganj', 23)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (539, N'Dewanganj', 23)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (540, N'Islampur', 23)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (541, N'Jamalpur Sadar', 23)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (542, N'Madarganj', 23)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (543, N'Melandaha', 23)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (544, N'Sarishabari', 23)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (545, N'Astagram', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (546, N'Bajitpur', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (547, N'Bhairab', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (548, N'Hossainpur', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (549, N'Itna', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (550, N'Karimganj', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (551, N'Katiadi', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (552, N'Kishoreganj Sadar', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (553, N'Kuliarchar', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (554, N'Mithamain', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (555, N'Nikli', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (556, N'Pakundia', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (557, N'Tarail', 24)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (558, N'Rajoir', 25)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (559, N'Madaripur Sadar', 25)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (560, N'Kalkini', 25)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (561, N'Shibchar', 25)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (562, N'Daulatpur', 26)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (563, N'Ghior', 26)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (564, N'Harirampur', 26)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (565, N'Manikgonj Sadar', 26)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (566, N'Saturia', 26)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (567, N'Shivalaya', 26)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (568, N'Singair', 26)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (569, N'Gazaria', 27)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (570, N'Lohajang', 27)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (571, N'Munshiganj Sadar', 27)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (572, N'Sirajdikhan', 27)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (573, N'Sreenagar', 27)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (574, N'Tongibari', 27)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (575, N'Bhaluka', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (576, N'Dhobaura', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (577, N'Fulbaria', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (578, N'Gaffargaon', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (579, N'Gauripur', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (580, N'Haluaghat', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (581, N'Ishwarganj', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (582, N'Mymensingh Sadar', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (583, N'Muktagachha', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (584, N'Nandail', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (585, N'Phulpur', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (586, N'Trishal', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (587, N'Tara Khanda', 28)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (588, N'Araihazar', 29)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (589, N'Bandar', 29)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (590, N'Narayanganj Sadar', 29)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (591, N'Rupganj', 29)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (592, N'Sonargaon', 29)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (593, N'Fatullah', 29)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (594, N'Siddhirganj', 29)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (595, N'Atpara', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (596, N'Barhatta', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (597, N'Durgapur', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (598, N'Khaliajuri', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (599, N'Kalmakanda', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (600, N'Kendua', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (601, N'Madan', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (602, N'Mohanganj', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (603, N'Netrokona Sadar', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (604, N'Purbadhala', 31)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (605, N'Baliakandi', 32)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (606, N'Goalandaghat', 32)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (607, N'Pangsha', 32)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (608, N'Rajbari Sadar', 32)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (609, N'Kalukhali', 32)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (610, N'Bhedarganj', 33)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (611, N'Damudya', 33)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (612, N'Gosairhat', 33)
GO
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (613, N'Naria', 33)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (614, N'Shariatpur Sadar', 33)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (615, N'Zanjira', 33)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (616, N'Shakhipur', 33)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (617, N'Jhenaigati', 34)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (618, N'Nakla', 34)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (619, N'Nalitabari', 34)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (620, N'Sherpur Sadar', 34)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (621, N'Sreebardi', 34)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (622, N'Gopalpur', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (623, N'Basail', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (624, N'Bhuapur', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (625, N'Delduar', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (626, N'Ghatail', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (627, N'Kalihati', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (628, N'Madhupur', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (629, N'Mirzapur', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (630, N'Nagarpur', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (631, N'Sakhipur', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (632, N'Dhanbari', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (633, N'Tangail Sadar', 35)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (634, N'Narsingdi Sadar', 30)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (635, N'Belabo', 30)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (636, N'Monohardi', 30)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (637, N'Palash', 30)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (638, N'Raipura', 30)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (639, N'Shibpur', 30)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (640, N'Adamdighi', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (641, N'Bogra Sadar', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (642, N'Dhunat', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (643, N'Dhupchanchia', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (644, N'Gabtali', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (645, N'Kahaloo', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (646, N'Nandigram', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (647, N'Sariakandi', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (648, N'Sahajanpur', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (649, N'Sherpur', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (650, N'Shibganj', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (651, N'Sonatola', 46)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (652, N'Akkelpur', 47)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (653, N'Joypurhat Sadar', 47)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (654, N'Kalai', 47)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (655, N'Khetlal', 47)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (656, N'Panchbibi', 47)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (657, N'Atrai', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (658, N'Badalgachhi', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (659, N'Manda', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (660, N'Dhamoirhat', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (661, N'Mohadevpur', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (662, N'Naogaon Sadar', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (663, N'Niamatpur', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (664, N'Patnitala', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (665, N'Porsha', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (666, N'Raninagar', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (667, N'Sapahar', 48)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (668, N'Bagatipara', 49)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (669, N'Baraigram', 49)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (670, N'Gurudaspur', 49)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (671, N'Lalpur', 49)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (672, N'Natore Sadar', 49)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (673, N'Singra', 49)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (674, N'Naldanga', 49)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (675, N'Bholahat', 50)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (676, N'Gomastapur', 50)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (677, N'Nachole', 50)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (678, N'Nawabganj Sadar', 50)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (679, N'Shibganj', 50)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (680, N'Ataikula', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (681, N'Atgharia', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (682, N'Bera', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (683, N'Bhangura', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (684, N'Chatmohar', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (685, N'Faridpur', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (686, N'Ishwardi', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (687, N'Pabna Sadar', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (688, N'Santhia', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (689, N'Sujanagar', 51)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (690, N'Bagha', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (691, N'Bagmara', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (692, N'Charghat', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (693, N'Durgapur', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (694, N'Godagari', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (695, N'Mohanpur', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (696, N'Paba', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (697, N'Puthia', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (698, N'Tanore', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (699, N'Boalia Thana', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (700, N'Matihar Thana', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (701, N'Rajpara Thana', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (702, N'Shah Mokdum Thana', 52)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (703, N'Belkuchi', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (704, N'Chauhali', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (705, N'Kamarkhanda', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (706, N'Kazipur', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (707, N'Raiganj', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (708, N'Shahjadpur', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (709, N'Sirajganj Sadar', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (710, N'Tarash', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (711, N'Ullahpara', 53)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (712, N'Birampur', 54)
GO
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (713, N'Birganj', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (714, N'Biral', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (715, N'Bochaganj', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (716, N'Chirirbandar', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (717, N'Phulbari', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (718, N'Ghoraghat', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (719, N'Hakimpur', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (720, N'Kaharole', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (721, N'Khansama', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (722, N'Dinajpur Sadar', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (723, N'Nawabganj', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (724, N'Parbatipur', 54)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (725, N'Phulchhari', 55)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (726, N'Gaibandha Sadar', 55)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (727, N'Gobindaganj', 55)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (728, N'Palashbari', 55)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (729, N'Sadullapur', 55)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (730, N'Sughatta', 55)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (731, N'Sundarganj', 55)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (732, N'Bhurungamari', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (733, N'Char Rajibpur', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (734, N'Chilmari', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (735, N'Phulbari', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (736, N'Kurigram Sadar', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (737, N'Nageshwari', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (738, N'Rajarhat', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (739, N'Raomari', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (740, N'Ulipur', 56)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (741, N'Aditmari', 57)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (742, N'Hatibandha', 57)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (743, N'Kaliganj', 57)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (744, N'Lalmonirhat Sadar', 57)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (745, N'Patgram', 57)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (746, N'Dimla', 58)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (747, N'Domar', 58)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (748, N'Jaldhaka', 58)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (749, N'Kishoreganj', 58)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (750, N'Nilphamari Sadar', 58)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (751, N'Saidpur', 58)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (752, N'Atwari', 59)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (753, N'Boda', 59)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (754, N'Debiganj', 59)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (755, N'Panchagarh Sadar', 59)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (756, N'Tetulia', 59)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (757, N'Badarganj', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (758, N'Gangachhara', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (759, N'Kaunia', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (760, N'Rangpur Sadar', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (761, N'Mithapukur', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (762, N'Pirgachha', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (763, N'Pirganj', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (764, N'Taraganj', 60)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (765, N'Baliadangi', 61)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (766, N'Haripur', 61)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (767, N'Pirganj', 61)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (768, N'Ranisankail', 61)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (769, N'Thakurgaon Sadar', 61)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (770, N'Amtali', 2)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (771, N'Bamna', 2)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (772, N'Barguna Sadar', 2)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (773, N'Betagi', 2)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (774, N'Patharghata', 2)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (775, N'Taltoli', 2)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (776, N'Agailjhara', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (777, N'Babuganj', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (778, N'Bakerganj', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (779, N'Banaripara', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (780, N'Gaurnadi', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (781, N'Hizla', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (782, N'Barisal Sadar', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (783, N'Mehendiganj', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (784, N'Muladi', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (785, N'Wazirpur', 3)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (786, N'Bhola Sadar', 4)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (787, N'Burhanuddin', 4)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (788, N'Char Fasson', 4)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (789, N'Daulatkhan', 4)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (790, N'Lalmohan', 4)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (791, N'Manpura', 4)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (792, N'Tazumuddin', 4)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (793, N'Jhalokati Sadar', 5)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (794, N'Kathalia', 5)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (795, N'Nalchity', 5)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (796, N'Rajapur', 5)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (797, N'Bauphal', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (798, N'Dashmina', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (799, N'Galachipa', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (800, N'Kalapara', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (801, N'Mirzaganj', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (802, N'Patuakhali Sadar', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (803, N'Rangabali', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (804, N'Dumki', 6)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (805, N'Bhandaria', 7)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (806, N'Kawkhali', 7)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (807, N'Mathbaria', 7)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (808, N'Nazirpur', 7)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (809, N'Pirojpur Sadar', 7)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (810, N'Nesarabad (Swarupkati)', 7)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (811, N'Zianagor', 7)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (812, N'Chittagong Division', 7)
GO
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (813, N'Ali Kadam', 8)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (814, N'Bandarban Sadar', 8)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (815, N'Lama', 8)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (816, N'Naikhongchhari', 8)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (817, N'Rowangchhari', 8)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (818, N'Ruma', 8)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (819, N'Thanchi', 8)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (820, N'Akhaura', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (821, N'Bancharampur', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (822, N'Brahmanbaria Sadar', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (823, N'Kasba', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (824, N'Nabinagar', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (825, N'Nasirnagar', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (826, N'Sarail', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (827, N'Ashuganj', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (828, N'Bijoynagar', 9)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (829, N'Chandpur Sadar', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (830, N'Faridganj', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (831, N'Haimchar', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (832, N'Haziganj', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (833, N'Kachua', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (834, N'Matlab Dakshin', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (835, N'Matlab Uttar', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (836, N'Shahrasti', 10)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (837, N'Anwara', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (838, N'Banshkhali', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (839, N'Boalkhali', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (840, N'Chandanaish', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (841, N'Fatikchhari', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (842, N'Hathazari', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (843, N'Lohagara', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (844, N'Mirsharai', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (845, N'Patiya', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (846, N'Rangunia', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (847, N'Raozan', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (848, N'Sandwip', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (849, N'Satkania', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (850, N'Sitakunda', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (851, N'Bandor (Chittagong Port) Thana', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (852, N'Chandgaon Thana', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (853, N'Double Mooring Thana', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (854, N'Kotwali Thana', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (855, N'Pahartali Thana', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (856, N'Panchlaish Thana', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (857, N'Barura', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (858, N'Brahmanpara', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (859, N'Burichang', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (860, N'Chandina', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (861, N'Chauddagram', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (862, N'Daudkandi', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (863, N'Debidwar', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (864, N'Homna', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (865, N'Laksam', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (866, N'Muradnagar', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (867, N'Nangalkot', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (868, N'Comilla Sadar', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (869, N'Meghna', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (870, N'Titas', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (871, N'Monohargonj', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (872, N'Sadar South', 12)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (873, N'Chakaria', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (874, N'Cox''s Bazar Sadar', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (875, N'Kutubdia', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (876, N'Maheshkhali', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (877, N'Ramu', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (878, N'Teknaf', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (879, N'Ukhia', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (880, N'Pekua', 13)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (881, N'Chhagalnaiya', 14)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (882, N'Daganbhuiyan', 14)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (883, N'Feni Sadar', 14)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (884, N'Parshuram', 14)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (885, N'Sonagazi', 14)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (886, N'Fulgazi', 14)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (887, N'Dighinala', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (888, N'Khagrachhari', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (889, N'Lakshmichhari', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (890, N'Mahalchhari', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (891, N'Manikchhari', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (892, N'Matiranga', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (893, N'Panchhari', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (894, N'Ramgarh', 15)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (895, N'Lakshmipur Sadar', 16)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (896, N'Raipur', 16)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (897, N'Ramganj', 16)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (898, N'Ramgati', 16)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (899, N'Komolnagar', 16)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (900, N'Begumganj', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (901, N'Noakhali Sadar', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (902, N'Chatkhil', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (903, N'Companiganj', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (904, N'Hatiya', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (905, N'Senbagh', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (906, N'Sonaimuri', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (907, N'Subarnachar', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (908, N'Kabirhat', 17)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (909, N'Bagaichhari', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (910, N'Barkal', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (911, N'Kawkhali (Betbunia)', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (912, N'Belaichhari', 18)
GO
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (913, N'Kaptai', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (914, N'Juraichhari', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (915, N'Langadu', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (916, N'Naniyachar', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (917, N'Rajasthali', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (918, N'Rangamati Sadar', 18)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (919, N'Ajmiriganj', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (920, N'Bahubal', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (921, N'Baniyachong', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (922, N'Chunarughat', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (923, N'Habiganj Sadar', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (924, N'Lakhai', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (925, N'Madhabpur', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (926, N'Nabiganj', 62)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (927, N'Barlekha', 63)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (928, N'Kamalganj', 63)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (929, N'Kulaura', 63)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (930, N'Moulvibazar Sadar', 63)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (931, N'Rajnagar', 63)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (932, N'Sreemangal', 63)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (933, N'Juri', 63)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (934, N'Bishwamvarpur', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (935, N'Chhatak', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (936, N'Derai', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (937, N'Dharampasha', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (938, N'Dowarabazar', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (939, N'Jagannathpur', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (940, N'Jamalganj', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (941, N'Sullah', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (942, N'Sunamganj Sadar', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (943, N'Tahirpur', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (944, N'South Sunamganj', 64)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (945, N'Balaganj', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (946, N'Beanibazar', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (947, N'Bishwanath', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (948, N'Companigonj', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (949, N'Fenchuganj', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (950, N'Golapganj', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (951, N'Gowainghat', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (952, N'Jaintiapur', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (953, N'Kanaighat', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (954, N'Sylhet Sadar', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (955, N'Zakiganj', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (956, N'South Shurma', 65)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (957, N'Bagerhat Sadar', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (958, N'Chitalmari', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (959, N'Fakirhat', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (960, N'Kachua', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (961, N'Mollahat', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (962, N'Mongla', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (963, N'Morrelganj', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (964, N'Rampal', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (965, N'Sarankhola', 36)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (966, N'Alamdanga', 37)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (967, N'Chuadanga Sadar', 37)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (968, N'Damurhuda', 37)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (969, N'Jibannagar', 37)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (970, N'Abhaynagar', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (971, N'Bagherpara', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (972, N'Chaugachha', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (973, N'Jhikargachha', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (974, N'Keshabpur', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (975, N'Jessore Sadar', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (976, N'Manirampur', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (977, N'Sharsha', 38)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (978, N'Harinakunda', 39)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (979, N'Jhenaidah Sadar', 39)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (980, N'Kaliganj', 39)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (981, N'Kotchandpur', 39)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (982, N'Maheshpur', 39)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (983, N'Shailkupa', 39)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (984, N'Batiaghata', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (985, N'Dacope', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (986, N'Dumuria', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (987, N'Dighalia', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (988, N'Koyra', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (989, N'Paikgachha', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (990, N'Phultala', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (991, N'Rupsha', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (992, N'Terokhada', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (993, N'Daulatpur Thana', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (994, N'Khalishpur Thana', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (995, N'Khan Jahan Ali Thana', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (996, N'Kotwali Thana', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (997, N'Sonadanga Thana', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (998, N'Harintana Thana', 40)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (999, N'Bheramara', 41)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1000, N'Daulatpur', 41)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1001, N'Khoksa', 41)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1002, N'Kumarkhali', 41)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1003, N'Kushtia Sadar', 41)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1004, N'Mirpur', 41)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1005, N'Shekhpara', 41)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1006, N'Magura Sadar', 42)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1007, N'Mohammadpur', 42)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1008, N'Shalikha', 42)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1009, N'Sreepur', 42)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1010, N'Gangni', 43)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1011, N'Meherpur Sadar', 43)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1012, N'Mujibnagar', 43)
GO
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1013, N'Kalia', 44)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1014, N'Lohagara', 44)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1015, N'Narail Sadar', 44)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1016, N'Naragati Thana', 44)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1017, N'Assasuni', 45)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1018, N'Debhata', 45)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1019, N'Kalaroa', 45)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1020, N'Kaliganj', 45)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1021, N'Satkhira Sadar', 45)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1022, N'Shyamnagar', 45)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1023, N'Tala', 45)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1024, N'Dhaka City Corporation', 19)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1025, N'Chattagong City Corporation', 11)
INSERT [dbo].[tblThana] ([Id], [Name], [DistrictId]) VALUES (1026, N'Sylhet City Corporation', 65)
SET IDENTITY_INSERT [dbo].[tblThana] OFF
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (1, N'E-001', N'E-001', 1, N'E-001')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (2, N'E-002', N'E-002', 4, N'E-002')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (3, N'E-003', N'E-003', 4, N'E-003')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (4, N'E-004', N'E-004', 4, N'E-004')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (5, N'AL-001', N'AL-001', 2, N'AL-001')
INSERT [dbo].[tblUsers] ([Id], [Name], [Password], [UserType], [Code]) VALUES (6, N'B-001', N'B-001', 3, N'B-001')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
ALTER TABLE [dbo].[tblMembers]  WITH CHECK ADD  CONSTRAINT [FK_tblMembers_tblThana] FOREIGN KEY([ThanaId])
REFERENCES [dbo].[tblThana] ([Id])
GO
ALTER TABLE [dbo].[tblMembers] CHECK CONSTRAINT [FK_tblMembers_tblThana]
GO
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
ALTER TABLE [dbo].[tblThana]  WITH CHECK ADD  CONSTRAINT [FK_tblThana_tblDistricts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[tblDistricts] ([Id])
GO
ALTER TABLE [dbo].[tblThana] CHECK CONSTRAINT [FK_tblThana_tblDistricts]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateSalaryAcc]    Script Date: 9/30/2020 11:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CreateSalaryAcc] @SalaryMonth VARCHAR(6)
AS
BEGIN
DELETE tblSalaries WHERE ProcessedMonth = @SalaryMonth
INSERT INTO tblSalaries (Code, ProcessedMonth) 
SELECT Code, @SalaryMonth AS ProcessedMonth FROM tblSalesman
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSalary]    Script Date: 9/30/2020 11:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_GetSalary]
@ProcessedMonth VARCHAR(6),
@Code VARCHAR(6)
AS BEGIN
SELECT sm.Name, d.Name As Designation,s.Code, s.ProcessedMonth, s.SalesCommission, s.OrdinalCommission, 0 AS InboundCommission, 0 AS OutboundCommission
, s.GbCommission, (s.SalesCommission+s.OrdinalCommission+s.GbCommission) as Total  FROM tblSalaries s
JOIN tblSalesman sm ON sm.Code = s.Code
JOIN tblDesignations d ON d.Id = sm.Designation
 WHERE ProcessedMonth=@ProcessedMonth AND s.Code = CASE WHEN @Code IS NULL THEN s.Code ELSE @Code END

UNION
SELECT sm.Name, (CASE WHEN m.MemberType=2 THEN 'Alpha' ELSE 'Beta' END) AS Designation,m.Code, s.ProcessedMonth, 0 AS SalesCommission, 0 AS OrdinalCommission, s.InboundCommission, s.OutboundCommission
, 0 AS GbCommission, (s.InboundCommission+s.OutboundCommission) As Total FROM tblSalaries s
JOIN tblMembers m ON m.Sidc = s.Code
JOIN tblSalesman sm ON sm.Code = s.Code
WHERE ProcessedMonth=@ProcessedMonth AND s.Code = CASE WHEN @Code IS NULL THEN s.Code ELSE @Code END
END
GO
/****** Object:  Trigger [dbo].[tr_tblMembersForInsert]    Script Date: 9/30/2020 11:57:17 PM ******/
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
/****** Object:  Trigger [dbo].[tr_tblSalesmanForInsert]    Script Date: 9/30/2020 11:57:17 PM ******/
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
USE [master]
GO
ALTER DATABASE [SalePurchaseAccountantDb] SET  READ_WRITE 
GO
