USE [master]
GO
/****** Object:  Database [logDB_salih_yigit]    Script Date: 22.05.2022 23:45:18 ******/
CREATE DATABASE [logDB_salih_yigit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'logDB_salih_yigit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\logDB_salih_yigit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'logDB_salih_yigit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\logDB_salih_yigit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [logDB_salih_yigit] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [logDB_salih_yigit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [logDB_salih_yigit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET ARITHABORT OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [logDB_salih_yigit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [logDB_salih_yigit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [logDB_salih_yigit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [logDB_salih_yigit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [logDB_salih_yigit] SET  MULTI_USER 
GO
ALTER DATABASE [logDB_salih_yigit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [logDB_salih_yigit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [logDB_salih_yigit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [logDB_salih_yigit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [logDB_salih_yigit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [logDB_salih_yigit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [logDB_salih_yigit] SET QUERY_STORE = OFF
GO
USE [logDB_salih_yigit]
GO
/****** Object:  Table [dbo].[Kargo_bilgileri_table]    Script Date: 22.05.2022 23:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargo_bilgileri_table](
	[kargo_veren_id] [int] NOT NULL,
	[kargo_teslim_tel] [nvarchar](11) NOT NULL,
	[kargo_teslim_tc] [nvarchar](11) NOT NULL,
	[kargo_teslim_adres] [nvarchar](100) NOT NULL,
	[kargo_cikis_tarihi] [datetime] NOT NULL,
	[kargo_varis_tarihi] [datetime] NULL,
	[kargo_araci_sofor_id] [int] NOT NULL,
	[kargo_numarasi] [int] IDENTITY(1,1) NOT NULL,
	[LOG_DATE] [datetime] NULL,
	[LOG_HOSTNAME] [varchar](100) NULL,
	[LOG_USERNAME] [varchar](100) NULL,
	[LOG_ACTIONTYPE] [varchar](100) NULL,
	[LOG_PROGRAMNAME] [varchar](100) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [logDB_salih_yigit] SET  READ_WRITE 
GO
