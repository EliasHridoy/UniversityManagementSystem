USE [master]
GO
/****** Object:  Database [DotBooster_UniversityManagementSystemDB]    Script Date: 9/30/2018 10:57:02 AM ******/
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
/****** Object:  Table [dbo].[AllocateClassroomTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
	[FromTime] [time](4) NOT NULL,
	[ToTime] [time](7) NOT NULL,
	[Allocate] [int] NOT NULL,
 CONSTRAINT [PK_AllocateClassroomTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassRoomTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
/****** Object:  Table [dbo].[CourseToTeacher]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseToTeacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Assigned] [int] NOT NULL,
 CONSTRAINT [PK_CourseToTeacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
/****** Object:  Table [dbo].[DepartmentTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
/****** Object:  Table [dbo].[DesignationTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
/****** Object:  Table [dbo].[EnrollCourseTable]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourseTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Assigned] [int] NOT NULL,
 CONSTRAINT [PK_EnrollCourseTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GradeLetterTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
/****** Object:  Table [dbo].[RegisterStudentTable]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisterStudentTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [varchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[SaveCoursesTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
/****** Object:  Table [dbo].[SemesterTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
/****** Object:  Table [dbo].[StudentResultTable]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResultTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnrollCourseId] [int] NOT NULL,
	[GradeLetterId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResultTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherTable]    Script Date: 9/30/2018 10:57:03 AM ******/
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
	[RemainingCredit] [numeric](4, 2) NULL,
 CONSTRAINT [PK_TeacherTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[EnrollCourseView]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EnrollCourseView]
AS
SELECT DISTINCT dbo.SaveCoursesTable.ID, dbo.SaveCoursesTable.Name, dbo.RegisterStudentTable.Id AS studentId
FROM            dbo.SaveCoursesTable INNER JOIN
                         dbo.RegisterStudentTable ON dbo.SaveCoursesTable.DepartmentID = dbo.RegisterStudentTable.DepartmentId

GO
/****** Object:  View [dbo].[RegNoDropdownView]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RegNoDropdownView] as
SELECT        RegisterStudentTable.Id, RegisterStudentTable.RegNo, RegisterStudentTable.Name, RegisterStudentTable.Email, DepartmentTable.Name AS DepartmentName, DepartmentTable.ID AS DepartmentId
FROM            DepartmentTable INNER JOIN
                         RegisterStudentTable ON DepartmentTable.ID = RegisterStudentTable.DepartmentId
GO
/****** Object:  View [dbo].[ResultCourseView]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ResultCourseView]
AS
SELECT        dbo.EnrollCourseTable.StudentID, dbo.EnrollCourseTable.CourseId, dbo.SaveCoursesTable.Name, dbo.EnrollCourseTable.Id, dbo.EnrollCourseTable.Assigned
FROM            dbo.EnrollCourseTable INNER JOIN
                         dbo.SaveCoursesTable ON dbo.EnrollCourseTable.CourseId = dbo.SaveCoursesTable.ID

GO
/****** Object:  View [dbo].[ViewClassSchedule]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewClassSchedule]
AS
SELECT        dbo.SaveCoursesTable.ID AS courseId, dbo.ClassRoomTable.RoomNo, dbo.DayTable.Day, dbo.AllocateClassroomTable.FromTime, dbo.AllocateClassroomTable.ToTime, dbo.AllocateClassroomTable.Allocate
FROM            dbo.SaveCoursesTable INNER JOIN
                         dbo.AllocateClassroomTable ON dbo.SaveCoursesTable.ID = dbo.AllocateClassroomTable.CourseId INNER JOIN
                         dbo.ClassRoomTable ON dbo.AllocateClassroomTable.RoomId = dbo.ClassRoomTable.Id INNER JOIN
                         dbo.DayTable ON dbo.AllocateClassroomTable.DayId = dbo.DayTable.Id

GO
/****** Object:  View [dbo].[ViewCourseStatics]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCourseStatics]
AS
SELECT        dbo.SaveCoursesTable.Code, dbo.SaveCoursesTable.Name, dbo.SemesterTable.Semester, dbo.TeacherTable.Name AS AssignedTo, dbo.SaveCoursesTable.DepartmentID
FROM            dbo.SaveCoursesTable INNER JOIN
                         dbo.SemesterTable ON dbo.SaveCoursesTable.SemesterID = dbo.SemesterTable.ID LEFT OUTER JOIN
                         dbo.CourseToTeacher ON dbo.SaveCoursesTable.ID = dbo.CourseToTeacher.CourseID LEFT OUTER JOIN
                         dbo.TeacherTable ON dbo.CourseToTeacher.TeacherID = dbo.TeacherTable.ID

GO
/****** Object:  View [dbo].[VIEWRESULTVIEW]    Script Date: 9/30/2018 10:57:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWRESULTVIEW]
AS
SELECT        dbo.SaveCoursesTable.Code, dbo.SaveCoursesTable.Name, dbo.GradeLetterTable.GradeLetter, dbo.EnrollCourseTable.StudentID, dbo.EnrollCourseTable.Assigned
FROM            dbo.GradeLetterTable INNER JOIN
                         dbo.StudentResultTable ON dbo.GradeLetterTable.Id = dbo.StudentResultTable.GradeLetterId RIGHT OUTER JOIN
                         dbo.EnrollCourseTable INNER JOIN
                         dbo.SaveCoursesTable ON dbo.EnrollCourseTable.CourseId = dbo.SaveCoursesTable.ID ON dbo.StudentResultTable.EnrollCourseId = dbo.EnrollCourseTable.Id

GO
SET IDENTITY_INSERT [dbo].[AllocateClassroomTable] ON 

INSERT [dbo].[AllocateClassroomTable] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Allocate]) VALUES (8, 1, 1, 1, 2, CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 0)
INSERT [dbo].[AllocateClassroomTable] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Allocate]) VALUES (9, 1, 4, 2, 2, CAST(N'14:54:00' AS Time), CAST(N'15:54:00' AS Time), 0)
INSERT [dbo].[AllocateClassroomTable] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Allocate]) VALUES (10, 1, 1, 2, 3, CAST(N'12:02:00' AS Time), CAST(N'13:02:00' AS Time), 0)
INSERT [dbo].[AllocateClassroomTable] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Allocate]) VALUES (11, 1, 1, 2, 5, CAST(N'22:03:00' AS Time), CAST(N'23:03:00' AS Time), 0)
INSERT [dbo].[AllocateClassroomTable] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Allocate]) VALUES (12, 1, 4, 2, 4, CAST(N'09:11:00' AS Time), CAST(N'10:25:00' AS Time), 0)
SET IDENTITY_INSERT [dbo].[AllocateClassroomTable] OFF
SET IDENTITY_INSERT [dbo].[ClassRoomTable] ON 

INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (1, N'AB4-201')
INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (2, N'AB4-202')
INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (3, N'AB4-Lab1')
INSERT [dbo].[ClassRoomTable] ([Id], [RoomNo]) VALUES (4, N'AB4-Lab2')
SET IDENTITY_INSERT [dbo].[ClassRoomTable] OFF
SET IDENTITY_INSERT [dbo].[CourseToTeacher] ON 

INSERT [dbo].[CourseToTeacher] ([ID], [TeacherID], [CourseID], [Assigned]) VALUES (1, 1, 3, 0)
INSERT [dbo].[CourseToTeacher] ([ID], [TeacherID], [CourseID], [Assigned]) VALUES (2, 2, 2, 0)
INSERT [dbo].[CourseToTeacher] ([ID], [TeacherID], [CourseID], [Assigned]) VALUES (3, 3, 1, 0)
INSERT [dbo].[CourseToTeacher] ([ID], [TeacherID], [CourseID], [Assigned]) VALUES (6, 1, 4, 0)
SET IDENTITY_INSERT [dbo].[CourseToTeacher] OFF
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

INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (1, N'CSE', N'CSE')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (2, N'EEE', N'EEE')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (3, N'ETE', N'ETE')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (4, N'BBA', N'BBA')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (5, N'EB', N'EB')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (6, N'SENERC', N'Shariah')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (7, N'Pharma', N'Pharmecy')
INSERT [dbo].[DepartmentTable] ([ID], [Code], [Name]) VALUES (8, N'Habibi', N'Habibi')
SET IDENTITY_INSERT [dbo].[DepartmentTable] OFF
SET IDENTITY_INSERT [dbo].[DesignationTable] ON 

INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (1, N'Lecturer')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (2, N'Assistant Professor')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (3, N'Associate Professor')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (4, N'Professor')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (5, N'Deen')
INSERT [dbo].[DesignationTable] ([ID], [Designation]) VALUES (6, N'Vice Chancellor')
SET IDENTITY_INSERT [dbo].[DesignationTable] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourseTable] ON 

INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (1, 1, 4, CAST(N'2018-09-26' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (4, 1, 2, CAST(N'2018-09-26' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (5, 3, 2, CAST(N'2018-09-26' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (6, 2, 2, CAST(N'2018-09-26' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (7, 2, 3, CAST(N'2018-09-26' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (8, 2, 1, CAST(N'2018-09-27' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (9, 2, 1, CAST(N'2018-09-27' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (10, 2, 1, CAST(N'2018-09-27' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (11, 2, 1, CAST(N'2018-09-27' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (12, 2, 1, CAST(N'2018-09-27' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (13, 1, 4, CAST(N'2018-09-27' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (14, 1, 4, CAST(N'2018-09-27' AS Date), 0)
INSERT [dbo].[EnrollCourseTable] ([Id], [StudentID], [CourseId], [Date], [Assigned]) VALUES (15, 1, 3, CAST(N'2018-09-27' AS Date), 0)
SET IDENTITY_INSERT [dbo].[EnrollCourseTable] OFF
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
SET IDENTITY_INSERT [dbo].[RegisterStudentTable] ON 

INSERT [dbo].[RegisterStudentTable] ([Id], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (1, N'CSE-2012-001', N'Elias', N'Elias@gmail.com', N'02342342343', CAST(N'2018-09-29' AS Date), N'ctg`', 1)
INSERT [dbo].[RegisterStudentTable] ([Id], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (2, N'CSE-2012-002', N'Hridoy', N'Hridoy@mail.com', N'324233232', CAST(N'2018-09-22' AS Date), N'ctg', 1)
INSERT [dbo].[RegisterStudentTable] ([Id], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (3, N'CSE-2402-2018-1', N'Jawad Bin Faruk', N'jawadbin@gmail.com', N'0124578985', CAST(N'2018-02-02' AS Date), N'Ctg', 3)
INSERT [dbo].[RegisterStudentTable] ([Id], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (13, N'SENERC-09/2-1', N'Nasima Akter', N'Nasimaakter@gmail.com', N'4879855', CAST(N'2018-09-27' AS Date), N'nvgg', 6)
INSERT [dbo].[RegisterStudentTable] ([Id], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (14, N'SENERC-2018-1', N'Nasima Akter', N'Nasimaakter1@gmail.com', N'4879855', CAST(N'2018-09-27' AS Date), N'nvgg', 6)
SET IDENTITY_INSERT [dbo].[RegisterStudentTable] OFF
SET IDENTITY_INSERT [dbo].[SaveCoursesTable] ON 

INSERT [dbo].[SaveCoursesTable] ([ID], [Code], [Name], [Credit], [Description], [DepartmentID], [SemesterID]) VALUES (1, N'CSE-2305', N'Java', CAST(3.0 AS Numeric(2, 1)), N'OOP II', 1, 4)
INSERT [dbo].[SaveCoursesTable] ([ID], [Code], [Name], [Credit], [Description], [DepartmentID], [SemesterID]) VALUES (2, N'CSE-2306', N'Java', CAST(1.0 AS Numeric(2, 1)), N'OOP II', 1, 4)
INSERT [dbo].[SaveCoursesTable] ([ID], [Code], [Name], [Credit], [Description], [DepartmentID], [SemesterID]) VALUES (3, N'CSE-2303', N'Algorithm', CAST(3.0 AS Numeric(2, 1)), N'Algorithm', 1, 4)
INSERT [dbo].[SaveCoursesTable] ([ID], [Code], [Name], [Credit], [Description], [DepartmentID], [SemesterID]) VALUES (4, N'ACC-2401', N'ACC', CAST(3.0 AS Numeric(2, 1)), N'Accounting', 1, 4)
INSERT [dbo].[SaveCoursesTable] ([ID], [Code], [Name], [Credit], [Description], [DepartmentID], [SemesterID]) VALUES (5, N'Pharma-2401', N'Pharmecy-1', CAST(3.2 AS Numeric(2, 1)), N'sdfsadfaslfasf', 7, 4)
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
SET IDENTITY_INSERT [dbo].[StudentResultTable] ON 

INSERT [dbo].[StudentResultTable] ([Id], [EnrollCourseId], [GradeLetterId]) VALUES (6, 1, 1)
INSERT [dbo].[StudentResultTable] ([Id], [EnrollCourseId], [GradeLetterId]) VALUES (7, 4, 1)
INSERT [dbo].[StudentResultTable] ([Id], [EnrollCourseId], [GradeLetterId]) VALUES (8, 5, 2)
SET IDENTITY_INSERT [dbo].[StudentResultTable] OFF
SET IDENTITY_INSERT [dbo].[TeacherTable] ON 

INSERT [dbo].[TeacherTable] ([ID], [Name], [Address], [Email], [ContactNo], [DesignationID], [DepartmentID], [CreditToTaken], [RemainingCredit]) VALUES (1, N'Elias Hridoy', N'CTG', N'hridoyhearth135@gmail.com', 1815593582, 5, 1, CAST(25.00 AS Numeric(4, 2)), CAST(13.00 AS Numeric(4, 2)))
INSERT [dbo].[TeacherTable] ([ID], [Name], [Address], [Email], [ContactNo], [DesignationID], [DepartmentID], [CreditToTaken], [RemainingCredit]) VALUES (2, N'Nayeem', N'CTG', N'nameey@gmail.com', 192238374, 4, 1, CAST(25.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)))
INSERT [dbo].[TeacherTable] ([ID], [Name], [Address], [Email], [ContactNo], [DesignationID], [DepartmentID], [CreditToTaken], [RemainingCredit]) VALUES (3, N'Tanvir', N'CTG', N'tanvir@gmail.com', 234254324, 4, 1, CAST(20.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)))
INSERT [dbo].[TeacherTable] ([ID], [Name], [Address], [Email], [ContactNo], [DesignationID], [DepartmentID], [CreditToTaken], [RemainingCredit]) VALUES (4, N'Nusrat Jahan', N'nai', N'Nu@gam.com', 18155978, 1, 1, CAST(3.20 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)))
SET IDENTITY_INSERT [dbo].[TeacherTable] OFF
ALTER TABLE [dbo].[AllocateClassroomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroomTable_ClassRoomTable] FOREIGN KEY([RoomId])
REFERENCES [dbo].[ClassRoomTable] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroomTable] CHECK CONSTRAINT [FK_AllocateClassroomTable_ClassRoomTable]
GO
ALTER TABLE [dbo].[AllocateClassroomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroomTable_DayTable] FOREIGN KEY([DayId])
REFERENCES [dbo].[DayTable] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroomTable] CHECK CONSTRAINT [FK_AllocateClassroomTable_DayTable]
GO
ALTER TABLE [dbo].[AllocateClassroomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroomTable_DepartmentTable] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTable] ([ID])
GO
ALTER TABLE [dbo].[AllocateClassroomTable] CHECK CONSTRAINT [FK_AllocateClassroomTable_DepartmentTable]
GO
ALTER TABLE [dbo].[AllocateClassroomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroomTable_SaveCoursesTable] FOREIGN KEY([CourseId])
REFERENCES [dbo].[SaveCoursesTable] ([ID])
GO
ALTER TABLE [dbo].[AllocateClassroomTable] CHECK CONSTRAINT [FK_AllocateClassroomTable_SaveCoursesTable]
GO
ALTER TABLE [dbo].[EnrollCourseTable]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseTable_RegisterStudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[RegisterStudentTable] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourseTable] CHECK CONSTRAINT [FK_EnrollCourseTable_RegisterStudentTable]
GO
ALTER TABLE [dbo].[EnrollCourseTable]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseTable_SaveCoursesTable] FOREIGN KEY([CourseId])
REFERENCES [dbo].[SaveCoursesTable] ([ID])
GO
ALTER TABLE [dbo].[EnrollCourseTable] CHECK CONSTRAINT [FK_EnrollCourseTable_SaveCoursesTable]
GO
ALTER TABLE [dbo].[SaveCoursesTable]  WITH CHECK ADD  CONSTRAINT [FK_SaveCoursesTable_DepartmentTable] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DepartmentTable] ([ID])
GO
ALTER TABLE [dbo].[SaveCoursesTable] CHECK CONSTRAINT [FK_SaveCoursesTable_DepartmentTable]
GO
ALTER TABLE [dbo].[SaveCoursesTable]  WITH CHECK ADD  CONSTRAINT [FK_SaveCoursesTable_SemesterTable] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[SemesterTable] ([ID])
GO
ALTER TABLE [dbo].[SaveCoursesTable] CHECK CONSTRAINT [FK_SaveCoursesTable_SemesterTable]
GO
ALTER TABLE [dbo].[StudentResultTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultTable_EnrollCourseTable] FOREIGN KEY([EnrollCourseId])
REFERENCES [dbo].[EnrollCourseTable] ([Id])
GO
ALTER TABLE [dbo].[StudentResultTable] CHECK CONSTRAINT [FK_StudentResultTable_EnrollCourseTable]
GO
ALTER TABLE [dbo].[StudentResultTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultTable_GradeLetterTable] FOREIGN KEY([GradeLetterId])
REFERENCES [dbo].[GradeLetterTable] ([Id])
GO
ALTER TABLE [dbo].[StudentResultTable] CHECK CONSTRAINT [FK_StudentResultTable_GradeLetterTable]
GO
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SaveCoursesTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "RegisterStudentTable"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1560
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EnrollCourseView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EnrollCourseView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EnrollCourseTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SaveCoursesTable"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResultCourseView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResultCourseView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SaveCoursesTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AllocateClassroomTable"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ClassRoomTable"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DayTable"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewClassSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewClassSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SaveCoursesTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "SemesterTable"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseToTeacher"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 215
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TeacherTable"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCourseStatics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCourseStatics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GradeLetterTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentResultTable"
            Begin Extent = 
               Top = 0
               Left = 426
               Bottom = 113
               Right = 596
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EnrollCourseTable"
            Begin Extent = 
               Top = 17
               Left = 240
               Bottom = 147
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SaveCoursesTable"
            Begin Extent = 
               Top = 9
               Left = 626
               Bottom = 139
               Right = 796
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWRESULTVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWRESULTVIEW'
GO
USE [master]
GO
ALTER DATABASE [DotBooster_UniversityManagementSystemDB] SET  READ_WRITE 
GO
