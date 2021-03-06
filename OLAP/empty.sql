/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [assignment2]    Script Date: 12/12/2017 19.34.18 ******/
CREATE DATABASE [assignment2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assignment2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\assignment2.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'assignment2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\assignment2_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [assignment2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assignment2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assignment2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assignment2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assignment2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assignment2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assignment2] SET ARITHABORT OFF 
GO
ALTER DATABASE [assignment2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assignment2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assignment2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assignment2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assignment2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assignment2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assignment2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assignment2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assignment2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assignment2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [assignment2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assignment2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assignment2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assignment2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assignment2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assignment2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assignment2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assignment2] SET RECOVERY FULL 
GO
ALTER DATABASE [assignment2] SET  MULTI_USER 
GO
ALTER DATABASE [assignment2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assignment2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [assignment2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [assignment2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [assignment2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'assignment2', N'ON'
GO
ALTER DATABASE [assignment2] SET QUERY_STORE = OFF
GO
USE [assignment2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [assignment2]
GO
/****** Object:  Table [dbo].[bridgeEmployeeClient]    Script Date: 12/12/2017 19.34.18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bridgeEmployeeClient](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[CID] [int] NULL,
	[EID] [int] NULL,
	[start] [date] NULL,
	[end] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimCity]    Script Date: 12/12/2017 19.34.19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimCity](
	[city_id] [int] NOT NULL,
	[city] [varchar](100) NULL,
	[state_id] [int] NULL,
	[state] [varchar](100) NULL,
	[country_id] [int] NULL,
	[country_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimClient]    Script Date: 12/12/2017 19.34.19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimClient](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NULL,
	[client] [varchar](100) NULL,
	[category] [varchar](10) NULL,
	[current] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimDate]    Script Date: 12/12/2017 19.34.19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimDate](
	[DateID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[day] [int] NULL,
	[month] [int] NULL,
	[year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimEmployee]    Script Date: 12/12/2017 19.34.19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimEmployee](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[emp_no] [int] NULL,
	[birth_date] [int] NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[gender] [varchar](10) NULL,
	[marital_status] [varchar](10) NULL,
	[no_of_children] [int] NULL,
	[hire_date] [int] NULL,
	[title_id] [int] NULL,
	[title] [varchar](50) NULL,
	[current_city_id] [int] NULL,
	[base_city_id] [int] NULL,
	[dept_id] [char](4) NULL,
	[dept_name] [varchar](40) NULL,
	[start] [date] NULL,
	[end] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factSalary]    Script Date: 12/12/2017 19.34.19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factSalary](
	[EID] [int] NOT NULL,
	[DateID] [int] NOT NULL,
	[salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EID] ASC,
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bridgeEmployeeClient]  WITH CHECK ADD  CONSTRAINT [fk_bridge_client] FOREIGN KEY([CID])
REFERENCES [dbo].[dimClient] ([CID])
GO
ALTER TABLE [dbo].[bridgeEmployeeClient] CHECK CONSTRAINT [fk_bridge_client]
GO
ALTER TABLE [dbo].[bridgeEmployeeClient]  WITH CHECK ADD  CONSTRAINT [fk_bridge_employee] FOREIGN KEY([EID])
REFERENCES [dbo].[dimEmployee] ([EID])
GO
ALTER TABLE [dbo].[bridgeEmployeeClient] CHECK CONSTRAINT [fk_bridge_employee]
GO
ALTER TABLE [dbo].[dimEmployee]  WITH CHECK ADD  CONSTRAINT [fk_employee_basecity] FOREIGN KEY([base_city_id])
REFERENCES [dbo].[dimCity] ([city_id])
GO
ALTER TABLE [dbo].[dimEmployee] CHECK CONSTRAINT [fk_employee_basecity]
GO
ALTER TABLE [dbo].[dimEmployee]  WITH CHECK ADD  CONSTRAINT [fk_employee_birthdate] FOREIGN KEY([birth_date])
REFERENCES [dbo].[dimDate] ([DateID])
GO
ALTER TABLE [dbo].[dimEmployee] CHECK CONSTRAINT [fk_employee_birthdate]
GO
ALTER TABLE [dbo].[dimEmployee]  WITH CHECK ADD  CONSTRAINT [fk_employee_currentcity] FOREIGN KEY([current_city_id])
REFERENCES [dbo].[dimCity] ([city_id])
GO
ALTER TABLE [dbo].[dimEmployee] CHECK CONSTRAINT [fk_employee_currentcity]
GO
ALTER TABLE [dbo].[dimEmployee]  WITH CHECK ADD  CONSTRAINT [fk_employee_hiredate] FOREIGN KEY([hire_date])
REFERENCES [dbo].[dimDate] ([DateID])
GO
ALTER TABLE [dbo].[dimEmployee] CHECK CONSTRAINT [fk_employee_hiredate]
GO
ALTER TABLE [dbo].[factSalary]  WITH CHECK ADD  CONSTRAINT [fk_salary_date] FOREIGN KEY([DateID])
REFERENCES [dbo].[dimDate] ([DateID])
GO
ALTER TABLE [dbo].[factSalary] CHECK CONSTRAINT [fk_salary_date]
GO
ALTER TABLE [dbo].[factSalary]  WITH CHECK ADD  CONSTRAINT [fk_salary_employee] FOREIGN KEY([EID])
REFERENCES [dbo].[dimEmployee] ([EID])
GO
ALTER TABLE [dbo].[factSalary] CHECK CONSTRAINT [fk_salary_employee]
GO
USE [master]
GO
ALTER DATABASE [assignment2] SET  READ_WRITE 
GO
