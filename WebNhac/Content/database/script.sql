USE [master]
GO
/****** Object:  Database [NgheNhac]    Script Date: 7/28/2020 10:58:16 AM ******/
CREATE DATABASE [NgheNhac]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NgheNhac', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NgheNhac.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NgheNhac_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NgheNhac_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NgheNhac] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NgheNhac].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NgheNhac] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NgheNhac] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NgheNhac] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NgheNhac] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NgheNhac] SET ARITHABORT OFF 
GO
ALTER DATABASE [NgheNhac] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NgheNhac] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NgheNhac] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NgheNhac] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NgheNhac] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NgheNhac] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NgheNhac] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NgheNhac] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NgheNhac] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NgheNhac] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NgheNhac] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NgheNhac] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NgheNhac] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NgheNhac] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NgheNhac] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NgheNhac] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NgheNhac] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NgheNhac] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NgheNhac] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NgheNhac] SET  MULTI_USER 
GO
ALTER DATABASE [NgheNhac] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NgheNhac] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NgheNhac] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NgheNhac] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NgheNhac]
GO
/****** Object:  Table [dbo].[tbAdmin]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbAdmin](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[TenAdmin] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[VaiTro] [bit] NULL,
 CONSTRAINT [PK_tbAdmin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbAlbumCaNhan]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlbumCaNhan](
	[MaAlbumCaNhan] [int] IDENTITY(1,1) NOT NULL,
	[MaNhac] [int] NULL,
	[NgayThem] [datetime] NULL,
	[MaNguoiDung] [int] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[MaAlbumCaNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbBinhLuan]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbBinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[NoiDungBinhLuan] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[MaNhac] [int] NULL,
	[MaND] [int] NULL,
 CONSTRAINT [PK_tbBinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbCaSi]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCaSi](
	[MaCaSi] [int] IDENTITY(1,1) NOT NULL,
	[TenCaSi] [nvarchar](30) NULL,
	[AnhCaSi] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbCaSi] PRIMARY KEY CLUSTERED 
(
	[MaCaSi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbNguoiDung]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbNguoiDung](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[TenND] [nvarchar](30) NOT NULL,
	[TaiKhoan] [varchar](30) NULL,
	[MatKhau] [nvarchar](30) NULL,
	[NgayTao] [datetime] NULL,
	[Token] [nvarchar](max) NULL,
	[Email] [varchar](150) NULL,
 CONSTRAINT [PK_tbNguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbNhac]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNhac](
	[MaNhac] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiHat] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[LoiBaiHat] [nvarchar](max) NULL,
	[Nhac] [nvarchar](max) NULL,
	[LuotXem] [int] NULL,
	[LinkTaiVe] [nvarchar](max) NULL,
	[LuotLike] [int] NULL,
	[MaTheLoai] [int] NULL,
	[MaQuocGia] [int] NULL,
	[NgayDang] [datetime] NULL,
 CONSTRAINT [PK_tbNhac] PRIMARY KEY CLUSTERED 
(
	[MaNhac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbQuocGia]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbQuocGia](
	[MaQuocGia] [int] IDENTITY(1,1) NOT NULL,
	[TenQuocGia] [nvarchar](50) NULL,
	[AnhQuocGia] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbQuocGia] PRIMARY KEY CLUSTERED 
(
	[MaQuocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbTheLoai]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTheLoai](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](20) NULL,
	[AnhTheloai] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbTheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbTrinhBay]    Script Date: 7/28/2020 10:58:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTrinhBay](
	[MaTrinhBay] [int] IDENTITY(1,1) NOT NULL,
	[MaNhac] [int] NULL,
	[MaCaSi] [int] NULL,
 CONSTRAINT [PK_tbTrinhBay] PRIMARY KEY CLUSTERED 
(
	[MaTrinhBay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbAdmin] ON 

INSERT [dbo].[tbAdmin] ([MaAdmin], [TaiKhoan], [MatKhau], [TenAdmin], [NgayTao], [VaiTro]) VALUES (1, N'hieudn', N'123', N'Hiếu', CAST(0x0000AC0500000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbAdmin] OFF
SET IDENTITY_INSERT [dbo].[tbBinhLuan] ON 

INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (1, N'nhac hay qua', CAST(0x0000AC0500ECF8F7 AS DateTime), 11, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (2, N'giọng chị nghe phê quá :)', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (3, N'haha', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (4, N'ha', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (5, N'ha', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (6, N'ha', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (7, N'h', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (8, N'ah', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (9, N'ah', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (10, N'a', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (11, N'ha', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (12, N'ha', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
INSERT [dbo].[tbBinhLuan] ([MaBinhLuan], [NoiDungBinhLuan], [NgayDang], [MaNhac], [MaND]) VALUES (13, N'ha', CAST(0x0000AC0500ECF8F7 AS DateTime), 1, 3)
SET IDENTITY_INSERT [dbo].[tbBinhLuan] OFF
SET IDENTITY_INSERT [dbo].[tbCaSi] ON 

INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (1, N'Sơn Tùng-MTP', N'SonTung.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (2, N'Bích Phương', N'BichPhuong.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (3, N'Yua Mikami', N'yua_mikami.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (4, N'Đức Phúc', N'DucPhuc.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (5, N'Erik', N'Erik.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (6, N'Hiền Hồ', N'Hiền Hồ.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (7, N'Jack-KICM', N'Jack.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (8, N'Lou Hoàng', N'LouHoang.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (9, N'Min', N'Min.jpg')
INSERT [dbo].[tbCaSi] ([MaCaSi], [TenCaSi], [AnhCaSi]) VALUES (10, N'BTS', N'BTS.jpg')
SET IDENTITY_INSERT [dbo].[tbCaSi] OFF
SET IDENTITY_INSERT [dbo].[tbNguoiDung] ON 

INSERT [dbo].[tbNguoiDung] ([MaND], [TenND], [TaiKhoan], [MatKhau], [NgayTao], [Token], [Email]) VALUES (1, N'Hieu', N'duchieudndh', N'123', CAST(0x0000AC0600000000 AS DateTime), N'dfcc9972-58a7-48bc-8d03-bc2bfab6c4a8ccccc', N'duchieudndh@gmail.com')
INSERT [dbo].[tbNguoiDung] ([MaND], [TenND], [TaiKhoan], [MatKhau], [NgayTao], [Token], [Email]) VALUES (2, N'thanh', NULL, N'1', CAST(0x0000AC0500D1C6F8 AS DateTime), N'dfcc9972-58a7-48bc-8d03-bc2bfab6c4a8', N'thanh@gmail.com')
INSERT [dbo].[tbNguoiDung] ([MaND], [TenND], [TaiKhoan], [MatKhau], [NgayTao], [Token], [Email]) VALUES (3, N'thanh', NULL, N'1', CAST(0x0000AC0500D8751C AS DateTime), N'2f5d09ad-6356-4644-8560-e8402c56f7ce', N'ttcode.er@gmail.com')
SET IDENTITY_INSERT [dbo].[tbNguoiDung] OFF
SET IDENTITY_INSERT [dbo].[tbNhac] ON 

INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (1, N'Hãy Trao Cho Anh', N'HayTraoChoAnh.jpg', N'Không Có', N'Hay Trao Cho Anh.mp3', 12, NULL, 12, 1, 1, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (2, N'Anh Đã Quen Với Cô Đơn', N'Anh Da Quen Voi Co Don.jpg', N'Không Có', N'Anh-Da-Quen-Voi-Co-Don-Soobin-Hoang-Son.mp3', 12, NULL, 2452, 5, 3, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (3, N'Ánh Nắng Của Anh', N'Anh Nang Cua Anh.jpg', N'Không Có', N'Anh-Nang-Cua-Anh-Cho-Em-Den-Ngay-Mai-OST-Duc-Phuc.mp3', 12, NULL, 452, 2, 4, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (4, N'Anh Ở Đây Mà', N'Anh O Day Ma.jpg', N'Không Có', N'Anh-O-Day-Ma-Duc-Phuc.mp3', 1, NULL, 452, 8, 5, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (5, N'Chạm Đáy Nỗi Đau', N'Cham Day Noi Dau.jpg', N'Không Có', N'Cham-Day-Noi-Dau-ERIK.mp3', 2, NULL, 452, 7, 3, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (6, N'Có Em Chờ', N'Co Em Cho.jpg', N'Không Có', N'Co-Em-Cho-MIN-Mr-A.mp3', 3, NULL, 4, 6, 2, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (7, N'Cô Gái Đến Từ Hôm Qua', N'Co Gai Ngay Hom Qua.jpg', N'Không Có', N'Co-Gai-Ngay-Hom-Qua-Co-Gai-Den-Tu-Hom-Qua-OST-Miu-Le.mp3', 12, NULL, 24, 4, 3, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (8, N'Idol', N'Idol.jpg', N'Không Có', N'IDOL - BTS.mp3', 3, NULL, 24, 2, 5, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (9, N'Tự Tâm', N'TuTam.jpg', N'Không Có', N'TuTam-NguyenTranTrungQuan-6131334.mp3', 1, NULL, 24, 3, 1, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (10, N'Simple Love', N'Simple Love.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 31, NULL, 2, 5, 1, CAST(0x0000AB2900000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (11, N'Simple Love', N'HayTraoChoAnh.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 21, NULL, 1, NULL, 1, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (12, N'Có Em Chờ', N'Co Gai Ngay Hom Qua.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 3, NULL, 41, 1, 2, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (13, N'Simple Love', N'Simple Love.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 554, NULL, 223, 2, 3, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (14, N'Simple Love', N'Simple Love.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 634, NULL, 523, 3, 4, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (15, N'Có Em Chờ', N'Co Em Cho.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 557, NULL, 43, 4, 5, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (16, N'Simple Love', N'Simple Love.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 56, NULL, 5, 5, 6, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (17, N'Simple Love', N'Simple Love.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 65457, NULL, 41, 6, 7, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (18, N'Có Em Chờ', N'Cham Day Noi Dau.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 2, NULL, 34, 7, 4, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (19, N'Simple Love', N'Simple Love.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 45, NULL, 51, 8, 2, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (20, N'Simple Love', N'Simple Love.jpg', N'Đôi chân dạo quanh nơi khắp phố xá bụi bay vào mắt yah Bụng reo đói mãi anh tấp vô shop mua ly mì gói yah Đập vào đôi mắt anh muốn chới với woah omg wao Nàng tựa là ai xinh đến đắm đuối không may thì ngất  Đứng chết im tức khắc nàng nhẹ nhàng lướt qua Tiếng sét ái tình đã đánh xem như duyên chúng ta Tay buông cả ly mì xuống nhiều người nhìn quá đê Anh không nói tiếng hàn quốc nhưng biết nói saranghae  Lỡ đứng mộng mơ em đi đâu mất yah I''m fall in love yah Đôi chân chạy nhanh hết tốc ngóc ngách to find you girl yah Em trôi thật mau giữa đám đông bon chen người qua yah  Anh mãi chạy theo sau bóng em dẫu xa thật xa yah` Lạc vào hình bóng nàng nét tinh tươm xinh ghê yah Em tựa tiên chốn nào ghé sang qua nơi anh vậy Mỗi ngày ngâu đỏ mềm khiến anh như thẫn ra yah yah  Thôi thì đã lỡ rồi trót yêu luôn em nha yah yah` Simple love girl Simple love girl Simple love simple love oh simple love girl', N'Simple-Love-Obito-Seachains-Davis.mp3', 32, NULL, 3, 1, 3, CAST(0x0000AC0400000000 AS DateTime))
INSERT [dbo].[tbNhac] ([MaNhac], [TenBaiHat], [HinhAnh], [LoiBaiHat], [Nhac], [LuotXem], [LinkTaiVe], [LuotLike], [MaTheLoai], [MaQuocGia], [NgayDang]) VALUES (22, N'test', N'yua_mikami.jpg', N'cc', N'Em-La-Ba-Noi-Cua-Anh-Trong-Hieu.mp3', 0, NULL, NULL, 2, 2, CAST(0x0000AC0600AEF18C AS DateTime))
SET IDENTITY_INSERT [dbo].[tbNhac] OFF
SET IDENTITY_INSERT [dbo].[tbQuocGia] ON 

INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (1, N'Việt Nam', N'Us-Uk.jpg')
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (2, N'Nhật Bản', N'Us-Uk.jpg')
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (3, N'Âu Mỹ', N'Us-Uk.jpg')
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (4, N'Hàn Quốc', N'K-pop.jpg')
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (5, N'Trung Quốc', N'NhacTrung.jpg')
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (6, N'Thái Lan', N'Us-Uk.jpg')
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (7, N'Ấn Độ', N'Us-Uk.jpg')
SET IDENTITY_INSERT [dbo].[tbQuocGia] OFF
SET IDENTITY_INSERT [dbo].[tbTheLoai] ON 

INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (1, N'Nhạc Trẻ', N'Tre.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (2, N'Night Core', N'Aucotis.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (3, N'Anime', N'Aucotis.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (4, N'Trữ tình', N'Aucotis.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (5, N'Bolero', N'Bolero.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (6, N'Cover', N'Aucotis.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (7, N'Nhạc Hot', N'Aucotis.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (8, N'EDM', N'Aucotis.jpg')
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (10, N'tesst', N'yua_mikami.jpg')
SET IDENTITY_INSERT [dbo].[tbTheLoai] OFF
SET IDENTITY_INSERT [dbo].[tbTrinhBay] ON 

INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (1, 1, 1)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (2, 2, 2)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (3, 3, 3)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (4, 4, 4)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (5, 5, 5)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (6, 6, 6)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (7, 7, 7)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (8, 7, 8)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (9, 8, 9)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (10, 9, 10)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (11, 10, 10)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (12, 10, 9)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (13, 11, 8)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (14, 11, 7)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (15, 12, 6)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (16, 13, 5)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (17, 14, 4)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (18, 15, 3)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (19, 16, 2)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (20, 17, 1)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (21, 17, 2)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (22, 17, 3)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (23, 18, 4)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (24, 19, 5)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (25, 20, 6)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (27, 20, 7)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (28, 22, 3)
INSERT [dbo].[tbTrinhBay] ([MaTrinhBay], [MaNhac], [MaCaSi]) VALUES (32, 22, 4)
SET IDENTITY_INSERT [dbo].[tbTrinhBay] OFF
ALTER TABLE [dbo].[tbAlbumCaNhan]  WITH CHECK ADD  CONSTRAINT [FK_tbAlbumCaNhan_tbNguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[tbNguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[tbAlbumCaNhan] CHECK CONSTRAINT [FK_tbAlbumCaNhan_tbNguoiDung]
GO
ALTER TABLE [dbo].[tbAlbumCaNhan]  WITH CHECK ADD  CONSTRAINT [FK_tbAlbumCaNhan_tbNhac] FOREIGN KEY([MaNhac])
REFERENCES [dbo].[tbNhac] ([MaNhac])
GO
ALTER TABLE [dbo].[tbAlbumCaNhan] CHECK CONSTRAINT [FK_tbAlbumCaNhan_tbNhac]
GO
ALTER TABLE [dbo].[tbBinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_tbBinhLuan_tbNguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[tbNguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[tbBinhLuan] CHECK CONSTRAINT [FK_tbBinhLuan_tbNguoiDung]
GO
ALTER TABLE [dbo].[tbBinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_tbBinhLuan_tbNhac] FOREIGN KEY([MaNhac])
REFERENCES [dbo].[tbNhac] ([MaNhac])
GO
ALTER TABLE [dbo].[tbBinhLuan] CHECK CONSTRAINT [FK_tbBinhLuan_tbNhac]
GO
ALTER TABLE [dbo].[tbNhac]  WITH CHECK ADD  CONSTRAINT [FK_tbNhac_tbQuocGia] FOREIGN KEY([MaQuocGia])
REFERENCES [dbo].[tbQuocGia] ([MaQuocGia])
GO
ALTER TABLE [dbo].[tbNhac] CHECK CONSTRAINT [FK_tbNhac_tbQuocGia]
GO
ALTER TABLE [dbo].[tbNhac]  WITH CHECK ADD  CONSTRAINT [FK_tbNhac_tbTheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[tbTheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[tbNhac] CHECK CONSTRAINT [FK_tbNhac_tbTheLoai]
GO
ALTER TABLE [dbo].[tbTrinhBay]  WITH CHECK ADD  CONSTRAINT [FK_tbTrinhBay_tbCaSi] FOREIGN KEY([MaCaSi])
REFERENCES [dbo].[tbCaSi] ([MaCaSi])
GO
ALTER TABLE [dbo].[tbTrinhBay] CHECK CONSTRAINT [FK_tbTrinhBay_tbCaSi]
GO
ALTER TABLE [dbo].[tbTrinhBay]  WITH CHECK ADD  CONSTRAINT [FK_tbTrinhBay_tbNhac] FOREIGN KEY([MaNhac])
REFERENCES [dbo].[tbNhac] ([MaNhac])
GO
ALTER TABLE [dbo].[tbTrinhBay] CHECK CONSTRAINT [FK_tbTrinhBay_tbNhac]
GO
USE [master]
GO
ALTER DATABASE [NgheNhac] SET  READ_WRITE 
GO
