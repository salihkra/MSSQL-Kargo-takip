USE [master]
GO
/****** Object:  Database [salihkara_yigitanavatan]    Script Date: 22.05.2022 23:44:40 ******/
CREATE DATABASE [salihkara_yigitanavatan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'salihkara_yigitanavatan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\salihkara_yigitanavatan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'salihkara_yigitanavatan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\salihkara_yigitanavatan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [salihkara_yigitanavatan] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [salihkara_yigitanavatan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [salihkara_yigitanavatan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET ARITHABORT OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET  MULTI_USER 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [salihkara_yigitanavatan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [salihkara_yigitanavatan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [salihkara_yigitanavatan] SET QUERY_STORE = OFF
GO
USE [salihkara_yigitanavatan]
GO
/****** Object:  UserDefinedFunction [dbo].[musteri_bilgi]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[musteri_bilgi]
(@musteri_isim nvarchar(50), @musteri_soyisim nvarchar(50))
returns nvarchar(101)
as begin
return @musteri_isim + space(1) + @musteri_soyisim
end
GO
/****** Object:  Table [dbo].[Personel_table]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personel_isim] [nvarchar](50) NOT NULL,
	[personel_soyisim] [nvarchar](50) NOT NULL,
	[personel_tc] [char](11) NOT NULL,
	[personel_maas] [decimal](18, 3) NOT NULL,
	[personel_cinsiyet] [nvarchar](5) NULL,
 CONSTRAINT [PK_Personel_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Personel_table] UNIQUE NONCLUSTERED 
(
	[personel_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[toplam_pers_maas_view]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[toplam_pers_maas_view]
AS
SELECT COUNT(id) AS [Personel Sayısı], SUM(personel_maas) AS [Toplam Maaş]
FROM   dbo.Personel_table
GO
/****** Object:  View [dbo].[sadece_k_personelleri_ceker]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sadece_k_personelleri_ceker]
AS
SELECT TOP (100) PERCENT personel_isim, personel_soyisim, personel_maas
FROM   dbo.Personel_table
WHERE ('WHERE personel_cinsiyet' = 'k')
GO
/****** Object:  Table [dbo].[Arac_bilgileri_table]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arac_bilgileri_table](
	[arac_sofor_id] [int] NOT NULL,
	[plaka] [nvarchar](8) NOT NULL,
	[arac_yuk] [nvarchar](50) NOT NULL,
	[arac_bakim_tarihi] [date] NOT NULL,
 CONSTRAINT [PK_Arac_bilgileri_table] PRIMARY KEY CLUSTERED 
(
	[arac_sofor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Arac_bilgileri_table] UNIQUE NONCLUSTERED 
(
	[plaka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kargo_bilgileri_table]    Script Date: 22.05.2022 23:44:41 ******/
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
 CONSTRAINT [PK_Kargo_bilgileri_table_1] PRIMARY KEY CLUSTERED 
(
	[kargo_numarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Kargo_bilgileri_table] UNIQUE NONCLUSTERED 
(
	[kargo_teslim_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Kargo_bilgileri_table_1] UNIQUE NONCLUSTERED 
(
	[kargo_teslim_tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri_table]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri_table](
	[musteri_id] [int] IDENTITY(1,1) NOT NULL,
	[musteri_isim] [nvarchar](50) NOT NULL,
	[musteri_soyisim] [nvarchar](30) NOT NULL,
	[musteri_telefon] [nvarchar](11) NOT NULL,
	[musteri_mail] [nvarchar](150) NOT NULL,
	[musteri_tc] [char](11) NOT NULL,
 CONSTRAINT [PK_Musteri_table] PRIMARY KEY CLUSTERED 
(
	[musteri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Musteri_table] UNIQUE NONCLUSTERED 
(
	[musteri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Musteri_table_1] UNIQUE NONCLUSTERED 
(
	[musteri_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Musteri_table_2] UNIQUE NONCLUSTERED 
(
	[musteri_telefon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Musteri_table_3] UNIQUE NONCLUSTERED 
(
	[musteri_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kargo_bilgileri_table]  WITH CHECK ADD  CONSTRAINT [FK_Kargo_bilgileri_table_Arac_bilgileri_table] FOREIGN KEY([kargo_araci_sofor_id])
REFERENCES [dbo].[Arac_bilgileri_table] ([arac_sofor_id])
GO
ALTER TABLE [dbo].[Kargo_bilgileri_table] CHECK CONSTRAINT [FK_Kargo_bilgileri_table_Arac_bilgileri_table]
GO
ALTER TABLE [dbo].[Kargo_bilgileri_table]  WITH CHECK ADD  CONSTRAINT [FK_Kargo_bilgileri_table_Musteri_table] FOREIGN KEY([kargo_veren_id])
REFERENCES [dbo].[Musteri_table] ([musteri_id])
GO
ALTER TABLE [dbo].[Kargo_bilgileri_table] CHECK CONSTRAINT [FK_Kargo_bilgileri_table_Musteri_table]
GO
/****** Object:  StoredProcedure [dbo].[sp_arac_bilgileri_komut_ekrani]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
--BU PROCEDURE Arac_bilgileri_table bilgilerini günceller,siler,ekler ve ekrana yazdırır.
-- ================================================
CREATE PROCEDURE [dbo].[sp_arac_bilgileri_komut_ekrani] 
(
@arac_sofor_id int,
@plaka nvarchar(8),
@arac_yuk nvarchar(50),
@arac_bakim_tarihi date,
@istenilen_komut nvarchar(20) = ''
)

AS
BEGIN
	IF @istenilen_komut='Insert'

		INSERT INTO Arac_bilgileri_table(arac_sofor_id,plaka,arac_yuk,arac_bakim_tarihi) 
		VALUES (@arac_sofor_id,@plaka,@arac_yuk,@arac_bakim_tarihi)
END
	IF @istenilen_komut='Select'
	BEGIN
            SELECT *
            FROM   Arac_bilgileri_table
        END
	IF @istenilen_komut='Update'
	BEGIN
	UPDATE Arac_bilgileri_table
            SET    arac_sofor_id = @arac_sofor_id,
                   plaka=@plaka,
                   arac_yuk = @arac_yuk,
                   arac_bakim_tarihi = @arac_bakim_tarihi
            WHERE  arac_sofor_id = @arac_sofor_id
        END

	   ELSE IF @istenilen_komut = 'Delete'
        BEGIN
            DELETE FROM Arac_bilgileri_table
            WHERE  arac_sofor_id = @arac_sofor_id
        END

GO
/****** Object:  StoredProcedure [dbo].[sp_kargo_bilgileri_komut_ekrani]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
--BU PROCEDURE KARGO_BİLGİLERİ_EKLE TABLOSUNA VERİ EKLEMEK İÇİN KULLANILIR 
-- ================================================

CREATE PROCEDURE [dbo].[sp_kargo_bilgileri_komut_ekrani]
(
@kargo_veren_id int,
@kargo_teslim_tel nvarchar(11),
@kargo_teslim_tc nvarchar(11),
@kargo_teslim_adres nvarchar(100),
@kargo_cikis_tarihi datetime,
@kargo_varis_tarihi datetime,
@kargo_araci_sofor_id int,
@istenilen_komut nvarchar(20) = ''
)
	
AS
BEGIN

IF @istenilen_komut='Insert'

	INSERT INTO Kargo_bilgileri_table(kargo_veren_id,kargo_teslim_tel,kargo_teslim_tc,kargo_teslim_adres,kargo_cikis_tarihi,kargo_varis_tarihi,kargo_araci_sofor_id)
		VALUES(@kargo_veren_id,@kargo_teslim_tel,@kargo_teslim_tc,@kargo_teslim_adres,@kargo_cikis_tarihi,@kargo_varis_tarihi,@kargo_araci_sofor_id)
END
	IF @istenilen_komut='Select'
	BEGIN
            SELECT *
            FROM   Kargo_bilgileri_table
        END
	IF @istenilen_komut='Update'
	BEGIN
	UPDATE Kargo_bilgileri_table
            SET    kargo_veren_id = @kargo_veren_id,
				   kargo_teslim_tel = @kargo_teslim_tel,
				   kargo_teslim_adres = @kargo_teslim_adres,
				   kargo_cikis_tarihi = @kargo_cikis_tarihi,
				   kargo_varis_tarihi = @kargo_varis_tarihi,
				   kargo_araci_sofor_id =@kargo_araci_sofor_id
            WHERE  kargo_araci_sofor_id = @kargo_araci_sofor_id
        END

	   
        

GO
/****** Object:  StoredProcedure [dbo].[sp_Musteri_table_komut_ekrani]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Musteri_table_komut_ekrani]
(
@musteri_id int,
@musteri_isim nvarchar(50),
@musteri_soyisim nvarchar(50),
@musteri_tel nvarchar(11),
@musteri_mail nvarchar(150),
@musteri_tc char(11),
@istenilen_komut nvarchar(20) = ''
)
 AS
 BEGIN 
 IF @istenilen_komut='Insert'

	INSERT INTO Musteri_table(musteri_id,musteri_isim,musteri_soyisim,musteri_telefon,musteri_mail,musteri_tc)
 VALUES (@musteri_id,@musteri_isim,@musteri_soyisim,@musteri_tel,@musteri_mail,@musteri_tc)
END
	IF @istenilen_komut='Select'
	BEGIN
            SELECT *
            FROM   Musteri_table
        END
	ELSE IF @istenilen_komut='Update'
	BEGIN
	UPDATE Musteri_table
            SET    
				   musteri_isim = @musteri_isim,
				   musteri_soyisim = @musteri_soyisim,
				   musteri_telefon = @musteri_tel,
				   musteri_mail = @musteri_mail,
				   musteri_tc = @musteri_tc
            WHERE  musteri_tc = @musteri_tc
        END
GO
/****** Object:  StoredProcedure [dbo].[sp_Personel_table_komut_ekrani]    Script Date: 22.05.2022 23:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Personel_table_komut_ekrani] 
	(
	@personel_isim nvarchar(50),			
	@personel_soyisim nvarchar(50),			
	@personel_tc char(50),
	@personel_maas decimal(18,3),
	@personel_cinsiyet nvarchar(5),
    @istenilen_komut nvarchar(20) = ''
	)
	AS
BEGIN
		IF @istenilen_komut='Insert'
			INSERT INTO Personel_table(personel_isim,personel_soyisim,personel_tc,personel_maas,personel_cinsiyet)
			VALUES (@personel_isim,@personel_soyisim,@personel_tc,@personel_maas,@personel_cinsiyet)
			END
			
		IF @istenilen_komut='Select'
BEGIN
			SELECT * FROM   Personel_table 
			END
		IF @istenilen_komut='Update'
BEGIN
			UPDATE Personel_table
			    SET    personel_isim = @personel_isim,
				       personel_soyisim=@personel_soyisim,
					   personel_tc = @personel_tc,
					   personel_maas = @personel_maas,
					   personel_cinsiyet = @personel_cinsiyet

            WHERE  personel_tc = @personel_tc
        END
		 ELSE IF @istenilen_komut = 'Delete'
BEGIN
            DELETE FROM Personel_table
            WHERE  personel_tc = @personel_tc
        END




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
         Begin Table = "Personel_table"
            Begin Extent = 
               Top = 9
               Left = 960
               Bottom = 277
               Right = 1199
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1960
         Width = 2060
         Width = 1830
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4000
         Alias = 900
         Table = 2500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sadece_k_personelleri_ceker'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sadece_k_personelleri_ceker'
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
         Begin Table = "Personel_table"
            Begin Extent = 
               Top = 22
               Left = 312
               Bottom = 288
               Right = 551
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 2650
         Width = 2640
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3900
         Alias = 900
         Table = 2320
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'toplam_pers_maas_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'toplam_pers_maas_view'
GO
USE [master]
GO
ALTER DATABASE [salihkara_yigitanavatan] SET  READ_WRITE 
GO
