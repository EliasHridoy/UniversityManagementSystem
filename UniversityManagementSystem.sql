USE [master]
GO
/****** Object:  Database [DotBooster_UniversityManagementSystemDB]    Script Date: 9/18/2018 1:37:31 AM ******/
CREATE DATABASE [DotBooster_UniversityManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DotBooster_UniversityManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DotBooster_UniversityManagementSystemDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DotBooster_UniversityManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DotBooster_UniversityManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DotBooster_UniversityManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DotBooster_UniversityManagementSystemDB]
GO
/****** Object:  Table [dbo].[AllocateClassroomTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateClassroomTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[ToTime] [time](7) NOT NULL,
 CONSTRAINT [PK_AllocateClassroomTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassRoomTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassRoomTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClassRoomTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseToTeacher]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseToTeacher](
	[ID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[RemainingCredit] [numeric](4, 2) NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_CourseToTeacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DayTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Day] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DayTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DepartmentTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartmentTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_DepartmentTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DesignationTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DesignationTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DesignationTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourseTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourseTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentRegNo] [varchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_EnrollCourseTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeLetterTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeLetterTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetter] [varchar](10) NOT NULL,
 CONSTRAINT [PK_GradeLetterTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegisterStudentTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisterStudentTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_RegisterStudentTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SaveCoursesTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaveCoursesTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NULL,
	[Name] [varchar](50) NULL,
	[Credit] [numeric](2, 1) NULL,
	[Description] [varchar](50) NOT NULL,
	[DepartmentID] [int] NULL,
	[SemesterID] [int] NULL,
 CONSTRAINT [PK_SaveCoursesTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SemesterTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SemesterTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Semester] [varchar](10) NULL,
 CONSTRAINT [PK_SemesterTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResultTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResultTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeLetter] [varchar](10) NOT NULL,
 CONSTRAINT [PK_StudentResultTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherTable]    Script Date: 9/18/2018 1:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [int] NOT NULL,
	[DesignationID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[CreditToTaken] [numeric](4, 2) NOT NULL,
 CONSTRAINT [PK_TeacherTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ClassRoomTable] ON 

INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (1, N'AB4-201')
INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (2, N'AB4-202')
INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (3, N'AB4-Lab1')
INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (4, N'AB4-Lab2')
SET IDENTITY_INSERT [dbo].[ClassRoomTable] OFF
SET IDENTITY_INSERT [dbo].[DayTable] ON 

INSERT [dbo].[DayTable] ([Id], [Day]) VALUES (1, N'Saturday')
INSERT [dbo].[DayTable] ([Id], [Day]) VALUES (2, N'Sunday')
INSERT [dbo].[DayTable] ([Id], [Day]) VALUES (3, N'Monday')
INSERT [dbo].[DayTable] ([Id], [Day]) VALUES (4, N'Tuesday')
INSERT [dbo].[DayTable] ([Id], [Day]) VALUES (5, N'Wednesday')
INSERT [dbo].[DayTable] ([Id], [Day]) VALUES (6, N'Thursday')
INSERT [dbo].[DayTable] ([Id], [Day]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[DayTable] OFF
SET IDENTITY_INSERT [dbo].[DepartmentTable] ON 

INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (1, N'CSE-2401', N'Algorithm')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (2, N'CSE-2402', N'Data Structure')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (3, N'CSE-2402', N'Data Structure')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (4, N'CSE-2403', N'Pulse')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (5, N'CSE-2404', N'DLD')
SET IDENTITY_INSERT [dbo].[DepartmentTable] OFF
SET IDENTITY_INSERT [dbo].[DesignationTable] ON 

INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (1, N'Lecturer')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (2, N'Assistant Professor')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (3, N'Associate Professor')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (4, N'Professor')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (5, N'Deen')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (6, N'Vice Chancellor')
SET IDENTITY_INSERT [dbo].[DesignationTable] OFF
SET IDENTITY_INSERT [dbo].[GradeLetterTable] ON 

INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (1, N'A+')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (2, N'A')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (3, N'A-')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (4, N'B+')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (5, N'B')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (6, N'B-')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (7, N'C+')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (8, N'C')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (9, N'D')
INSERT [dbo].[GradeLetterTable] ([Id], [GradeLetter]) VALUES (10, N'F')
SET IDENTITY_INSERT [dbo].[GradeLetterTable] OFF
SET IDENTITY_INSERT [dbo].[SaveCoursesTable] ON 

INSERT [dbo].[SaveCoursesTable] ([ID], [Code], [Name], [Credit], [Description], [DepartmentID], [SemesterID]) VALUES (1, N'CSE-2305', N'Java', CAST(3.0 AS Numeric(2, 1)), N'OOP II', 1, 4)
INSERT [dbo].[SaveCoursesTable] ([ID], [Code], [Name], [Credit], [Description], [DepartmentID], [SemesterID]) VALUES (2, N'CSE-2305', N'Java', CAST(3.0 AS Numeric(2, 1)), N'OOP II', 1, 4)
SET IDENTITY_INSERT [dbo].[SaveCoursesTable] OFF
SET IDENTITY_INSERT [dbo].[SemesterTable] ON 

INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (1, N'1st')
INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (2, N'2nd')
INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (3, N'3rd')
INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (4, N'4th')
INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (5, N'5th')
INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (6, N'6th')
INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (7, N'7th')
INSERT [dbo].[SemesterTable] ([ID], [Semester]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[SemesterTable] OFF
SET IDENTITY_INSERT [dbo].[TeacherTable] ON 

INSERT [dbo].[TeacherTable] ([ID], [Name], [Address], [Email], [ContactNo], [DesignationID], [DepartmentID], [CreditToTaken]) VALUES (1, N'Elias Hridoy', N'CTG', N'hridoyhearth135@gmail.com', 1815593582, 5, 4, CAST(25.00 AS Numeric(4, 2)))
SET IDENTITY_INSERT [dbo].[TeacherTable] OFF
ALTER TABLE [dbo].[TeacherTable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTable_DepartmentTable] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DepartmentTable] ([ID])
GO
ALTER TABLE [dbo].[TeacherTable] CHECK CONSTRAINT [FK_TeacherTable_DepartmentTable]
GO
ALTER TABLE [dbo].[TeacherTable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTable_DesignationTable] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[DesignationTable] ([ID])
GO
ALTER TABLE [dbo].[TeacherTable] CHECK CONSTRAINT [FK_TeacherTable_DesignationTable]
GO
USE [master]
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET  READ_WRITE 
GO
