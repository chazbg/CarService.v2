USE [master]
GO
/****** Object:  Database [CarService]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
CREATE DATABASE [CarService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CarService.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CarService_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarService] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarService] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarService] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CarService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarService] SET RECOVERY FULL 
GO
ALTER DATABASE [CarService] SET  MULTI_USER 
GO
ALTER DATABASE [CarService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarService] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CarService]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistryNumber] [nvarchar](max) NOT NULL,
	[Brand] [nvarchar](max) NOT NULL,
	[Model] [nvarchar](max) NOT NULL,
	[Year] [int] NOT NULL,
	[FrameNumber] [int] NOT NULL,
	[EngineNumber] [int] NOT NULL,
	[Color] [nvarchar](max) NOT NULL,
	[EngineWorkVolume] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Owner] [nvarchar](max) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Employees_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairCards]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntryDate] [date] NOT NULL,
	[RepairFinishDate] [date] NULL,
	[EmployeeId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PartsPrice] [money] NOT NULL,
	[TotalPrice] [money] NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SparePartRepairCards]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SparePartRepairCards](
	[SparePart_Id] [int] NOT NULL,
	[RepairCard_Id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpareParts]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpareParts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartName] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Activated] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (1, N'UX1WSIRR', N'Opel', N'Astra', 2001, 252596, 184223, N'Blue', 350, N'Troubleshoot Anti-Theft System', N'Victor Cristal', 265403, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (2, N'HLO2IDI7', N'Mazda', N'717C', 1995, 343475, 286217, N'Red', 500, N'Engine Overheating', N'Gemma Bessie', 218468, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (3, N'DC9PCVBO', N'Peugeot', N'106', 1999, 291182, 210750, N'Green', 450, N' Coolant Leak', N'Demelza Charmaine', 893870, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (4, N'8KAXZTGI', N'Fiat', N'Uno', 2005, 425151, 327299, N'Black', 550, N'Car Won''t Start (Possible Causes & Quick Checks)', N'Wayland Ewart', 852887, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (5, N'QYLDCZ34', N'Opel', N'Agila', 2002, 453585, 295469, N'Yellow', 600, N'Engine Won''t Crank or Start', N'Katharina Eireann', 408691, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (6, N'2UCCXJYK', N'Mazda', N' 727C', 1997, 547847, 399185, N'Brown', 350, N'Engine Won''t Start, No Fuel (Bad Fuel Pump?)', N'Harry Finnegan', 366342, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (7, N'WK4XPWAB', N'Peugeot', N'307', 1998, 573631, 476151, N'Purple', 600, N'Engine Won''t Start, No Spark', N'Emely Shae', 328080, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (8, N'QTPCJJ8V', N'Fiat', N'Tipo', 1994, 602128, 537441, N'Cyan', 500, N'Engine Idles Rough or Misfires', N'Jeanna Santa', 649787, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (9, N'SIJ2Y6JM', N'Opel', N'Calibra', 2000, 656553, 573472, N'Magenta', 500, N'Engine Idle Surge ', N'Wenona Ornella', 290856, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (10, N'FH6IVUQ4', N'Mazda', N' 737C', 2007, 708391, 657682, N'White', 600, N'Engine Vacuum Leak', N'Elettra Ethelyn', 944766, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (11, N'DVBRPYBL', N'Peugeot', N'206', 2006, 709522, 682857, N'Red', 350, N'Warning Lights On', N'Catrin Lexa', 734451, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (12, N'44BHD1ID', N'Fiat', N'Bravo', 2003, 725365, 929261, N'Black', 450, N'Failed Emissions Test', N'Dahlia Alexander', 600644, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (13, N'1AITTTZP', N'Opel', N'Corsa', 2004, 842912, 927880, N'Yellow', 600, N'Smoke In Exhaust', N'Farran Moreen', 342636, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (14, N'Y62HLUI9', N'Mazda', N'757', 2008, 949550, 968532, N'Green', 500, N'Engine Noise', N'Flannery Adriano', 692305, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (15, N'UYTUXVPK', N'Peugeot', N'306', 2011, 898464, 961684, N'White', 450, N'Poor Fuel Economy', N'Giffard Maurice', 892354, 1)
INSERT [dbo].[Cars] ([Id], [RegistryNumber], [Brand], [Model], [Year], [FrameNumber], [EngineNumber], [Color], [EngineWorkVolume], [Description], [Owner], [PhoneNumber], [UserId]) VALUES (16, N'M4BM8J0D', N'Fiat', N'500', 2009, 999216, 984300, N'Blue', 350, N'Engine Stalls', N'Kole Carol', 416500, 1)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (1, N'N/A', N'N/A', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (2, N'Dian', N'Nikolov', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (3, N'Deyan', N'Hadjiev', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (4, N'Herman', N'Renn', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (5, N'Joni', N'Gama', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (6, N'Clyde', N'Hollowell', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (7, N'Maribel', N'Reiner', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (8, N'Vernon', N'Tauber', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (9, N'Shane', N'Mucci', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (10, N'Dan', N'Bellomy', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (11, N'Glen', N'Haworth', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (12, N'Daphne', N'Blocher', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (13, N'Ricardo', N'Freeberg', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (14, N'Dustin', N'Lebaron', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (15, N'Mollie', N'Telles', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (16, N'Pedro', N'Olguin', 1)
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [UserId]) VALUES (17, N'Cherie', N'Schlosser', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[RepairCards] ON 

INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (1, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 5, 1, N'Battery problems', 220.0000, 250.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (2, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 9, 6, N'Sensor problems', 320.0000, 400.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (3, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 8, 1, N'Broken dynamometer', 181.0000, 220.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (4, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 15, 4, N'Halogens not working', 192.0000, 200.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (5, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 8, 16, N'Stuck window', 270.0000, 300.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (6, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 7, 9, N'Ignition malfunction', 320.0000, 400.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (7, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 10, 6, N'Spark plug replacement', 181.0000, 200.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (8, CAST(0xBB360B00 AS Date), CAST(0xBB360B00 AS Date), 6, 3, N'Broken dynamometer', 310.0000, 1337.0000, 1)
INSERT [dbo].[RepairCards] ([Id], [EntryDate], [RepairFinishDate], [EmployeeId], [CarId], [Description], [PartsPrice], [TotalPrice], [UserId]) VALUES (9, CAST(0xBB360B00 AS Date), NULL, 16, 10, N'Stuck window', 241.0000, NULL, 1)
SET IDENTITY_INSERT [dbo].[RepairCards] OFF
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (4, 1)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (8, 1)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (9, 1)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (15, 1)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (5, 6)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (10, 2)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (13, 2)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (2, 5)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (17, 5)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (20, 5)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (13, 6)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (14, 6)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (18, 6)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (8, 7)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (11, 7)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (14, 7)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (1, 8)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (2, 8)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (3, 8)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (8, 8)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (2, 9)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (8, 9)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (9, 9)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (10, 9)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (11, 9)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (16, 2)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (8, 3)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (11, 3)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (14, 3)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (3, 1)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (6, 1)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (8, 4)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (9, 4)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (12, 4)
INSERT [dbo].[SparePartRepairCards] ([SparePart_Id], [RepairCard_Id]) VALUES (15, 4)
SET IDENTITY_INSERT [dbo].[SpareParts] ON 

INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (1, N'Alternator', 200.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (2, N'Window regulator', 50.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (3, N'Battery cable', 10.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (4, N'Battery control system', 15.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (5, N'Battery plate', 20.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (6, N'Battery tray', 25.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (7, N'Ammeter', 30.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (8, N'Dynamometer', 50.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (9, N'Fuel gauge', 50.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (10, N'Voltmeter', 60.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (11, N'Coil wire', 31.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (12, N'Distributor', 22.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (13, N'Ignition controller', 120.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (14, N'Spark plug', 100.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (15, N'Halogen', 70.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (16, N'Airbag sensor', 140.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (17, N'Anti-pinch sensor', 40.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (18, N'Coolant temperature sensor', 80.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (19, N'Starter', 40.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (20, N'Remote lock', 180.0000, 1, 1)
INSERT [dbo].[SpareParts] ([Id], [PartName], [Price], [Activated], [UserId]) VALUES (21, N'Transmission computer', 340.0000, 1, 1)
SET IDENTITY_INSERT [dbo].[SpareParts] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Activated]) VALUES (1, N'Admin', N'Dian', N'Nikolov', N'diannn@uni-sofia.bg', 1)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A16000C7D3E1 AS DateTime), NULL, 1, NULL, 0, N'AAuEt7SCp8Tqou2Gf8ofKelK4aCtTzcXsiSsSA85IHjUvNy7j36GfLnXZ6s4F7wIow==', CAST(0x0000A16000C7D3E1 AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Administrator')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
/****** Object:  Index [UQ__Cars__2EACDDF8A444530F]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
ALTER TABLE [dbo].[Cars] ADD UNIQUE NONCLUSTERED 
(
	[FrameNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Cars__6C93F027F20AD015]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
ALTER TABLE [dbo].[Cars] ADD UNIQUE NONCLUSTERED 
(
	[EngineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__RepairCa__3214EC06EAF1FB35]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
ALTER TABLE [dbo].[RepairCards] ADD UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__C9F284566CC0B2EE]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B61601DA3C95F]    Script Date: 9.2.2013 г. 17:31:29 ч. ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_UserProfile]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_UserProfile]
GO
ALTER TABLE [dbo].[RepairCards]  WITH CHECK ADD  CONSTRAINT [FK_RepairCards_Cars] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[RepairCards] CHECK CONSTRAINT [FK_RepairCards_Cars]
GO
ALTER TABLE [dbo].[RepairCards]  WITH CHECK ADD  CONSTRAINT [FK_RepairCards_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[RepairCards] CHECK CONSTRAINT [FK_RepairCards_Employees]
GO
ALTER TABLE [dbo].[RepairCards]  WITH CHECK ADD  CONSTRAINT [FK_RepairCards_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[RepairCards] CHECK CONSTRAINT [FK_RepairCards_UserProfile]
GO
ALTER TABLE [dbo].[SparePartRepairCards]  WITH CHECK ADD  CONSTRAINT [FK_SparePartsList_RepairCards] FOREIGN KEY([RepairCard_Id])
REFERENCES [dbo].[RepairCards] ([Id])
GO
ALTER TABLE [dbo].[SparePartRepairCards] CHECK CONSTRAINT [FK_SparePartsList_RepairCards]
GO
ALTER TABLE [dbo].[SparePartRepairCards]  WITH CHECK ADD  CONSTRAINT [FK_SparePartsList_SpareParts] FOREIGN KEY([SparePart_Id])
REFERENCES [dbo].[SpareParts] ([Id])
GO
ALTER TABLE [dbo].[SparePartRepairCards] CHECK CONSTRAINT [FK_SparePartsList_SpareParts]
GO
ALTER TABLE [dbo].[SpareParts]  WITH CHECK ADD  CONSTRAINT [FK_SpareParts_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[SpareParts] CHECK CONSTRAINT [FK_SpareParts_UserProfile]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [CK_Cars_Column] CHECK  (([Cars].[Year]>(1950) AND [Cars].[Year]<datepart(year,getdate())))
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [CK_Cars_Column]
GO
USE [master]
GO
ALTER DATABASE [CarService] SET  READ_WRITE 
GO
