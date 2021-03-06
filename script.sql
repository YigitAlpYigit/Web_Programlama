USE [master]
GO
/****** Object:  Database [HayvanSahiplenme]    Script Date: 2.01.2021 22:56:38 ******/
CREATE DATABASE [HayvanSahiplenme]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HayvanSahiplenme', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HayvanSahiplenme.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HayvanSahiplenme_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HayvanSahiplenme_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HayvanSahiplenme] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HayvanSahiplenme].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HayvanSahiplenme] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET ARITHABORT OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HayvanSahiplenme] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HayvanSahiplenme] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HayvanSahiplenme] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HayvanSahiplenme] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HayvanSahiplenme] SET  MULTI_USER 
GO
ALTER DATABASE [HayvanSahiplenme] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HayvanSahiplenme] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HayvanSahiplenme] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HayvanSahiplenme] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HayvanSahiplenme] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HayvanSahiplenme] SET QUERY_STORE = OFF
GO
USE [HayvanSahiplenme]
GO
/****** Object:  Table [dbo].[TBLADMIN]    Script Date: 2.01.2021 22:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLADMIN](
	[ADMINID] [smallint] IDENTITY(1,1) NOT NULL,
	[ADMINEPOSTA] [varchar](50) NULL,
	[ADMINSIFRE] [varchar](50) NULL,
 CONSTRAINT [PK_TBLADMIN] PRIMARY KEY CLUSTERED 
(
	[ADMINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLALICI]    Script Date: 2.01.2021 22:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLALICI](
	[KULLANICIID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICIAD] [varchar](50) NULL,
	[KULLANICISOYAD] [varchar](50) NULL,
	[KULLANICIEPOSTA] [varchar](max) NULL,
	[KULLANICITEL] [varchar](15) NULL,
	[KULLANICIADRES] [varchar](max) NULL,
	[KULLANICIALIM] [varchar](max) NULL,
	[KULLANICISIFRE] [varchar](50) NULL,
	[KULLANICIIP] [varchar](50) NULL,
 CONSTRAINT [PK_TBLALICI] PRIMARY KEY CLUSTERED 
(
	[KULLANICIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLHAYVAN]    Script Date: 2.01.2021 22:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLHAYVAN](
	[HAYVANID] [int] IDENTITY(1,1) NOT NULL,
	[HAYVANAD] [varchar](50) NULL,
	[HAYVANKATEGORI] [int] NULL,
	[HAYVANCINSIYET] [varchar](10) NULL,
	[HAYVANYAS] [varchar](50) NULL,
	[HAYVANCINS] [varchar](30) NULL,
	[HAYVANIC] [varchar](max) NULL,
	[HAYVANRESIM_1] [varchar](max) NULL,
	[HAYVANRESIM_2] [varchar](max) NULL,
	[HAYVANRESIM_3] [varchar](max) NULL,
	[HAYVANRESIM_4] [varchar](max) NULL,
	[HAYVANRESIM_5] [varchar](max) NULL,
 CONSTRAINT [PK_TBLHAYVAN] PRIMARY KEY CLUSTERED 
(
	[HAYVANID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLKATEGORILER]    Script Date: 2.01.2021 22:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLKATEGORILER](
	[KATEGORIID] [int] IDENTITY(1,1) NOT NULL,
	[KATEGORIAD] [varchar](50) NULL,
 CONSTRAINT [PK_TBLKAREGORILER] PRIMARY KEY CLUSTERED 
(
	[KATEGORIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBLADMIN] ON 

INSERT [dbo].[TBLADMIN] ([ADMINID], [ADMINEPOSTA], [ADMINSIFRE]) VALUES (2, N'alp.yigit@ogr.sakarya.edu.tr', N'admin123')
SET IDENTITY_INSERT [dbo].[TBLADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLALICI] ON 

INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (1, N'Yiğit Alp', N'Yiğit', N'alp123464@gmail.com', N'05451112233', N'132', N'köpek', N'123123', N'2')
INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (5, N'Yiğit Alp', N'Yiğit', N'a@a.com', N'05451112233', N'Bağlar Caddesi', N'Sahiplenilmek İstenen Hayvanın Adı : Bulut 
Hayvanın ID : 2
Hayvanın Kategorisi : 3
Hayvanın Cinsi ve Cisiyeti : Golden & Erkek
                                            ', N'123123', N'::1')
INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (6, NULL, NULL, N'b@b.com', NULL, NULL, NULL, N'alp123', N'3')
INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (7, NULL, NULL, N'abc@abc.com', NULL, NULL, NULL, N'alp123', N'4')
INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (8, NULL, NULL, N'c@c.com', NULL, NULL, NULL, N'123123', N'5')
INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (9, NULL, NULL, N'd@d.com', NULL, NULL, NULL, N'123123', N'6')
INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (10, NULL, NULL, N'e@e.com', NULL, NULL, NULL, N'123123', N'7')
INSERT [dbo].[TBLALICI] ([KULLANICIID], [KULLANICIAD], [KULLANICISOYAD], [KULLANICIEPOSTA], [KULLANICITEL], [KULLANICIADRES], [KULLANICIALIM], [KULLANICISIFRE], [KULLANICIIP]) VALUES (11, N'Yiğit Alp', N'Yiğit', N'ko@ko.com', N'05451112233', N'Bağlar Caddesi', N'Sahiplenilmek İstenen Hayvanın Adı : Alex 
Hayvanın ID : 4
Hayvanın Kategorisi : 3
Hayvanın Cinsi ve Cisiyeti : boş & erkek
                                            ', N'123123', N'0')
SET IDENTITY_INSERT [dbo].[TBLALICI] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLHAYVAN] ON 

INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (1, N'Hayalet', 3, N'Erkek', N'12', N'Golden', N'beyaz renkli , mavi gözlü', N'/web/images/hayvanlar/kopek1/kopek1_1.jpg', N'/web/images/hayvanlar/kopek1/kopek1_2.jpg', N'/web/images/hayvanlar/kopek1/kopek1_3.jpg', N'/web/images/hayvanlar/kopek1/kopek1_4.jpg', N'/web/images/hayvanlar/kopek1/kopek1_5.jpg')
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (2, N'Bulut', 3, N'Erkek', N'123', N'Golden', N'asasasss', N'/web/images/hayvanlar/kopek2/kopek2_1.jpg', N'/web/images/hayvanlar/kopek2/kopek2_2.jpg', N'/web/images/hayvanlar/kopek2/kopek2_3.jpg', N'/web/images/hayvanlar/kopek2/kopek2_4.jpg', N'/web/images/hayvanlar/kopek2/kopek2_5.jpg')
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (3, N'sultan papağanı', 4, N'Erkek', N'0', N'sultan', N'0-3 aylık sultan papağanı', N'/web/images/hayvanlar/kus1/kus1_1.jpg', N'/web/images/hayvanlar/kus1/kus1_2.jpg', N'/web/images/hayvanlar/kus1/kus1_3.jpg', NULL, NULL)
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (4, N'Alex', 3, N'erkek', N'3', N'boş', N'3 yaşında siyah erkek', N'/web/images/hayvanlar/kopek3/kopek3_1.jpg', N'/web/images/hayvanlar/kopek3/kopek3_2.jpg', N'/web/images/hayvanlar/kopek3/kopek3_3.jpg', N'/web/images/hayvanlar/kopek3/kopek3_4.jpg', N'/web/images/hayvanlar/kopek3/kopek3_5.jpg')
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (5, N'zeytin', 3, N'Dişi', N'5', N'boş', N'5 yaşında dişi ', N'/web/images/hayvanlar/kopek4/kopek4_1.jpeg', N'/web/images/hayvanlar/kopek4/kopek4_2.jpeg', N'/web/images/hayvanlar/kopek4/kopek4_3.jpeg', N'/web/images/hayvanlar/kopek4/kopek4_4.jpeg', N'/web/images/hayvanlar/kopek4/kopek4_5.jpeg')
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (6, N'ad', 4, N'erkek', N'1', N'cins', N'kuş', N'/web/images/hayvanlar/kus2/kus2_1.jpeg', N'/web/images/hayvanlar/kus2/kus2_2.jpeg', N'/web/images/hayvanlar/kus2/kus2_3.jpeg', N'/web/images/hayvanlar/kus2/kus2_4.jpeg', NULL)
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (7, N'aliş', 4, N'Dişi', N'4', N'kuş', N'boş', N'/web/images/hayvanlar/kus3/kus3_1.jpg', N'/web/images/hayvanlar/kus3/kus3_2.jpg', NULL, NULL, NULL)
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (8, N'çimen', 4, N'Dişi', N'1', N'kuş', NULL, N'/web/images/hayvanlar/kus4/kus4_1.jpg', N'/web/images/hayvanlar/kus4/kus4_2.jpg', N'/web/images/hayvanlar/kus4/kus4_3.jpg', NULL, NULL)
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (9, N'Bihter', 2, N'kedi', N'1', N'kedi', NULL, N'/web/images/hayvanlar/kedi1/kedi1_1.jpg', N'/web/images/hayvanlar/kedi1/kedi1_2.jpg', N'/web/images/hayvanlar/kedi1/kedi1_3.jpg', N'/web/images/hayvanlar/kedi1/kedi1_4.jpg', N'/web/images/hayvanlar/kedi1/kedi1_5.jpg')
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (10, N'Lila', 2, N'Erkek', N'12', N'boş', NULL, N'/web/images/hayvanlar/kedi2/kedi2_1.jpg', N'/web/images/hayvanlar/kedi2/kedi2_2.jpg', N'/web/images/hayvanlar/kedi2/kedi2_3.jpg', N'/web/images/hayvanlar/kedi2/kedi2_4.jpg', N'/web/images/hayvanlar/kedi2/kedi2_5.jpg')
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (11, N'Fadik', 2, N'Dişi', N'5', N'kedi', NULL, N'/web/images/hayvanlar/kedi3/kedi3_1.jpg', N'/web/images/hayvanlar/kedi3/kedi3_2.jpg', N'/web/images/hayvanlar/kedi3/kedi3_3.jpg', N'/web/images/hayvanlar/kedi3/kedi3_4.jpg', N'/web/images/hayvanlar/kedi3/kedi3_5.jpg')
INSERT [dbo].[TBLHAYVAN] ([HAYVANID], [HAYVANAD], [HAYVANKATEGORI], [HAYVANCINSIYET], [HAYVANYAS], [HAYVANCINS], [HAYVANIC], [HAYVANRESIM_1], [HAYVANRESIM_2], [HAYVANRESIM_3], [HAYVANRESIM_4], [HAYVANRESIM_5]) VALUES (12, N'Cazibe', 2, N'Dişi', N'7', N'kedi', N'7 yaşında kedi', N'/web/images/hayvanlar/kedi4/kedi4_1.jpg', N'/web/images/hayvanlar/kedi4/kedi4_2.jpg', N'/web/images/hayvanlar/kedi4/kedi4_3.jpg', N'/web/images/hayvanlar/kedi4/kedi4_4.jpg', N'/web/images/hayvanlar/kedi4/kedi4_5.jpg')
SET IDENTITY_INSERT [dbo].[TBLHAYVAN] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLKATEGORILER] ON 

INSERT [dbo].[TBLKATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (2, N'Kedi')
INSERT [dbo].[TBLKATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (3, N'Köpek')
INSERT [dbo].[TBLKATEGORILER] ([KATEGORIID], [KATEGORIAD]) VALUES (4, N'Kuş')
SET IDENTITY_INSERT [dbo].[TBLKATEGORILER] OFF
GO
ALTER TABLE [dbo].[TBLHAYVAN]  WITH CHECK ADD  CONSTRAINT [FK_TBLHAYVAN_TBLKATEGORILER] FOREIGN KEY([HAYVANKATEGORI])
REFERENCES [dbo].[TBLKATEGORILER] ([KATEGORIID])
GO
ALTER TABLE [dbo].[TBLHAYVAN] CHECK CONSTRAINT [FK_TBLHAYVAN_TBLKATEGORILER]
GO
USE [master]
GO
ALTER DATABASE [HayvanSahiplenme] SET  READ_WRITE 
GO
