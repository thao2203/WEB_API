USE [master]
GO
/****** Object:  Database [BTL_API]    Script Date: 7/5/2021 10:03:23 AM ******/
CREATE DATABASE [BTL_API]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTL_API', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BTL_API.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BTL_API_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BTL_API_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BTL_API] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTL_API].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTL_API] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTL_API] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTL_API] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTL_API] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTL_API] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTL_API] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BTL_API] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTL_API] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTL_API] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTL_API] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTL_API] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTL_API] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTL_API] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTL_API] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTL_API] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BTL_API] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTL_API] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTL_API] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTL_API] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTL_API] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTL_API] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTL_API] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTL_API] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BTL_API] SET  MULTI_USER 
GO
ALTER DATABASE [BTL_API] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTL_API] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTL_API] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTL_API] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BTL_API] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BTL_API] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BTL_API] SET QUERY_STORE = OFF
GO
USE [BTL_API]
GO
/****** Object:  Table [dbo].[item]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[item_group_id] [int] NULL,
	[item_name] [nvarchar](50) NULL,
	[item_image] [nvarchar](max) NULL,
	[item_price] [float] NULL,
	[item_description] [nvarchar](max) NULL,
 CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemGroup]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemGroup](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[parentid] [int] NULL,
	[Category_Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_itemGroup] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [char](10) NULL,
	[Order_Name] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[total] [nvarchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[OrderDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetail_OrderID] [int] NULL,
	[OrderDetail_Name] [nvarchar](250) NULL,
	[Quantity] [nvarchar](50) NULL,
	[total] [nvarchar](50) NULL,
	[image] [nvarchar](250) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [datetime] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[taikhoan] [nvarchar](50) NULL,
	[matkhau] [nvarchar](50) NULL,
	[role] [nvarchar](150) NULL,
	[image_url] [nvarchar](150) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[item] ON 

INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (11, 1, N'VEGGIE PIZZA', N'https://i.imgur.com/4Fe4utT.jpg', 139000, N'Thành phần: Thịt bò xay, ngô, sốt BBQ, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (12, 1, N'HAWAII PIZZA', N'https://i.imgur.com/aUYjBxM.jpg', 119000, N'Thành phần: Jam bông, dứa, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (13, 1, N'SALAMI PIZZA', N'https://i.imgur.com/gEIMVWu.jpg', 99000, N'Thành phần  Xúc xích Salami, hành tây, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (14, 1, N'BEEFY PIZZA', N'https://i.imgur.com/6JrzavZ.jpg', 89000, N'Thành phần:  Xúc xích Tây Ban Nha, hành tây, ô liu, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (15, 1, N'MEAT LOVERS PIZZA', N'https://i.imgur.com/9IWKte1.jpg', 119000, N'Thành phần:  Xúc xích các loại, jam bông, hành tây, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (16, 1, N'BBQ CHICKEN PIZZA', N'https://i.imgur.com/49VE2zP.jpg', 129000, N'Thành phần: Thịt gà xay, nấm, hành tây, sốt BBQ, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (17, 1, N'SMOKE CHICKEN PIZZA', N'https://i.imgur.com/pPHdepu.jpg', 99000, N'Thành phần: Thịt gà hun khói, hành tây, nấm, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (18, 1, N'MEXICAN PIZZA', N'https://i.imgur.com/4brUQL1.jpg', 79000, N'Thành phần: Thịt bò xay, dứa, sốt BBQ, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (20, 1, N'MARGHERITA PIZZA', N'https://i.imgur.com/L0qbhvg.jpg', 159000, N'Thành phần: Cà chua, nhiều pho mai Mozzarella, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (21, 1, N'CHORIZO PIZZA', N'https://i.imgur.com/KHK3xUl.jpg', 98000, N'Thành phần: Cà chua, nhiều pho mai Mozzarella, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (22, 1, N'MICHIGAN PIZZA', N'https://i.imgur.com/wpHIjhl.jpg', 179000, N'Thành phần: Tôm, cá ngừ, hành tây, ớt xanh, dứa, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (24, 1, N'SEAFOOD PIZZA', N'https://i.imgur.com/ZA6r4Fu.jpg', 129000, N'Thành Phần: Thanh cua, tôm, ớt xanh, hành tây, cà chua, sốt cà chua, pho mai.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (25, 2, N'SƯỜN NƯỚNG BBQ – SIZE M – 350GR', N'https://i.imgur.com/R7jtih6.png', 149000, N'Thành Phần:  Khối lượng: Thịt heo 350gr  Sốt BBQ truyền thống')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (26, 2, N'SƯỜN NƯỚNG BBQ – SIZE M – 500GR', N'https://i.imgur.com/0iDCTXJ.png', 199000, N'Thành Phần:  Khối lượng: Thịt heo 500gr, Sốt BBQ truyền thống')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (27, 3, N'SPAGHETTI BOLOGNESE ', N'https://i.imgur.com/bCnyGtD.jpg', 65000, N'Thành Phần: Sốt bò băm, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (28, 3, N'SPAGHETTI CARBONARA', N'https://i.imgur.com/5IQWpjR.jpg', 75000, N'Thành Phần: Jam bông, nấm, sốt kem trứng, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (29, 3, N'SPAGHETTI SMOKE CHICKEN', N'https://i.imgur.com/DXnOi23.jpg', 85000, N'Thành phần: Thịt gà hun khói, sốt kem trứng, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (30, 3, N'SPAGHETTI RATATOUILLE', N'https://i.imgur.com/jHTBwVJ.jpg', 89000, N'Thành Phần: Xúc xích Chorizo, sốt cà chua rau hầm, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (31, 3, N'SPAGHETTI SEAFOOD', N'https://i.imgur.com/mRuz4Hw.jpg', 119000, N'Thành phần: Mực, tôm, ớt xanh, cà chua, hành tây, sốt cà chua, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (32, 3, N'SPAGHETTI SHRIMP', N'https://i.imgur.com/6vSCpK6.jpg', 159000, N'Thành phần: Tôm, nấm, sốt kem, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (33, 4, N'GARDEN SALAD ', N'https://i.imgur.com/41agEbk.jpg', 49000, N'Thành phần: Xà lách, cà chua, dưa chuột, sốt dầu dấm')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (34, 4, N'SEASONAL SALAD', N'https://i.imgur.com/6YsAXOt.jpg', 69000, N'Thành Phần: Rau theo mùa, thịt gà hun khói, xà lách, sốt Ceasar')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (35, 4, N'NICOISE SALAD', N'https://i.imgur.com/S42s0Sn.jpg', 149000, N'Thành phần: Cá ngừ, trứng, cà chua tươi, hành tây, dưa chuột, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (36, 4, N'CHORIZO SALAD', N'https://i.imgur.com/vf7TjBJ.jpg', 129000, N'Thành phần: Cá hồi, hàu tươi, cà chua bi, dưa chuột, pho mai Parmesan')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (37, 5, N'COCA COLA 390ML', N'https://i.imgur.com/I3ylwoK.jpg', 15000, N'Thành phần: Coca cola chai nhựa 390 ml')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (38, 5, N'COCA COLA 1.5L', N'https://i.imgur.com/JvxYAEb.jpg', 30000, N'Thành phần: Coca cola chai nhựa 1.5 l')
SET IDENTITY_INSERT [dbo].[item] OFF
GO
SET IDENTITY_INSERT [dbo].[itemGroup] ON 

INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (1, 0, N'Pizza')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (2, NULL, N'Sườn BBQ')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (3, NULL, N'Mì Ý')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (4, NULL, N'Salad')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (5, NULL, N'Đồ uống')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (6, 1, N'Pizza Siêu Ngon')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (7, 6, N'Pizza Siêu Siêu Ngon')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (8, 2, N'Sườn BBQ 350g')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (9, 2, N'Sườn BBQ 750g')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (15, 0, N'Combo')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (16, 0, N'Khác')
INSERT [dbo].[itemGroup] ([Category_ID], [parentid], [Category_Name]) VALUES (17, 1, N'VEGGIE PIZZA')
SET IDENTITY_INSERT [dbo].[itemGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (4, N'Hưng Yên', N'0334618813', N'Tuấn Anh', CAST(N'2021-06-26T00:00:00.000' AS DateTime), N'404000', 3)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (6, N'Khoái Châu', N'0334618813', N'Thảo Nguyến', CAST(N'2021-07-04T00:00:00.000' AS DateTime), N'813000', 1)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (9, N'Hưng Yên', N'0334618813', N'Linh Nga', CAST(N'2021-07-04T00:00:00.000' AS DateTime), N'218000', 3)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (14, N'Bình Minh - Khoái Châu', N'0974019488', N'Chu Thảo Ngọc ', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'789000', 1)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (15, N'Văn Giang - Hưng Yên', N'0556396631', N'Mỹ Linh', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'368000', 2)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (16, N'Thạch Thành - Thanh Hóa', N'0368299314', N'Thu Uyên', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'257000', 3)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (17, N'Quê Võ - Bắc Ninh', N'0579247765', N'Gia Huy', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'596000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (18, N'Thanh Tùng - Hải Dương', N'0473628943', N'Văn Tùng', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'416000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (19, N'Bình Kiều - Khoái Châu', N'0647328832', N'Nguyễn Phong', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'398000', 2)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (20, N'Hàm Tử - Khoái Châu', N'0936352654', N'Hồng Hạnh', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'313000', 1)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (21, N'Hoa Sơn - Hải Dương', N'0337928863', N'Công Minh', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'288000', 3)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (22, N'Cầu Giấy - Hà Nội', N'0237329382', N'Hoàng Dương', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'362000', 2)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (23, N'Tân Dân - Khoái Châu', N'0762351763', N'Đình Thụy', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'358000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (24, N'Tống Duy Tân - Đinh Hải', N'0972637266', N'Quang Minh', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'338000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (25, N'Việt Trì - Phú Thọ', N'0833412632', N'Linh Dương', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'422000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (26, N'Gia Định - Hải Phòng', N'0637348737', N'Bùi Hiếu', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'581000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (27, N'Hứa Yên - Ninh Bình', N'0634273526', N'Minh Đoàn', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'317000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (28, N'Tra Trang - Thái Bình', N'0564355456', N'Bá Hùng', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'546000', 0)
INSERT [dbo].[order] ([Order_ID], [Address], [Phone], [Order_Name], [CreatedDate], [total], [status]) VALUES (29, N'41 Đỗ Thế Diên', N'0334618813', N'Tuấn Anh', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'525000', 0)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetail] ON 

INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (5, 6, N'HAWAII PIZZA', N'4', N'476000', NULL)
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (6, 6, N'SALAMI PIZZA', N'1', N'99000', NULL)
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (7, 6, N'VEGGIE PIZZA', N'1', N'139000', NULL)
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (8, 6, N'SMOKE CHICKEN PIZZA', N'1', N'99000', NULL)
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (13, 9, N'HAWAII PIZZA', N'1', N'119000', N'https://i.imgur.com/aUYjBxM.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (14, 9, N'SALAMI PIZZA', N'1', N'99000', N'https://i.imgur.com/gEIMVWu.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (51, 4, N'MEAT LOVERS PIZZA', N'1', N'119000', N'https://i.imgur.com/9IWKte1.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (52, 4, N'SPAGHETTI BOLOGNESE ', N'1', N'65000', N'https://i.imgur.com/bCnyGtD.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (53, 14, N'VEGGIE PIZZA', N'2', N'278000', N'https://i.imgur.com/4Fe4utT.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (54, 14, N'HAWAII PIZZA', N'2', N'238000', N'https://i.imgur.com/aUYjBxM.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (55, 14, N'SEASONAL SALAD', N'1', N'69000', N'https://i.imgur.com/6YsAXOt.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (56, 14, N'COCA COLA 1.5L', N'3', N'90000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (57, 14, N'COCA COLA 390ML', N'1', N'15000', N'https://i.imgur.com/I3ylwoK.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (58, 14, N'SALAMI PIZZA', N'1', N'99000', N'https://i.imgur.com/gEIMVWu.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (59, 15, N'SƯỜN NƯỚNG BBQ – SIZE M – 350GR', N'1', N'149000', N'https://i.imgur.com/R7jtih6.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (60, 15, N'SPAGHETTI SHRIMP', N'1', N'159000', N'https://i.imgur.com/6vSCpK6.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (61, 15, N'COCA COLA 1.5L', N'2', N'60000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (62, 16, N'CHORIZO PIZZA', N'1', N'98000', N'https://i.imgur.com/KHK3xUl.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (63, 16, N'SPAGHETTI BOLOGNESE ', N'1', N'65000', N'https://i.imgur.com/bCnyGtD.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (64, 16, N'GARDEN SALAD ', N'1', N'49000', N'https://i.imgur.com/41agEbk.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (65, 16, N'COCA COLA 390ML', N'3', N'45000', N'https://i.imgur.com/I3ylwoK.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (71, 18, N'GARDEN SALAD ', N'1', N'49000', N'https://i.imgur.com/41agEbk.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (72, 18, N'BEEFY PIZZA', N'1', N'89000', N'https://i.imgur.com/6JrzavZ.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (73, 18, N'SMOKE CHICKEN PIZZA', N'1', N'99000', N'https://i.imgur.com/pPHdepu.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (74, 18, N'SPAGHETTI RATATOUILLE', N'1', N'89000', N'https://i.imgur.com/jHTBwVJ.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (75, 18, N'COCA COLA 1.5L', N'3', N'90000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (76, 19, N'VEGGIE PIZZA', N'1', N'139000', N'https://i.imgur.com/4Fe4utT.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (77, 19, N'SƯỜN NƯỚNG BBQ – SIZE M – 500GR', N'1', N'199000', N'https://i.imgur.com/0iDCTXJ.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (78, 19, N'COCA COLA 390ML', N'4', N'60000', N'https://i.imgur.com/I3ylwoK.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (79, 20, N'NICOISE SALAD', N'1', N'149000', N'https://i.imgur.com/S42s0Sn.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (80, 20, N'COCA COLA 390ML', N'1', N'15000', N'https://i.imgur.com/I3ylwoK.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (81, 20, N'SƯỜN NƯỚNG BBQ – SIZE M – 350GR', N'1', N'149000', N'https://i.imgur.com/R7jtih6.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (82, 21, N'MARGHERITA PIZZA', N'1', N'159000', N'https://i.imgur.com/L0qbhvg.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (83, 21, N'SMOKE CHICKEN PIZZA', N'1', N'99000', N'https://i.imgur.com/pPHdepu.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (84, 21, N'COCA COLA 1.5L', N'1', N'30000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (85, 22, N'CHORIZO PIZZA', N'1', N'98000', N'https://i.imgur.com/KHK3xUl.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (86, 22, N'SƯỜN NƯỚNG BBQ – SIZE M – 350GR', N'1', N'149000', N'https://i.imgur.com/R7jtih6.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (87, 22, N'SPAGHETTI SMOKE CHICKEN', N'1', N'85000', N'https://i.imgur.com/DXnOi23.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (88, 22, N'COCA COLA 1.5L', N'1', N'30000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (89, 23, N'CHORIZO SALAD', N'1', N'129000', N'https://i.imgur.com/vf7TjBJ.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (90, 23, N'SƯỜN NƯỚNG BBQ – SIZE M – 500GR', N'1', N'199000', N'https://i.imgur.com/0iDCTXJ.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (91, 23, N'COCA COLA 1.5L', N'1', N'30000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (92, 24, N'HAWAII PIZZA', N'2', N'238000', N'https://i.imgur.com/aUYjBxM.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (93, 24, N'SPAGHETTI SMOKE CHICKEN', N'1', N'85000', N'https://i.imgur.com/DXnOi23.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (94, 24, N'COCA COLA 390ML', N'1', N'15000', N'https://i.imgur.com/I3ylwoK.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (95, 25, N'MEXICAN PIZZA', N'1', N'79000', N'https://i.imgur.com/4brUQL1.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (96, 25, N'SPAGHETTI CARBONARA', N'1', N'75000', N'https://i.imgur.com/5IQWpjR.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (97, 25, N'SƯỜN NƯỚNG BBQ – SIZE M – 500GR', N'1', N'199000', N'https://i.imgur.com/0iDCTXJ.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (98, 25, N'SEASONAL SALAD', N'1', N'69000', N'https://i.imgur.com/6YsAXOt.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (99, 26, N'HAWAII PIZZA', N'1', N'119000', N'https://i.imgur.com/aUYjBxM.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (100, 26, N'MICHIGAN PIZZA', N'1', N'179000', N'https://i.imgur.com/wpHIjhl.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (101, 26, N'SPAGHETTI BOLOGNESE ', N'1', N'65000', N'https://i.imgur.com/bCnyGtD.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (102, 26, N'SPAGHETTI RATATOUILLE', N'1', N'89000', N'https://i.imgur.com/jHTBwVJ.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (103, 26, N'SEASONAL SALAD', N'1', N'69000', N'https://i.imgur.com/6YsAXOt.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (104, 26, N'COCA COLA 1.5L', N'2', N'60000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (105, 27, N'SPAGHETTI SEAFOOD', N'1', N'119000', N'https://i.imgur.com/mRuz4Hw.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (106, 27, N'GARDEN SALAD ', N'1', N'49000', N'https://i.imgur.com/41agEbk.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (107, 27, N'SƯỜN NƯỚNG BBQ – SIZE M – 350GR', N'1', N'149000', N'https://i.imgur.com/R7jtih6.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (108, 28, N'SMOKE CHICKEN PIZZA', N'1', N'99000', N'https://i.imgur.com/pPHdepu.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (109, 28, N'SƯỜN NƯỚNG BBQ – SIZE M – 500GR', N'1', N'199000', N'https://i.imgur.com/0iDCTXJ.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (110, 28, N'COCA COLA 1.5L', N'1', N'30000', N'https://i.imgur.com/JvxYAEb.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (111, 28, N'SEASONAL SALAD', N'1', N'69000', N'https://i.imgur.com/6YsAXOt.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (112, 28, N'NICOISE SALAD', N'1', N'149000', N'https://i.imgur.com/S42s0Sn.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (119, 29, N'BBQ CHICKEN PIZZA', N'2', N'258000', N'https://i.imgur.com/49VE2zP.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (120, 29, N'SMOKE CHICKEN PIZZA', N'2', N'198000', N'https://i.imgur.com/pPHdepu.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (121, 29, N'SEASONAL SALAD', N'1', N'69000', N'https://i.imgur.com/6YsAXOt.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (123, 17, N'SƯỜN NƯỚNG BBQ – SIZE M – 500GR', N'1', N'199000', N'https://i.imgur.com/0iDCTXJ.png')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (124, 17, N'SPAGHETTI SHRIMP', N'1', N'159000', N'https://i.imgur.com/6vSCpK6.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (125, 17, N'MEAT LOVERS PIZZA', N'1', N'119000', N'https://i.imgur.com/9IWKte1.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (126, 17, N'BEEFY PIZZA', N'1', N'89000', N'https://i.imgur.com/6JrzavZ.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (127, 17, N'VEGGIE PIZZA', N'1', N'139000', N'https://i.imgur.com/4Fe4utT.jpg')
INSERT [dbo].[orderDetail] ([OrderDetail_ID], [OrderDetail_OrderID], [OrderDetail_Name], [Quantity], [total], [image]) VALUES (128, 17, N'SMOKE CHICKEN PIZZA', N'1', N'99000', N'https://i.imgur.com/pPHdepu.jpg')
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (1, N'Thảo Nguyễn', CAST(N'2000-03-22T00:00:00.000' AS DateTime), N'Khoái Châu - Hưng Yên', N'Nữ', N'thaong22.03@gmail.com', N'thaonguyen', N'22032000', NULL, NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (2, N'Tuấn Anh', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'Mỹ Hào - Hưng Yên', N'Nam', N'tuananh1212@gmail.com', N'tuananh', N'12122000', NULL, NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (3, N'Đức Anh', CAST(N'2006-11-18T00:00:00.000' AS DateTime), N'Khoái Châu - Hưng Yên', N'Nam', N'ducanh1811@gmail.com', N'ducanh', N'18112006', NULL, NULL)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
/****** Object:  StoredProcedure [dbo].[oderdetail]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oderdetail]
( 
 @OrderDetail_OrderID          NVARCHAR(50), 
 @OrderDetail_Name          NVARCHAR(200),  
 @Quantity NVARCHAR(MAX),
 @image NVARCHAR(150),
 @total		VARCHAR(50)
)
AS
    BEGIN
        INSERT INTO orderDetail
                (
                 OrderDetail_OrderID, 
                 OrderDetail_Name,
				 Quantity,
				 image,
				 total
                )
                VALUES
                (
                 @OrderDetail_OrderID, 
                 @OrderDetail_Name,
				 @Quantity,
				 @image,
				 @total
                );
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_chi_tiet_hoa_don]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_chi_tiet_hoa_don](@Order_ID int)
AS
    BEGIN
        SELECT [orderDetail].*
		FROM [dbo].[orderDetail]
		where OrderDetail_OrderID = @Order_ID
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_hoa_don_delete]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_hoa_don_delete]
(@ma_hoa_don              varchar(50) 
)
AS
    BEGIN
		delete from [dbo].[orderDetail] where OrderDetail_OrderID = @ma_hoa_don;
		delete from [dbo].[order] where Order_ID = @ma_hoa_don;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_hoa_don_get_by_id]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CReate PROCEDURE [dbo].[sp_hoa_don_get_by_id](@Order_ID int)
AS
    BEGIN
        SELECT * 
		FROM [dbo].[order]
		where Order_ID = @Order_ID
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_hoa_don_status]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CReate PROCEDURE [dbo].[sp_hoa_don_status](@status int)
AS
    BEGIN
        SELECT * 
		FROM [dbo].[order]
		where [order].status = @status
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_hoa_don_updatStatus]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CReate PROCEDURE [dbo].[sp_hoa_don_updatStatus](@status int, @id int)
AS
Begin
 Update [dbo].[order] set status=@status where Order_ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_item_all]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_item_all]
(@page int)
as
begin
SELECT *,COUNT(item_id) over () as total
FROM item
ORDER BY item.item_id desc Offset 10*(@page-1) Rows Fetch next 10 rows only
end
GO
/****** Object:  StoredProcedure [dbo].[sp_item_all_nonepage]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_item_all_nonepage] as
begin
    select * from dbo.item
end
GO
/****** Object:  StoredProcedure [dbo].[sp_item_all_pageout]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_all_pageout]

as
SELECT *
FROM item

exec sp_item_all

GO
/****** Object:  StoredProcedure [dbo].[sp_item_create]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_create]
( 
 @item_group_id       INT, 
 @item_image          VARCHAR(MAX), 
 @item_name           NVARCHAR(50), 
 @item_price          FLOAT,
 @item_description	  NVARCHAR(MAX)
)
AS
    BEGIN
      INSERT INTO item
                (
                 item_group_id, 
                 item_image, 
                 item_name, 
                 item_price,
				 item_description
                )
                VALUES
                (
                 @item_group_id, 
                 @item_image, 
                 @item_name, 
                 @item_price,
				 @item_description
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_delete]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_delete]
(@id int)
as
begin
	delete item where item_id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_item_get_by_cate]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_get_by_cate](@item_group_id int)
AS
    BEGIN
        SELECT *
        FROM item
		where  item.item_group_id = @item_group_id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_get_by_id]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_get_by_id](@item_id VARCHAR(50))
AS
    BEGIN
        SELECT *
        FROM item
		where  item.item_id = @item_id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_all_pageout]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_group_all_pageout]
as
SELECT *
FROM itemGroup
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_create]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_group_create]
(
 @Category_name		nvarchar(150) ,
 @parentid		int
)
AS
    BEGIN
      INSERT INTO [itemGroup]
                (
					 Category_name,
					 parentid  
				)
                VALUES
                (
				 @Category_name, 
				 @parentid       
				);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_delete]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_group_delete]
(@item_group_id       INT 
)
AS
    BEGIN
		delete from [itemGroup] where Category_ID = @item_group_id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_get_by_id]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_group_get_by_id]
(@Category_ID    int)
AS
    BEGIN
		select * from [itemGroup] where Category_ID = @Category_ID;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_get_data]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_group_get_data]
(@page int)
AS
    BEGIN
        SELECT *,COUNT(Category_ID) over () as total
        FROM itemGroup
		ORDER BY Category_ID desc Offset 10*(@page-1) Rows Fetch next 10 rows only
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_search]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_group_search] 
(
 @page_index  INT, 
 @page_size   INT
)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF @page_size <> 0
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY Category_Name ASC)) AS RowNumber, 
                              i.Category_ID, 
							  i.Category_Name
                        INTO #Results1
                        FROM [itemGroup] AS i
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
        end;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_update]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_group_update]
(@Category_ID     INT, 
 @parentid      INT, 
 @Category_Name           NVARCHAR(150)
)
as
	begin
		update itemGroup
		set parentid = @parentid, Category_Name = @Category_Name
		where Category_ID = @Category_ID
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_item_search]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_search] 
(@page_index  INT, 
 @page_size   INT,
 @item_group_id Nvarchar(50))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF @page_size <> 0 AND @item_group_id <> NULL
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY item_name ASC)) AS RowNumber, 
                              i.item_id, 
                              i.item_group_id, 
                              i.item_name , 
                              i.item_image, 
                              i.item_price,
							  i.item_description
                        INTO #Results1
                        FROM [item] AS i
					    WHERE i.item_group_id = @item_group_id;                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
		IF(@item_group_id IS NULL)
			BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY item_name ASC)) AS RowNumber, 
                              i.item_id, 
                              i.item_group_id, 
                              i.item_name , 
                              i.item_image, 
                              i.item_price,
							  i.item_description
                        INTO #Results3
                        FROM [item] AS i					              
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results3;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results3
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results3; 
            END;
			
        ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                               ORDER BY item_name ASC)) AS RowNumber, 
                              i.item_id, 
                              i.item_group_id, 
                              i.item_name , 
                              i.item_image, 
                              i.item_price,
							  i.item_description
                        INTO #Results2
                        FROM [item] AS i
						WHERE i.item_group_id = @item_group_id;  
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;

    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_update]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_item_update]
(@item_id             INT, 
 @item_group_id       INT, 
 @item_image          VARCHAR(MAX), 
 @item_name           NVARCHAR(50), 
 @item_price          FLOAT,
 @item_description	  NVARCHAR(MAX)
)
as
begin
	update item 
	set item_name = @item_name, item_price = @item_price, item_image = @item_image, item_group_id = @item_group_id, item_description = @item_description
	where item_id = @item_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_user_all]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_user_all]
as
	SELECT *
	FROM [dbo].[user]
GO
/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 7/5/2021 10:03:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_user_delete]
(@user_id     int 
)
AS
    BEGIN
		delete from [user] where user_id = @user_id;
        SELECT '';
    END;
GO
USE [master]
GO
ALTER DATABASE [BTL_API] SET  READ_WRITE 
GO
