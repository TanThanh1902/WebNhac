USE [master]
GO
/****** Object:  Database [NgheNhac]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbAlbum]    Script Date: 7/26/2020 1:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlbum](
	[MaAlbum] [int] IDENTITY(1,1) NOT NULL,
	[TenAlbum] [nvarchar](50) NULL,
	[AnhAlbum] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[MaND] [int] NULL,
 CONSTRAINT [PK_tbAlbum] PRIMARY KEY CLUSTERED 
(
	[MaAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbAlbumCaNhan]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbAlbumDSNhac]    Script Date: 7/26/2020 1:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlbumDSNhac](
	[MaAlbumDSNhac] [int] IDENTITY(1,1) NOT NULL,
	[MaAlbum] [int] NULL,
	[MaNhac] [int] NULL,
 CONSTRAINT [PK_AlbumDSNhac] PRIMARY KEY CLUSTERED 
(
	[MaAlbumDSNhac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbBanner]    Script Date: 7/26/2020 1:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbBanner](
	[MaBanner] [int] IDENTITY(1,1) NOT NULL,
	[Banner] [nvarchar](max) NULL,
	[MaNhac] [int] NULL,
 CONSTRAINT [PK_tbBanner] PRIMARY KEY CLUSTERED 
(
	[MaBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbBinhLuan]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbCaSi]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbNguoiDung]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbNhac]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbQuocGia]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbTheLoai]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbTraLoi]    Script Date: 7/26/2020 1:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTraLoi](
	[MaTraLoi] [int] IDENTITY(1,1) NOT NULL,
	[NoiDungTraLoi] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[MaBinhLuan] [int] NULL,
	[MaND] [int] NULL,
 CONSTRAINT [PK_tbTraLoi] PRIMARY KEY CLUSTERED 
(
	[MaTraLoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbTrinhBay]    Script Date: 7/26/2020 1:39:52 PM ******/
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
/****** Object:  Table [dbo].[tbYeuThich]    Script Date: 7/26/2020 1:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbYeuThich](
	[MaYeuThich] [int] IDENTITY(1,1) NOT NULL,
	[MaNhac] [int] NULL,
	[MaAlbum] [int] NULL,
 CONSTRAINT [PK_tbYeuThich] PRIMARY KEY CLUSTERED 
(
	[MaYeuThich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbBanner] ON 

INSERT [dbo].[tbBanner] ([MaBanner], [Banner], [MaNhac]) VALUES (1, N'banner_1.jpg', NULL)
INSERT [dbo].[tbBanner] ([MaBanner], [Banner], [MaNhac]) VALUES (2, N'banner_2.jpg', NULL)
INSERT [dbo].[tbBanner] ([MaBanner], [Banner], [MaNhac]) VALUES (3, N'banner_3.jpg', NULL)
SET IDENTITY_INSERT [dbo].[tbBanner] OFF
SET IDENTITY_INSERT [dbo].[tbNguoiDung] ON 

INSERT [dbo].[tbNguoiDung] ([MaND], [TenND], [TaiKhoan], [MatKhau], [NgayTao], [Token], [Email]) VALUES (1, N'Hieu', N'duchieudndh', N'123', NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[tbNhac] OFF
SET IDENTITY_INSERT [dbo].[tbQuocGia] ON 

INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (1, N'Việt Nam', NULL)
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (2, N'Nhật Bản', NULL)
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (3, N'Âu Mỹ', NULL)
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (4, N'Hàn Quốc', NULL)
INSERT [dbo].[tbQuocGia] ([MaQuocGia], [TenQuocGia], [AnhQuocGia]) VALUES (5, N'Trung Quôc', NULL)
SET IDENTITY_INSERT [dbo].[tbQuocGia] OFF
SET IDENTITY_INSERT [dbo].[tbTheLoai] ON 

INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (1, N'Nhạc Trẻ', NULL)
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (2, N'Night Core', NULL)
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (3, N'Anime', NULL)
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (4, N'Trữ tình', NULL)
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (5, N'Bolero', NULL)
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (6, N'Cover', NULL)
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (7, N'Nhạc Hot', NULL)
INSERT [dbo].[tbTheLoai] ([MaTheLoai], [TenTheLoai], [AnhTheloai]) VALUES (8, N'EDM', NULL)
SET IDENTITY_INSERT [dbo].[tbTheLoai] OFF
ALTER TABLE [dbo].[tbAlbum]  WITH CHECK ADD  CONSTRAINT [FK_tbAlbum_tbNguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[tbNguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[tbAlbum] CHECK CONSTRAINT [FK_tbAlbum_tbNguoiDung]
GO
ALTER TABLE [dbo].[tbAlbumCaNhan]  WITH CHECK ADD  CONSTRAINT [FK_tbAlbumCaNhan_tbNhac] FOREIGN KEY([MaNhac])
REFERENCES [dbo].[tbNhac] ([MaNhac])
GO
ALTER TABLE [dbo].[tbAlbumCaNhan] CHECK CONSTRAINT [FK_tbAlbumCaNhan_tbNhac]
GO
ALTER TABLE [dbo].[tbAlbumDSNhac]  WITH CHECK ADD  CONSTRAINT [FK_tbAlbumDSNhac_tbAlbum] FOREIGN KEY([MaAlbum])
REFERENCES [dbo].[tbAlbum] ([MaAlbum])
GO
ALTER TABLE [dbo].[tbAlbumDSNhac] CHECK CONSTRAINT [FK_tbAlbumDSNhac_tbAlbum]
GO
ALTER TABLE [dbo].[tbAlbumDSNhac]  WITH CHECK ADD  CONSTRAINT [FK_tbAlbumDSNhac_tbNhac] FOREIGN KEY([MaNhac])
REFERENCES [dbo].[tbNhac] ([MaNhac])
GO
ALTER TABLE [dbo].[tbAlbumDSNhac] CHECK CONSTRAINT [FK_tbAlbumDSNhac_tbNhac]
GO
ALTER TABLE [dbo].[tbBanner]  WITH CHECK ADD  CONSTRAINT [FK_tbBanner_tbNhac] FOREIGN KEY([MaNhac])
REFERENCES [dbo].[tbNhac] ([MaNhac])
GO
ALTER TABLE [dbo].[tbBanner] CHECK CONSTRAINT [FK_tbBanner_tbNhac]
GO
ALTER TABLE [dbo].[tbBinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_tbBinhLuan_tbNguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[tbNguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[tbBinhLuan] CHECK CONSTRAINT [FK_tbBinhLuan_tbNguoiDung]
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
ALTER TABLE [dbo].[tbTraLoi]  WITH CHECK ADD  CONSTRAINT [FK_tbTraLoi_tbBinhLuan] FOREIGN KEY([MaBinhLuan])
REFERENCES [dbo].[tbBinhLuan] ([MaBinhLuan])
GO
ALTER TABLE [dbo].[tbTraLoi] CHECK CONSTRAINT [FK_tbTraLoi_tbBinhLuan]
GO
ALTER TABLE [dbo].[tbTraLoi]  WITH CHECK ADD  CONSTRAINT [FK_tbTraLoi_tbNguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[tbNguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[tbTraLoi] CHECK CONSTRAINT [FK_tbTraLoi_tbNguoiDung]
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
ALTER TABLE [dbo].[tbYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_tbYeuThich_tbAlbum] FOREIGN KEY([MaAlbum])
REFERENCES [dbo].[tbAlbum] ([MaAlbum])
GO
ALTER TABLE [dbo].[tbYeuThich] CHECK CONSTRAINT [FK_tbYeuThich_tbAlbum]
GO
USE [master]
GO
ALTER DATABASE [NgheNhac] SET  READ_WRITE 
GO
