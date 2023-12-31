USE [master]
GO
/****** Object:  Database [ProjectSWP391]    Script Date: 6/22/2023 9:44:14 PM ******/
CREATE DATABASE [ProjectSWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectSWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectSWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectSWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectSWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectSWP391] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectSWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectSWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectSWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectSWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectSWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectSWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectSWP391] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectSWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectSWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectSWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectSWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectSWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectSWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectSWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectSWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectSWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectSWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectSWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectSWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectSWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectSWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectSWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectSWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectSWP391] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectSWP391] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectSWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectSWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectSWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectSWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectSWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectSWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectSWP391] SET QUERY_STORE = OFF
GO
USE [ProjectSWP391]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](100) NULL,
	[name] [nvarchar](250) NULL,
	[phone] [varchar](25) NULL,
	[gmail] [nvarchar](255) NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[customer_id] [int] NULL,
	[comment_date] [date] NULL,
	[comment_content] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[gmail] [nvarchar](100) NULL,
	[contact_content] [nvarchar](250) NULL,
	[contact_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[phone] [varchar](25) NULL,
	[image] [nvarchar](250) NULL,
	[dob] [date] NULL,
	[gmail] [nvarchar](255) NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](500) NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[newsgroup_id] [int] NULL,
	[image] [nvarchar](200) NULL,
	[title] [nvarchar](500) NULL,
	[content] [text] NULL,
	[createby] [nvarchar](250) NULL,
	[created_date] [datetime] NULL,
	[modifyby] [nvarchar](250) NULL,
	[modify_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news_group]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news_group](
	[newsgroup_id] [int] IDENTITY(1,1) NOT NULL,
	[newsgroup_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[newsgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[name_receiver] [nvarchar](250) NULL,
	[phone_receiver] [varchar](25) NULL,
	[address_receiver] [nvarchar](500) NULL,
	[total_price] [float] NULL,
	[order_date] [datetime] NULL,
	[payment] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[orderdetail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[customer_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](250) NULL,
	[image] [nvarchar](250) NULL,
	[list_price] [float] NULL,
	[quantity_order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NULL,
	[sub_description] [text] NULL,
	[description] [text] NULL,
	[image] [nvarchar](200) NULL,
	[list_price] [float] NULL,
	[discount] [float] NULL,
	[category_id] [int] NULL,
	[brand_id] [int] NULL,
	[status] [nvarchar](50) NULL,
	[code] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warranty]    Script Date: 6/22/2023 9:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranty](
	[warranty_id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[product_id] [int] NULL,
	[customer_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](250) NULL,
	[product_name] [nvarchar](250) NULL,
	[image] [nvarchar](250) NULL,
	[image_product] [nvarchar](50) NULL,
	[product_status] [nvarchar](50) NULL,
	[warranty_date] [date] NULL,
	[warranty_status] [nvarchar](50) NULL,
	[warrant_quantity] [int] NULL,
	[status] [nvarchar](50) NULL,
	[product_status_admin] [nvarchar](250) NULL,
	[image_product_admin] [nvarchar](250) NULL,
	[warranty_date_admin] [date] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([admin_id], [role], [name], [phone], [gmail], [username], [password], [status]) VALUES (1, N'Admin', N'Đỗ Văn Đạt', N'09685196156', N'dovandat1611@gmail.com', N'dovandat', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Active')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (1, N'Apple')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (2, N'Dell')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (3, N'Lenovo')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (4, N'Asus')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (5, N'Samsung')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (6, N'Xiaomi')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (7, N'Sony')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (8, N'Microsoft')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (9, N'LG')
INSERT [dbo].[brand] ([brand_id], [brand_name]) VALUES (10, N'Acer')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Laptop')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Tablet')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Phone')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([comment_id], [product_id], [customer_id], [comment_date], [comment_content]) VALUES (1, 1, 1, CAST(N'2023-06-08' AS Date), N'Good product')
INSERT [dbo].[comment] ([comment_id], [product_id], [customer_id], [comment_date], [comment_content]) VALUES (2, 33, 3, CAST(N'2023-06-20' AS Date), N'dsdsad')
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (1, N'Đỗ Văn Đạt', N'dovandat1611@gmail.com', N'Page tuyệt vời', CAST(N'2023-05-31' AS Date))
INSERT [dbo].[contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (2, N'Đỗ Văn Đạt', N'dovandat1611@gmail.com', N'Nice Page', CAST(N'2023-06-01' AS Date))
INSERT [dbo].[contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (3, N'Đỗ Văn Đạt', N'dovandat1611@gmail.com', N'Tuyệt Vời', CAST(N'2023-06-01' AS Date))
INSERT [dbo].[contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (4, N'Đỗ Văn Đạt', N'dovandat1611@gmail.com', N'Page bạn cần thêm ...', CAST(N'2023-06-08' AS Date))
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customer_id], [name], [phone], [image], [dob], [gmail], [gender], [address], [username], [password], [status]) VALUES (1, N'Đỗ Văn Đạt', N'0902121881', N'images/avatar/martin.svg', CAST(N'2002-11-16' AS Date), N'dovandat1611@gmail.com', 1, N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', N'dovandat', N'eeeb6c50f1de0cc87fa323d5f84c945658825b175d57146a5a3d337e62a4d5f5', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [image], [dob], [gmail], [gender], [address], [username], [password], [status]) VALUES (2, N'Đỗ Văn Đạt', N'0902121881', NULL, NULL, N'datdvhe161664@fpt.edu.vn', 1, N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', N'datdvhe161664@fpt.edu.vn', N'e7f6feefda045085e39da5e1617ea84e8cf8d0ed8203121eea4b66c66326a7b0', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [image], [dob], [gmail], [gender], [address], [username], [password], [status]) VALUES (3, N'Hiep Hoang', N'0399329525', NULL, CAST(N'2023-06-02' AS Date), N'hiep2k29b@gmail.com', 1, N'Ha Noi', N'hiep2002', N'2d845b006b6613460c69c4defd180954a74ad9a1be6957027c7e6660ef2deecf', N'Active')
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (1, 2, N'images/news/macbook-promo-1.jpg', N'Unveiling the Dell Gaming G15 5520 - A Powerful Gaming Experience', N'<p><strong>Dell,</strong> a renowned name in the gaming industry, is thrilled to introduce the <span style="text-decoration: underline;"><em><strong>Dell Gaming G15 5520,</strong></em></span> the ultimate gaming laptop designed to deliver an immersive gaming experience like no other. The <em><strong><span style="text-decoration: underline;">Dell Gaming G15 5520</span></strong></em> combines powerful hardware, innovative features, and striking design to provide gamers with an exceptional gaming performance.</p>
<p>Powered by the <strong><span style="text-decoration: underline;">latest 11th</span></strong> generation Intel Core processors and equipped with <span style="text-decoration: underline;">NVIDIA</span> GeForce graphics, this laptop is a true powerhouse that can handle the most demanding games with ease. Featuring a <strong><span style="text-decoration: underline;">15.6-inch FHD</span></strong> display with a fast refresh rate, the <em><span style="text-decoration: underline;"><strong>Dell Gaming G15 5520</strong></span></em> ensures smooth gameplay and stunning visuals. The high-resolution display and vibrant colors bring games to life, allowing gamers to experience every detail and immerse themselves in the virtual worlds they explore. In addition to its impressive graphics capabilities, the Dell Gaming G15 5520 offers an enhanced audio experience.</p>
<p>With <span style="text-decoration: underline;"><strong>Nahimic 3D </strong></span>audio technology and front-firing speakers, gamers can enjoy immersive soundscapes that add depth and realism to their gaming sessions. Designed with gamers in mind, the <span style="text-decoration: underline;"><em><strong>Dell Gaming G15 5520</strong></em></span> features a responsive keyboard with customizable RGB lighting. Each keystroke is precise and comfortable, ensuring gamers can execute complex maneuvers with ease. The laptop also incorporates an advanced cooling system to keep temperatures low, allowing for extended gaming sessions without compromising performance.</p>', N'Đỗ Văn Đạt', CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (2, 1, N'images/news/macbook-promo-2.jpg', N'Memorial Day Deals 2023: Shop Deals on Tech, Home and More Before They are Gone', N'<p><strong>Today is Memorial Day,</strong> which means this weekends sales are starting to wind down. But that doesnt mean its too late to take advantage of major savings on everything from tech and TVs to mattresses, furniture and much more.</p>
<p><strong>However</strong>, most of these sales are set to expire tonight, and we probably wont see deals this good again until Fourth of July weekend or Amazons Prime Day, so youll want to act fast if you dont want to miss out on these savings. To help you make the most of the remaining hours, we have rounded up some of the very best Memorial Day deals you can still shop right now below.</p>
<p><span style="text-decoration: underline;"><strong>You can also check out our roundups of the best Memorial Day</strong></span> deals at Amazon and Best Buy for even more last-minute bargains.</p>', N'Adam', CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (3, 2, N'images/news/macbook-photo.jpg', N'5 things I want to see on the rumored MacBook Air', N'<ol>
<li><strong>Not a 15-inch Air Why, god?! Why?</strong> While some of us are starting to believe that a 15-inch MacBook Air is happening, the best thing about the Air is that its incredibly portable. It manages to stay thin, compact and lightweight, giving you enough power for creative work and a long enough battery life to outlast your workday. The MacBook Air 15-inch has already been spotted in testing, and all signs point to a WWDC 2023 launch.&nbsp;</li>
<li>&nbsp;<strong>A cheaper price tag In this economy</strong>, getting a pricey laptop is the last thing on peoples minds. Not especially when there are so many affordable options that are just as great or even better (such as the best Lenovo laptops). Unfortunately, last years overhaul of the MacBook Air also came with a price increase, starting at $1,199 / &pound;1,249 / AU$1,899 &ndash; $200 / &pound;250 more than the M1 model (which remains on sale and offers better value).</li>
<li>&nbsp; <strong>An OLED screen Apparently,</strong> we might not even see an OLED display on a MacBook until 2024, perhaps even 2026, which to be very honest is a mistake. According to rumors though, this decision is likely due to several factors including the drop in MacBook sales and difficulties in scaling up production of OLED displays.&nbsp;</li>
<li>&nbsp; <strong>At least an SD port That whole USB-C </strong>ports only initiative failed spectacularly for many reasons. People still needed other ports primarily because a lot of devices and accessories still havent gotten on the USB-C bandwagon. Creative professionals and content creators, especially, needed that variety of ports on their laptops, particularly an SD card reader and an HDMI port and Apple kind of learned the hard way that it just cannot control what consumers need.</li>
<li>&nbsp;<strong>A mint MacBook Air to match my iMac Honestly</strong>, I just want colors, like any of us who grew up in the iBook era when I could choose from four different fun colors on top of graphite. The midnight shade is gorgeous, dont get me wrong, but its also another neutral addition to an already neutral selection. It feels like Apple is trying its best to keep that minimalist fire burning.&nbsp;</li>
</ol>', N'Adam', CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (4, 4, N'images/news/teamworking.jpg', N'Technologies shaping the future green city at FPT Techday', N'<ul>
<li><strong>FPT Techday 2021</strong> launches a smart green city exhibition applying the groups latest technology services, solutions and products. According to information from the General Statistics Office, compared with the previous quarter, the number of employees suffering The negative impact of the pandemic in the third quarter increased by 15.4 million people, to more than 28.2 million people due to job loss, work leave, rotating leave, reduced working hours, and reduced income.</li>
<li>The impact of Covid-19 also greatly affected the production and business activities of enterprises. Around the world, the pandemic has also caused three-quarters of startups in most countries to pause and have no hope of raising more investment capital in the short term. F With this theme, guests will have the opportunity to fully approach and experience a green normal world, where the activities of governments, organizations, businesses and the lives of individuals are operated according to new way of "living with the flood".&nbsp; In particular, at the event, FPT will introduce the exhibition "Green Smart City" - a smart green city with the application of an ecosystem including the groups latest technology services, solutions and products.</li>
<li>The smart green city will be divided into 6 subdivisions: green government, green business, green mobility, green health, green education, green life. In particular, the subdivisions will operate around a focus on green government and connect, operate smoothly and flexibly based on core technologies such as AI, Cloud, Bigdata, Blockchain...</li>
<li>In particular, green government - the heart of a smart green city, is operated based on advanced technology solutions that help authorities get real-time updated data on all activities, thereby Make timely, coherent decisions and immediately see the results of change. In particular, in the context of Covids complicated developments, the green control center will be a place to exchange and connect with the command posts to discuss and provide solutions to big problems without having to meet. direct. Green enterprises, with the support of technology, can actively control the proportion of green personnel; administer, operate, work remotely.&nbsp;</li>
<li>Green education brings a smoothly connected learning and teaching experience between teachers and students based on artificial intelligence technology, social construction training methods to help learners be active, active and interested. participate and increase learning efficiency.</li>
</ul>', N'Dat', CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (5, 4, N'images/news/Teamwork-in-the-Workplace.png', N'Entegy: Self-managed, touchless, all-in-one platform', N'<ul>
<li><strong>Entegy is an intuitive and easy-to-use events management, communication,</strong> and engagement platform, designed specifically for business events. The platform allows anyone to create and manage the entire event lifecycle from a single system.</li>
<li><strong>Offering a range of feature sets</strong>, from websites and registration to apps, email campaigns, attendance tracking, lead capture and touchless badge printing, Entegy can cater to events of all types and sizes. Central to the ease of running an event with Entegy, is a single set of live profiles and content powering all applications and functions. As new profiles are created in the system, they are automatically assigned a unique QR code that can be used to perform touchless actions.</li>
<li><strong>A new attendee has registered onsite?</strong> No problem! Instantly, they can print a badge, get app access and engage with lead generation. A speaker has pulled out? No problem! A single change can update the website and event app. You get the picture&hellip; Touchless Technology Entegy rolled out its first touchless solutions way back in 2012.&nbsp;</li>
<li>&nbsp;<strong>With the improvements</strong> in mobile technology and general acceptance of QR code scanning becoming commonplace, Entegy not only boasts a robust, accessible and reliable system but also a solution that is 100% touchless.</li>
</ul>', N'hiep', CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (6, 1, N'https://www.cnet.com/a/img/resize/e9eabeaebbed80633f34e36b21f5477055d087a4/hub/2023/03/16/a8cf61d9-042f-49fe-bc7a-e357b0133417/apple-iphone-14-xx-8083-3.jpg?auto=webp&fit=crop&height=675&width=1200', N'iOS 17 Could Make Your Locked iPhone Screen an Apple Smart Home Display', N'The next software updates for iPhones could come with a feature that lets you view more items on your locked phone screen, Bloomberg reported Wednesday. Apples upcoming iOS 17 would reportedly feature a smart display setting that shows things like calendar appointments, weather and notifications.
The display would appear horizontally and resemble a smart home display like those sold by Amazon and Google while your phone is locked and lying unused on your desk or nightstand, Bloomberg said, citing unidentified sources. Itll have a "dark background with bright text," the report says, so that you can easily read the information.
While Apple last year launched lock screen widgets on iPhones and a customizable lock screen under iOS 16, the smart home-esque display would be a different experience, potentially giving you information without you having to touch your phone.
A similar horizontal smart display would reportedly come to iPads at a later date.
Apple didnt immediately respond to a request for comment, but the news will reportedly be revealed at Apples annual Worldwide Developers Conference next month.
Apples WWDC event will kick off with a keynote on June 5, where its expected the tech giant will unveil iOS 17, an AR/VR mixed-reality headset and possibly a new MacBook Air. Youll be able to watch WWDC online as well as on the Apple TV app. 


', N'minh', CAST(N'2023-05-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (8, 1, N'https://www.cnet.com/a/img/resize/4a3a8f8877b788ffa94ed8bc7beced43a9a11e28/hub/2022/10/11/fee761e5-5f5d-424f-8add-74d9b5e43be0/quest-pro-demo-laptop.jpg?auto=webp&width=1200', N'Apples Mixed Reality Headset: What to Expect From WWDC Big Reveal', N'Apples next big product looks like itll cost $3,000, rest on your face and need to be tethered to a battery pack. Whatever this expected VR headset ends up being, it isnt immediately clear what itll do or who its for. The Reality Pro headset, as its expected to be called when its likely unveiled at Apples WWDC developer conference on June 5, is Apples biggest new product in nearly a decade. Its also totally different than anything Apple has ever made before.
VR headsets have been a standard consumer tech thing for years, and your family, or families you know, may already have one lying in a corner. Theyre used for games, fitness, creative collaboration, even theater. Still, VR and AR have been outlier technologies, not deeply connected enough to the phones, tablets and laptops most of us use every day.
Apple could change that. And of course, dont expect the word "metaverse" to be uttered even once. The metaverse became Metas buzzword to envision its future of AR and VR. Apple will have its own parallel, possibly unique, pitch.
A connection to everything?
I pair my Quest 2, from Meta, to my phone, and it gets my texts and notifications. I connect it to my Mac to cast extra monitors around my desk using an app called Immersed. But VR and AR dont often feel deeply intertwined with the devices I use. They arent seamless in the way my watch feels when used with an iPhone, or AirPods feel when used with an iPad or Mac.
Apple needs this headset to bridge all of its devices, or at least make a good starting effort. Reports say the headset will run iPad apps on its built-in 4K displays, suggesting a common app ecosystem. Its also possible that the Apple Watch could be a key peripheral, tracking fitness and also acting as a vibrating motion-control accessory. 
 
Watch this: Apples WWDC 2023: What We Expect
06:55
VR is a self-contained experience, but mixed reality – which Apples headset should lean on heavily – uses pass-through cameras to blend virtual things with video of the real world. In Apples case, its own devices could act as spatially linked accessories, using keyboards and touchscreens and ways to show virtual screens springing from real ones.
Apples expected headset is supposed to be self-contained, a standalone device like the Quest 2 and Quest Pro. But that interconnectivity, and its position in Apples continuity-handoff connected ecosystem, is a big opportunity and a big question mark.
However, Apple does have a big AR head start: Its iOS ecosystem has supported AR for years, and the iPhone and iPad Pro already have depth-sensing lidar scanners that can map out rooms in ways that Apples headset should replicate. Apple could emphasize making its existing AR tools on other devices more usable and visible through a new interface.
Apples head of AR, Mike Rockwell – the person expected to be leading this new headsets development – told me in a conversation about AR in 2020 that "AR has enormous potential to be helpful to folks in their lives across devices that exist today, and devices that may exist tomorrow, but weve got to make sure that it is successful. For us, the best way to do that is to enable our device ecosystem, so that it is a healthy and profitable place for people to invest their time and effort."



', N'Phi', CAST(N'2023-05-29T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (9, 1, N'https://www.reuters.com/resizer/jGIUZI7779lh_g5JzbWRC7Ot6rM=/960x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/JDJIDLLSYRMYFOVQ66HE6LQZDM.jpg', N'Xiaomi to make wireless audio products in India', N'NEW DELHI/BENGALURU, May 29 (Reuters) - Xiaomi Corps (1810.HK) Indian arm will start making wireless audio products in the country through a partnership with electronics manufacturer Optiemus in a push to further localise its operations, the company said on Monday.
Xiaomi India will make its first local audio gadget at Optiemus Electronics factory in the northern state of Uttar Pradesh, the company said in a statement, reiterating that it was targeting a 50% increase in the production of components locally sourced by 2025.
The push comes as the manufacturer of the Redmi brand of smartphones recently lost out to South Korean rival Samsung (005930.KS) as Indias top smartphones company.
The company did not say what kind of audio product it will make in the Indian factory, but it is "committed to forging more such collaborations for a wider range of categories, across our product line-up."
Xiaomi, which locally manufactures most of the smartphones and TVs it sells in India, did not say when it will start making the audio products. It sells speakers, ear-buds, wired and wireless headphones in India.
The Indian government has been pushing global companies to invest in local manufacturing as a part of its vision to make the country self-reliant.

', N'team2', CAST(N'2023-05-29T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (10, 1, N'https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/828x552/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/22046473/vpavic_4291_20201113_0402.0.jpg', N'Apple’s $50 million butterfly keyboard settlement is finally approved', N'The $50 million settlement over Apples bad butterfly keyboard design got final approval by a federal court judge in California, Reuters reported yesterday.
US District Court Judge Edward Davila denied an attempt to amend the agreement, writing in his ruling that 86,000 people filed claims. That finally puts a figure on the number of people affected who will get compensation for repairs theyd paid for. Or at least the number who heard about the lawsuit and followed it to the settlement agreement that was reached last July.
The original suit came about because Apple laptops from 2015 to 2019 had a new keyboard design that just didnt hold up under normal use; crumbs and dirt, or even just accumulated dust, could cause keys to fail or stick. Casey Johnston famously wrote in The Outline that “The new MacBook keyboard is ruining my life.”
Despite Apples repeated attempts to iterate on the keyboard, the problem didnt go away until it released the 16-inch MacBook Pro in 2019, which took things back to the “scissor switch” design that also ships in the Magic Keyboard for Apple desktops. The design was fully phased out of its products a few months later when Apple released a redesigned 13-inch MacBook Pro. Apples settlement doesnt include an admission of wrongdoing but will pay some people back up to $395 to cover their repair costs.
This final wrinkle in the saga involved six objectors who offered arguments saying the settlement wasnt fair to MacBook owners whod never repaired their failed keyboards (and therefore dont get any cash) or that the $125 offered to those whod only had to pay for one replacement wasnt enough to cover the cost of repairs. But Davila denied their objections, saying that just wanting more money isnt enough to deny the settlements approval.
In short, anyone who filed a verifiable claim for keyboard money by the March deadline will be getting their money soon.
Correction May 27th, 2023 7:05PM ET: This article previously said the 2019 16-inch MacBook Pro contains an Apple M1 chip. In fact, it does not. We regret the error.
FEATURED VIDEOS FROM THE VERGE
Sonos is launching two new speakers at the same time. The Era 300 is designed for spatial audio and fires sound in multiple directions. The Era 100 improves upon the Sonos One with stereo audio and better bass. Both include Bluetooth and USB-C line-in so you can easily play music from other devices or plug in a turntable.


', N'team2', CAST(N'2023-05-28T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (11, 1, N'images/news/MSI.jpg', N'MSI is trying hard to be a premium laptop brand', N'<ul>
<li><span style="text-decoration: underline;"><strong>MSI &mdash; a brand traditionally known for gaming hardware </strong></span>&mdash; has announced a bunch of laptops at Computex 2023, and theres an interesting lack of gamery among them. Instead, the company appears to be focusing hard on the premium lifestyle space with its mid-2023 offerings. Notable among these releases is the new Commercial 14 series, a line of business laptops intended to compete with high-end enterprise PCs &mdash; the likes of the ThinkPad. I conclude this from the fact that MSIs press release highlights its &ldquo;tailor-made solutions to enterprises through a series of optional security measures, NFC (near-field communication) and built-in Smart Card Reader.&rdquo; If thats not a word-for-word ThinkPad pitch, I dont know what is. MSI has attempted business lines in the past, namely in its Summit Series, which we havent heard much about for a hot minute.</li>
<li><strong>These were solid, functional devices</strong>, but they didnt have the build quality (or laundry list of enterprise security features) to compete with the established top players in that space, and they certainly werent priced to do that. The Commercial, which rolls out in the second half of this year, looks like it could be a few rungs up that ladder. The other release thats catching my eye is the Prestige 16 Studio Evo, also slated for release in the second half of this year.</li>
<li>This is another product laser-focused on the high-end enterprise space. Ive traditionally thought of the Prestige line largely as productivity devices that also have the chops for some gaming here and there. But this version, as the Studio moniker indicates, is for creative professionals, featuring Thunderbolt 4, a 99Whr battery, and Nvidias Studio platform (and RTX discrete GPUs, of course). Im always on the lookout for powerful devices in the 16-inch space that dont weigh ten thousand pounds, since big-screened-but-still-portable workstations are a need I hear about from video editors all the time. This Prestige Studio could be a nice get for those folks (if its good). Another big professional product, the Creator Z17 HX Studio, was actually announced earlier this year.</li>
<li><strong>Its geared towards workers across the creative space</strong>, from video professionals to digital artists, and its compatible with an absolutely bonkers stylus that doubles as a mechanical pencil. MSI has that prominently on display at Computex as well, further pushing the idea that its not just a gaming brand, everyone, we promise. The Creator starts at $2,999 (yeah, its not cheap), but MSI hasnt revealed pricing for the Prestige or the Commercial yet. Those numbers will give us a better idea of where MSI thinks these products fit in the current market and how high-end it thinks they really are. The video player is currently playing an ad. You can skip the ad in 5 sec with a mouse or keyboard Skip in 1s Lenovo is at MWC 2023 to make a pitch for a rollable future. Its got a prototype rollable laptop and a prototype rollable phone. Both have screens that can expand to give you more screen real-estate.</li>
</ul>', N'team2', CAST(N'2023-05-28T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (12, 1, N'images/news/Apple.webp', N'It is Time to Stop Waiting for Apple Next iPhone Moment', N'<ul>
<li>It''s been a long time since <strong>Apple </strong>revolutionized the smartphone industry with the launch of the first <strong>iPhone </strong>in <strong>2007</strong>. Since then, the company has released numerous iterations of its iconic device, each one more powerful and feature-packed than the last. But in recent years, the excitement around new iPhone releases has waned, and consumers are starting to wonder: is <strong>Apple </strong>running out of ideas? The answer, of course, is no. <strong>Apple </strong>is still one of the most innovative companies in the world, and there''s no doubt that they have some exciting new products in the pipeline. But the days of the <strong>iPhone </strong>being the center of attention are over.</li>
<li>It''s time for consumers to stop waiting for <strong>Apple''s </strong>next big <strong>iPhone </strong>moment and start paying attention to the company''s other offerings. Take the<strong> Apple Watch</strong>, for example. Since its launch in <strong>2015</strong>, the <strong>Apple Watch</strong> has become one of the most popular smartwatches on the market, and it''s not hard to see why. With features like heart rate monitoring, <strong>GPS </strong>tracking, and cellular connectivity, the <strong>Apple Watch </strong>is much more than just a timepiece. It''s a powerful fitness tracker, a convenient way to stay connected, and a stylish accessory all rolled into one.</li>
</ul>', N'Đỗ Văn Đạt', CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-05-31T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (13, 4, N'images/news/SamsungGalaxyZFlip4.jpg', N'Samsung Unveils the Future of Foldable Technology with the Samsung Galaxy Z Fold 4', N'<p><strong>Seoul, South Korea</strong> - Samsung Electronics, the renowned global leader in consumer electronics, has officially announced the highly anticipated launch of its latest innovation in foldable technology, the Samsung Galaxy Z Fold 4. Building on the success of its predecessors, the Galaxy Z Fold 4 is set to redefine the smartphone experience, offering users a remarkable combination of functionality, versatility, and style.</p>
<p>&nbsp;</p>
<p>At a glamorous unveiling event held at the Samsung Digital City, industry experts and tech enthusiasts witnessed the grand reveal of the <strong>Galaxy Z Fold 4</strong>. The device captured the audience''s attention with its cutting-edge features and sleek design, showcasing Samsung''s relentless pursuit of innovation.</p>
<p>&nbsp;</p>
<p>The Samsung Galaxy Z Fold 4 features a larger and more immersive foldable display, providing users with a seamless transition between smartphone and tablet modes. The dynamic AMOLED display delivers vibrant colors, deep blacks, and astonishing clarity, ensuring a visually stunning experience for users.</p>
<p>&nbsp;</p>
<p>Equipped with the latest Snapdragon processor and an enhanced multi-camera system, the Galaxy Z Fold 4 delivers unparalleled performance and versatility. Users can capture professional-grade photos and videos with ease, thanks to the device''s advanced camera capabilities and AI-powered enhancements.</p>
<p>&nbsp;</p>
<p>Samsung has also made significant improvements to the durability of the Galaxy Z Fold 4. The device features an upgraded hinge mechanism and a more robust construction, ensuring a reliable and long-lasting foldable smartphone experience. The addition of an ultra-thin glass layer further enhances the device''s durability while maintaining its sleek profile.</p>', N'Đỗ Văn Đạt', CAST(N'2023-06-02T00:00:00.000' AS DateTime), N'Đỗ Văn Đạt', CAST(N'2023-06-08T00:00:00.000' AS DateTime))
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (14, 5, NULL, NULL, N'<p>Technology is best when it brings people together.</p>', N'Matt Mullenweg', NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (15, 5, NULL, NULL, N'It has become appallingly obvious that our technology has exceeded our humanity.', N'Albert Einstein', NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (16, 5, NULL, NULL, N'It is only when they go wrong that machines remind you how powerful they are.', N'Clive James', NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (17, 5, NULL, NULL, N'The Web as I envisaged it, we have not seen it yet. The future is still so much bigger than the past.', N'Tim Berners-Lee', NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (18, 5, NULL, NULL, N'If it keeps up, man will atrophy all his limbs but the push-button finger.', N'Frank Lloyd Wright', NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (19, 6, N'images/about/teamworking.jpg', N'How was HighTech Store started?', N'Welcome to HighTech, your ultimate destination for cutting-edge technology products! We are thrilled to present you with an online platform that brings together the latest gadgets and electronics, offering you an unparalleled shopping experience.At HighTech, we understand the fast-paced nature of the tech industry and the ever-evolving needs of tech enthusiasts like yourself. That''s why we have curated a diverse range of products that cater to every aspect of your technological lifestyle. Whether you''re a tech-savvy professional, a passionate gamer, or someone who simply appreciates the convenience and innovation that technology brings, we have something for everyone.Our extensive collection features top-of-the-line smartphones, sleek laptops, powerful desktop computers, immersive virtual reality systems, high-resolution cameras, smart home devices, and so much more. We partner with renowned brands and manufacturers known for their quality and reliability, ensuring that you receive only the best products that meet your expectations.', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (21, 7, NULL, N'HighTech ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (22, 7, NULL, N'Customer Service', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (23, 7, NULL, N'Contact Us', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (24, 7, NULL, N'Social Media', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (25, 8, N'HighTech ', N'About Us', N'AboutCustomerController', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (26, 8, N'HighTech ', N'News', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (27, 8, N'HighTech ', N'Conditions', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (28, 8, N'HighTech ', N'Career', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (29, 8, N'Customer Service', N'Contact', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (30, 8, N'Customer Service', N'Privacy Policy', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (31, 8, N'Customer Service', N'Returns & Refunds', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (32, 8, N'Customer Service', N'Delivery Information', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (33, 8, N'Contact Us', N'Do you have any question or suggestion?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (34, 8, N'Contact Us', N'Email', N'hightechstore05vn@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (35, 8, N'Contact Us', N'Do you need assistance? Give us a call.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (36, 8, N'Contact Us', N'Phone', N'+84968519615', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (37, 8, N'Social Media', N'Let us know what you think and you can also give feedback on the product or website quality.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (38, 8, N'Social Media', N'Facebook', N'https://www.facebook.com/hightechstore05vn', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (39, 8, N'Social Media', N'Twitter', N'https://twitter.com/', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (40, 8, N'Social Media', N'Youtube', N'https://www.youtube.com/', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (41, 8, N'Social Media', N'Behance', N'https://www.behance.net/', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (42, 9, N'images/banner/iphone14.png', N'IPHONE14', N'<p>iPhone is a line of smartphones produced by Apple Inc. that use Apple own iOS mobile operating systems</p>', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (43, 9, N'images/banner/macbook.jpg', N'MACBOOK', N'<p>Macbook Pro 2022 is a thin and light laptop equipped with a powerful M2 processor</p>', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (44, 9, N'images/banner/iphone.jpg', N'IPHONE.', N'<p>iPhone is a line of smartphones produced by Apple Inc. that use Apple own iOS mobile operating system</p>', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (45, 9, N'images/banner/ipad.jpg', N'IPADssss.', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (46, 9, N'images/banner/macbook.jpg', N'MACBOOK.', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (47, 9, N'images/news/macbook-photo.jpg', N'ACCESSORIES.', N'The iPod is a family of music players and basic portable multi-purpose devices designed and sold by Apple Inc..', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (48, 10, NULL, N'Get In Touch', N'<p>We welcome and value your opinions, so please feel free to share your thoughts with us, expressing what you think about our product or the overall quality of our website. In addition, we greatly appreciate any feedback you may have, as it helps us improve and enhance our offerings to better meet your needs.</p>', NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (49, 10, NULL, N'096-851-9615', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (50, 10, NULL, N'hightech05vn@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[news] ([news_id], [newsgroup_id], [image], [title], [content], [createby], [created_date], [modifyby], [modify_date]) VALUES (51, 10, NULL, N'FPT UNIVERSITY - HOA LAC - THACH THAT - HA NOI', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[news_group] ON 

INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (1, N'Tech-news')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (2, N'Review')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (3, N'Tutorial')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (4, N'Events')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (5, N'Quote')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (6, N'About Us')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (7, N'Title_footer')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (8, N'Footer')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (9, N'Banner')
INSERT [dbo].[news_group] ([newsgroup_id], [newsgroup_name]) VALUES (10, N'Contact')
SET IDENTITY_INSERT [dbo].[news_group] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (1, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 122998000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Ship COD', N'Done')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (2, 2, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 21210000, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'Payment by Card', N'Done')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (3, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 54452000, CAST(N'2023-06-04T00:00:00.000' AS DateTime), N'Ship COD', N'Done')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (4, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 5192000, CAST(N'2023-06-05T00:00:00.000' AS DateTime), N'Ship COD', N'Process')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (5, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 34191000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Ship COD', N'Done')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (6, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 31499000, CAST(N'2023-06-06T00:00:00.000' AS DateTime), N'Ship COD', N'Process')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (7, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 26290000, CAST(N'2023-05-31T00:00:00.000' AS DateTime), N'Ship COD', N'Cancel')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (8, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 21210000, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'Ship COD', N'Wait')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (9, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 34191000, CAST(N'2023-06-02T00:00:00.000' AS DateTime), N'Ship COD', N'Cancel')
INSERT [dbo].[order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [order_date], [payment], [status]) VALUES (10, 1, N'Đỗ Văn Đạt', N'0902121881', N'Đỗ Văn Đạt', 64280000, CAST(N'2023-06-06T00:00:00.000' AS DateTime), N'Payment by Card', N'Process')
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (1, 1, 1, 28, N'Samsung Galaxy Z Flip4 - 256GB', N'images/product/SamsungGalaxyZFlip4.jpg', 21210000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (2, 1, 1, 6, N'APPLE MACBOOK AIR (256GB SSD/13.6 INCH IPS/SILVER)', N'images/product/18.png', 31499000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (3, 1, 1, 20, N'iPhone 14 Pro Max (128GB)', N'images/product/Apple-iPhone-14-Pro-Max.jpg', 26290000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (4, 1, 1, 10, N'APPLE MACBOOK PRO 13 (512GB SSD/13.3 INCH/GOLD)', N'images/product/1.jpg', 43999000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (5, 2, 2, 28, N'Samsung Galaxy Z Flip4 - 256GB', N'images/product/SamsungGalaxyZFlip4.jpg', 21210000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (6, 3, 1, 23, N'Surface Pro 7 Core i5 / 8GB / 128GB', N'images/product/surface-pro-7.jpg', 39980000, 2)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (7, 3, 1, 34, N'Sony WH-1000XM5 ', N'images/product/SonyWH.jpg', 7101000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (8, 3, 1, 12, N'Lenovo Tab P11 Plus - 11'''' - 64GB', N'images/product/LenovoTabP11Pro__1_.jpg', 7371000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (9, 4, 1, 33, N'True Wireless Sony WF-1000XM4', N'images/product/TrueWireLessSony.jpg', 5192000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (10, 5, 1, 25, N'Surface Pro 8 Core i7 / 16GB / 256GB', N'images/product/SurfacePro8.jpg', 34191000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (11, 6, 1, 6, N'APPLE MACBOOK AIR (256GB SSD/13.6 INCH IPS/SILVER)', N'images/product/18.png', 31499000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (12, 7, 1, 20, N'iPhone 14 Pro Max (128GB)', N'images/product/Apple-iPhone-14-Pro-Max.jpg', 26290000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (13, 8, 1, 28, N'Samsung Galaxy Z Flip4 - 256GB', N'images/product/SamsungGalaxyZFlip4.jpg', 21210000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (14, 9, 1, 25, N'Surface Pro 8 Core i7 / 16GB / 256GB', N'images/product/SurfacePro8.jpg', 34191000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (15, 10, 1, 20, N'iPhone 14 Pro Max (128GB)', N'images/product/Apple-iPhone-14-Pro-Max.jpg', 26290000, 1)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (1, N'LG GRAM 17ZD90R-G.AX73A5 (256GB/GREY)', N'<ul>
<li>CPU: <strong>I7-1360P</strong></li>
<li>RAM: <strong>16GB RAM</strong></li>
<li>SSD: <strong>256GB SSD</strong></li>
<li>Size: <strong>17.0 INCH</strong></li>
<li>Operating System: <strong>DOS</strong></li>
<li>Color: <strong>GREY</strong></li>
</ul>', N'<p>&bull;<span style="white-space: pre;"> </span>The LG Gram <strong>17ZD90R-G.AX73A5</strong> laptop is a powerful and lightweight device,</p>
<p>&bull;<span style="white-space: pre;"> </span>Featuring an<strong> Intel Core i7</strong> processor, <strong>16GB of RAM</strong>, and a 256GB SSD.</p>
<p>&bull;<span style="white-space: pre;"> </span>With its <strong>17.0-inch WQXGA</strong> display, this laptop offers a vibrant and crisp viewing experience, catering to all your work and entertainment needs.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/product/macbook-promo-1.jpg" alt="" width="675" height="401" /></p>', N'images/product/15.png', 42899000, 0, 1, 9, N'Stocking', N'lg-gram-17zd90r')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (2, N'LENOVO IDEAPAD SLIM 5 PRO  (512GB/SILVER)', N'<p>&bull;<span style="white-space: pre;"> </span>CPU: <strong>I5 1240P.</strong></p>
<p>&bull;<span style="white-space: pre;"> </span>RAM: <strong>16GB RAM.</strong></p>
<p>&bull;<span style="white-space: pre;"> </span>SSD: <strong>512GB SSD.</strong></p>
<p>&bull;<span style="white-space: pre;"> </span>Size &amp; Display: <strong>14-inch 2.8K.</strong></p>
<p>&bull;<span style="white-space: pre;"> </span>Operating System: <strong>WIN11.</strong></p>
<p>&bull;<span style="white-space: pre;"> </span>Color: <strong>SILVER.</strong></p>', N'<p>&bull;<span style="white-space: pre;"> </span>The <strong>Lenovo IdeaPad Slim 5 Pro 14IAP7 (82SH002TVN) </strong>laptop delivers excellence with an<strong> Intel Core i5 </strong>processor, 16GB of RAM, and a <strong>512GB SSD.</strong></p>
<p>&bull;<span style="white-space: pre;"> </span>Its <strong>14-inch 2.8K </strong>display provides sharp and detailed visuals. With the Windows 11 operating system, you can enjoy an optimized user experience and reliable performance.</p>
<p>&bull;<span style="white-space: pre;"> </span>The sleek <strong>SILVER</strong> color of this device adds sophistication and style.</p>
<p>&nbsp;</p>', N'images/product/Lenovo IDEAPAD SLIM 5 PRO.jpg', 19299000, 0.2, 1, 3, N'Stocking', N'lenovo-ideapad-slim-5pro')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (3, N'ACER ASPIRE 5 A514-55-5954 (512GB SSD/GREY)', N'<ul>
<li>CPU: <strong>I5 1235U</strong></li>
<li>RAM: <strong>8GB RAM.</strong></li>
<li>SSD: <strong>512GB SSD</strong></li>
<li>Size: <strong>14.0 INCH FHD.</strong></li>
<li>Operating System: <strong>WIN11</strong></li>
<li>Color: <strong>GREY.</strong></li>
</ul>', N'<ul>
<li>The Acer Aspire 5 A514-55-5954 (NX.K5BSV.001) laptop is a reliable and efficient device, equipped with an Intel Core i5 processor, 8GB of RAM, and a 512GB SSD. Its 14.0-inch Full HD display delivers clear and vibrant visuals for an immersive viewing experience..</li>
<li>I5 1235U/8GB RAM.</li>
<li>512GB SSD/14.0 INCH FHD.</li>
<li>WIN11/GREY.</li>
</ul>', N'images/product/20.png', 17299000, 0.2, 1, 10, N'Stocking', N'acer-aspire5')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (4, N'ASUS VIVOBOOK A1503ZA-L1422W (512GB SSD/15.6 OLED/BLUE)', N'<ul>
<li>CPU: <strong>I5 12500H</strong></li>
<li>RAM: <strong>8GB RAM.</strong></li>
<li>SSD: <strong>512GB SSD </strong></li>
<li>Size: <strong>15.6 OLED.</strong></li>
<li>Operating System: <strong>WIN11</strong></li>
<li>Color:&nbsp;<strong>SILVER.</strong></li>
</ul>', N'<ul>
<li>The ASUS VivoBook A1503ZA-L1422W laptop combines power and style, featuring an Intel Core i5 12500H processor, 8GB of RAM, and a 512GB SSD for fast and efficient performance. Its 15.6-inch OLED display offers vivid and immersive visuals with stunning color reproduction.&nbsp;</li>
<li>I5 12500H/8GB RAM.</li>
<li>512GB SSD/15.6 OLED.</li>
<li>WIN11/SILVER.</li>
</ul>', N'images/product/19.png', 17299000, 0.1, 1, 4, N'Stocking', N'asus-vivobook-a1503za')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (5, N'DELL INSPIRON 3520 (256GB SSD/15.6 INCH/BLACK)', N'<ul>
<li>CPU: <strong>I5 1235U </strong></li>
<li>RAM: <strong>8GB RAM</strong></li>
<li>SSD: <strong>256GB SSD</strong></li>
<li>Size: <strong>15.6 INCH FHD</strong></li>
<li>Operating&nbsp; System: <strong>WIN11</strong></li>
<li>Color: <strong>BLACK</strong></li>
</ul>', N'<ul>
<li>The Dell Inspiron 3520 (N5I5122W1) laptop delivers a powerful and efficient performance, featuring an Intel Core i5 1235U processor, 8GB of RAM, and a 256GB SSD for quick data access. Its 15.6-inch Full HD display offers sharp and vibrant visuals.</li>
<li>&nbsp;I5 1235U 8GB RAM</li>
<li>256GB SSD/15.6 INCH FHD</li>
<li>WIN11/OFFICEHS21/BLACK.</li>
</ul>', N'images/product/13.png', 16099000, 0.1, 1, 2, N'Stocking', N'dell-inspison-3520')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (6, N'APPLE MACBOOK AIR (256GB SSD/13.6 INCH IPS/SILVER)', N'<ul>
<li>CHIP &amp; CPU: <strong>APPLE M2/8C CPU</strong></li>
<li>RAM: <strong>8GB RAM</strong></li>
<li>SSD: <strong>256GB SSD</strong></li>
<li>Size: <strong>13.6 INCH IPS</strong></li>
<li>OS: <strong>MAC OS</strong></li>
<li>Color: <strong>SILVER.</strong></li>
</ul>', N'<ul>
<li>The Apple MacBook Air (MLXY3SA/A) is a powerful and stylish laptop featuring the Apple M2 chip with an 8-core CPU and 8-core GPU. With 8GB of RAM and a 256GB SSD, it offers efficient performance and ample storage. The 13.6-inch IPS display delivers vibrant visuals, and running on macOS.</li>
<li>APPLE M2/8C CPU/8C GPU</li>
<li>8GB RAM/256GB SSD</li>
<li>13.6 INCH IPS/MAC OS/SILVER.</li>
</ul>', N'images/product/18.png', 31499000, 0, 1, 1, N'Stocking', N'apple-macbook-air')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (10, N'APPLE MACBOOK PRO 13 (512GB SSD/13.3 INCH/GOLD)', N'<ul>
<li>CHIP &amp; CPU : <strong>APPLE M2 /8C CPU/10C GPU</strong></li>
<li>RAM: <strong>16GB RAM</strong></li>
<li>SSD: <strong>512GB SSD</strong></li>
<li>Size: <strong>13.3 INCH</strong></li>
<li>OS: <strong>MAC OS</strong></li>
<li>Color:<strong> SILVER</strong></li>
</ul>', N'<ul>
<li>The Apple MacBook Pro 13 (Z16U00034) is a powerful and premium laptop. It is equipped with the advanced Apple M2 chip featuring an 8-core CPU and 10-core GPU, delivering exceptional performance.</li>
<li>APPLE M2 /8C CPU/10C GPU</li>
<li>16GB RAM/512GB SSD</li>
<li>13.3 INCH/MAC OS/SILVER</li>
</ul>', N'images/product/1.jpg', 43999000, 0, 1, 1, N'Stocking', N'apple-macbook-pro13')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (11, N'iPad Gen 9 - 10.2', N'<ul>
<li>&nbsp;<strong>iPad Gen 9</strong> is a <strong>10.2-inch</strong> tablet released in <strong>2021</strong>.</li>
<li>It offers a reliable and versatile performance with its <strong>Wi-Fi</strong> connectivity and <strong>64GB </strong>of storage capacity.</li>
</ul>', N'<ul>
<li>The iPad Gen 9 is a 10.2-inch tablet released in 2021. It offers a reliable and versatile performance with its Wi-Fi connectivity and 64GB of storage capacity. The iPad Gen 9 is perfect for various tasks, such as browsing the internet, streaming media, and using a wide range of apps. Its portable size and long battery life make it an excellent companion for both productivity and entertainment on the go.</li>
</ul>', N'images/product/17.png', 6950000, 0, 2, 1, N'Stocking', N'ipad-gen9')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (12, N'Lenovo Tab P11 Plus - 11'''' - 64GB', N'<ul>
<li><strong>The Lenovo Tab P11 Plus</strong> is an <strong>11-inch</strong> tablet with <strong>64GB </strong>of storage capacity.</li>
<li>It offers a versatile and immersive multimedia experience with its large display and ample storage.&nbsp;</li>
</ul>', N'<p>The Lenovo Tab P11 Plus is an 11-inch tablet with 64GB of storage capacity. It offers a versatile and immersive multimedia experience with its large display and ample storage. Whether you''re browsing the web, watching videos, or playing games, the Lenovo Tab P11 Plus provides crisp visuals and smooth performance. With its portable design and long-lasting battery life, it''s a great companion for both productivity and entertainment on the move.</p>', N'images/product/LenovoTabP11Pro__1_.jpg', 8190000, 0, 2, 3, N'Stocking', N'lenovo-tab-p11-plus')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (16, N'iPad Pro M2 11', N'<ul>
<li><strong>The iPad Pro M2</strong> is an advanced <strong>11-inch</strong> tablet with <strong>512GB </strong>of storage.</li>
<li>It features a powerful <strong>M2 chip</strong> and <strong>5G </strong>connectivity for fast performance and seamless internet access.&nbsp;</li>
</ul>', N'<ul>
<li>The iPad Pro M2 is an advanced 11-inch tablet with 512GB of storage. It features a powerful M2 chip and 5G connectivity for fast performance and seamless internet access. With its high-resolution display, the iPad Pro M2 provides a stunning visual experience, perfect for creative tasks and multimedia consumption.</li>
</ul>', N'images/product/IpadProM2.jpg', 33990000, 0, 2, 1, N'Stocking', N'ipad-pro-m2-11')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (17, N'Samsung Galaxy Tab S8 Ultra', N'<ul>
<li><strong>The Samsung Galaxy Tab S8 Ultra</strong> is a high-end tablet that offers an exceptional user experience.</li>
<li>With its large display, precise performance, and innovative features, it stands out as a flagship device.</li>
</ul>', N'<p>The Samsung Galaxy Tab S8 Ultra is a high-end tablet that offers an exceptional user experience. With its large display, precise performance, and innovative features, it stands out as a flagship device. The Tab S8 Ultra boasts a stunning and immersive display, perfect for multimedia consumption, gaming, and productivity tasks. Its powerful processor ensures smooth and seamless performance, allowing you to multitask effortlessly.</p>', N'images/product/Samsung-Galaxy.jpg', 23290000, 0, 2, 5, N'Stocking', N'samsung-galaxy-tab-s8-ultra')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (18, N'Xiaomi Pad 5 6GB/256GB', N'<ul>
<li><strong>The Xiaomi Pad 5</strong> is a sleek and powerful tablet with <em><strong>6GB </strong></em>of <em><strong>RAM and 256GB</strong></em> of storage.</li>
<li>It combines excellent performance with ample storage capacity, providing a seamless and immersive user experience for both work and entertainment.</li>
</ul>', N'<p>The Xiaomi Pad 5 is a sleek and powerful tablet with 6GB of RAM and 256GB of storage. It combines excellent performance with ample storage capacity, providing a seamless and immersive user experience for both work and entertainment.</p>', N'images/product/XiaomiPad5.jpg', 10490000, 0.2, 2, 6, N'Stocking', N'xiaomi-pad-5')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (19, N'iPad Mini 6 - 8.3', N'<ul>
<li>The <strong>iPad Mini 6</strong> is a compact and versatile tablet with an <strong>8.3-inch display. </strong></li>
<li><strong>Released in 2021</strong>, it offers <strong>Wi-Fi</strong> connectivity and <strong><em>64GB</em></strong> of storage capacity</li>
</ul>', N'<ul>
<li>The iPad Mini 6 is a compact and versatile tablet with an 8.3-inch display. Released in 2021, it offers Wi-Fi connectivity and 64GB of storage capacity. The iPad Mini 6 is perfect for on-the-go productivity, multimedia consumption, and staying connected. Its portable size, high-resolution display, and efficient performance make it a great choice for users who prioritize convenience without compromising functionalit</li>
</ul>', N'images/product/IPadMini6.jpg', 11990000, 0, 2, 1, N'Stocking', N'ipad-mini-6')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (20, N'iPhone 14 Pro Max (128GB)', N'<ul>
<li>The iPhone 14 Pro Max is a flagship smartphone with 128GB of storage capacity.</li>
<li>It offers a premium user experience with its advanced features and powerful performance.</li>
<li>The iPhone 14 Pro Max boasts a stunning display, exceptional camera capabilities, and a range of innovative features</li>
</ul>', N'<p>The iPhone 14 Pro Max is a flagship smartphone with 128GB of storage capacity. It offers a premium user experience with its advanced features and powerful performance. The iPhone 14 Pro Max boasts a stunning display, exceptional camera capabilities, and a range of innovative features</p>', N'images/product/Apple-iPhone-14-Pro-Max.jpg', 26290000, 0, 3, 1, N'Stocking', N'iphone-14-pro-max')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (21, N'iPhone 14 Pro (256GB) - Gold', N'<ul>
<li>The iPhone 14 Pro in Gold is a luxurious and high-performance smartphone with 256GB of storage.</li>
<li>It combines elegance and power with its sleek design and advanced features.</li>
<li>The iPhone 14 Pro offers a premium user experience, featuring a stunning display, exceptional camera capabilities, and powerful performance.</li>
</ul>', N'<p>The iPhone 14 Pro in Gold is a luxurious and high-performance smartphone with 256GB of storage. It combines elegance and power with its sleek design and advanced features. The iPhone 14 Pro offers a premium user experience, featuring a stunning display, exceptional camera capabilities, and powerful performance.</p>', N'images/product/iphone_14_pro_max_gold.png', 27390000, 0.2, 3, 1, N'Stocking', N'iphone-14-pro')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (22, N'iPhone 14 Plus (128GB) - Starlight', N'<ul>
<li><strong>The iPhone 14 Plus in Starlight</strong>&nbsp;is a premium smartphone with 128GB of storage. It combines powerful performance and a stylish design to deliver an exceptional user experience.</li>
<li><span style="text-decoration: underline;">The iPhone 14 Plus features</span>&nbsp;a large display, advanced camera system, and impressive features</li>
</ul>', N'<p><strong>The iPhone 14 Plus in Starlight</strong>&nbsp;is a premium smartphone with 128GB of storage. It combines powerful performance and a stylish design to deliver an exceptional user experience.<span style="text-decoration: underline;"> The iPhone 14 Plus features</span> a large display, advanced camera system, and impressive features.</p>', N'images/product/iphone14-white.jpg', 21590000, 0.2, 3, 1, N'Stocking', N'iphone-14-plus')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (23, N'Surface Pro 7 Core i5 / 8GB / 128GB', N'<ul>
<li>The Surface Pro 7 is a versatile 2-in-1 device powered by an Intel Core i5 processor and equipped with 8GB of RAM and 128GB of storage.</li>
<li>It offers a seamless blend of performance and portability, allowing you to work, create, and entertain on-the-go.</li>
</ul>', N'<ul>
<li>The Surface Pro 7 is a versatile 2-in-1 device powered by an Intel Core i5 processor and equipped with 8GB of RAM and 128GB of storage. It offers a seamless blend of performance and portability, allowing you to work, create, and entertain on-the-go.</li>
</ul>', N'images/product/surface-pro-7.jpg', 19990000, 0, 1, 8, N'Stocking', N'surface-pro-7')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (24, N'Surface Laptop Go Core i5 / 8GB / 128 GB / 12.4 inch', N'<ul>
<li>The Surface Laptop Go is designed for productivity and everyday tasks, making it perfect for students, professionals, and on-the-go individuals.</li>
<li>Its sleek design and vibrant display provide an enjoyable user experience, while the powerful specifications ensure smooth multitasking and efficient performance.</li>
</ul>', N'<p>The Surface Laptop Go is designed for productivity and everyday tasks, making it perfect for students, professionals, and on-the-go individuals. Its sleek design and vibrant display provide an enjoyable user experience, while the powerful specifications ensure smooth multitasking and efficient performance.</p>', N'images/product/SurfaceLaptopGoCorei5.jpg', 15790000, 0.1, 1, 8, N'Stocking', N'surface-laptop-go')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (25, N'Surface Pro 8 Core i7 / 16GB / 256GB', N'<ul>
<li><strong>The Surface Pro 8</strong> is a high-performance 2-in-1 device featuring an <strong>Intel Core i7</strong> processor, <strong>16GB of RAM</strong>, and a <strong>256GB SSD. </strong></li>
<li>It offers a powerful computing experience with the flexibility of a tablet and the productivity of a laptop.</li>
</ul>', N'<p>The Surface Pro 8 is a high-performance 2-in-1 device featuring an Intel Core i7 processor, 16GB of RAM, and a 256GB SSD. It offers a powerful computing experience with the flexibility of a tablet and the productivity of a laptop. The Surface Pro 8''s 12.3-inch display provides stunning visuals, while its versatile design allows you to switch between tablet and laptop modes effortlessly</p>', N'images/product/SurfacePro8.jpg', 37990000, 0, 1, 8, N'Stocking', N'surface-pro-8')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (26, N'Surface Laptop 4 R5-4680U/8GB/128GB/13.5 inches', N'<ul>
<li>The Surface Laptop 4 is a sleek and powerful laptop featuring an AMD Ryzen 5 4680U processor,</li>
<li>8GB of RAM, and a 128GB SSD.</li>
<li>With its 13.5-inch display, it offers a compact yet immersive visual experience.&nbsp;</li>
</ul>', N'<p>The Surface Laptop 4 is a sleek and powerful laptop featuring an AMD Ryzen 5 4680U processor, 8GB of RAM, and a 128GB SSD. With its 13.5-inch display, it offers a compact yet immersive visual experience. The Surface Laptop 4 is designed for productivity and versatility, making it suitable for various tasks such as work, studies, and entertainment. Its lightweight design and long battery life make it ideal for on-the-go use.</p>', N'images/product/Surface-Laptop-4.jpg', 18990000, 0.2, 1, 8, N'Stocking', N'surface-laptop-4')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (27, N'Samsung Galaxy S22 Ultra - 8GB/128GB', N'<ul>
<li>The Samsung Galaxy S22 Ultra is a flagship smartphone featuring 8GB of RAM and 128GB of storage.</li>
<li>It offers a premium and immersive user experience with its powerful performance and advanced features.</li>
<li>The Galaxy S22 Ultra boasts a stunning display, exceptional camera capabilities, and a range of innovative features.</li>
</ul>', N'<p>The Samsung Galaxy S22 Ultra is a flagship smartphone featuring 8GB of RAM and 128GB of storage. It offers a premium and immersive user experience with its powerful performance and advanced features. The Galaxy S22 Ultra boasts a stunning display, exceptional camera capabilities, and a range of innovative features.</p>', N'images/product/Samsung-Galaxy-S22-Ultra.jpg', 19490000, 0.1, 3, 5, N'Stocking', N'samsum-galaxy-s22-ultra')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (28, N'Samsung Galaxy Z Flip4 - 256GB', N'<ul>
<li><strong>The Samsung Galaxy Z Flip4</strong> is a cutting-edge smartphone with 256GB of storage.</li>
<li>It features a unique folding design that allows you to conveniently fold and unfold the device for a compact and stylish form factor.</li>
<li>With its ample storage capacity, you can store a significant amount of photos, videos, apps, and other files.</li>
</ul>', N'<p>The Samsung Galaxy Z Flip4 is a cutting-edge smartphone with 256GB of storage. It features a unique folding design that allows you to conveniently fold and unfold the device for a compact and stylish form factor. With its ample storage capacity, you can store a significant amount of photos, videos, apps, and other files.</p>', N'images/product/SamsungGalaxyZFlip4.jpg', 21210000, 0, 3, 5, N'Stocking', N'samsumg-galaxy-z-flip-4')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (30, N'Samsung Galaxy Z Fold4 - 256GB', N'<p>The Samsung Galaxy Z Fold4 is an innovative smartphone with a foldable display and 256GB of storage. It offers a unique and versatile user experience by transforming from a compact phone to a larger tablet-like device. With its ample storage capacity, you can store a vast amount of photos, videos, apps, and other content.</p>', N'<p>The Samsung Galaxy Z Fold4 is an innovative smartphone with a foldable display and 256GB of storage. It offers a unique and versatile user experience by transforming from a compact phone to a larger tablet-like device. With its ample storage capacity, you can store a vast amount of photos, videos, apps, and other content.</p>', N'images/product/SamsungGalaxyZFold4.png', 29990000, 0.1, 3, 5, N'Stocking', N'samsumg-galaxy-z-fold-4')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (31, N'Redmi Note 12 Pro 5G (8GB/256GB)', N'<p>The Redmi Note 12 Pro 5G is a feature-packed smartphone with 8GB of RAM and 256GB of storage. It offers high-speed 5G connectivity for fast internet access and seamless multimedia streaming. The Redmi Note 12 Pro 5G boasts a powerful processor, allowing for smooth multitasking and gaming performance.</p>', N'<p>The Redmi Note 12 Pro 5G is a feature-packed smartphone with 8GB of RAM and 256GB of storage. It offers high-speed 5G connectivity for fast internet access and seamless multimedia streaming. The Redmi Note 12 Pro 5G boasts a powerful processor, allowing for smooth multitasking and gaming performance.</p>', N'images/product/Xiaomi-Redmi-Note-12.jpg', 8990000, 0.2, 3, 6, N'Stocking', N'redmi-note-12-pro-5g')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (32, N'Xiaomi 12T (16GB/256GB)', N'<p>The Xiaomi 12T is a high-performance smartphone with 16GB of RAM and 256GB of storage. It offers a seamless and powerful user experience with its advanced features and specifications. The Xiaomi 12T boasts a powerful processor, allowing for smooth multitasking and gaming.</p>', N'<p>The Xiaomi 12T is a high-performance smartphone with 16GB of RAM and 256GB of storage. It offers a seamless and powerful user experience with its advanced features and specifications. The Xiaomi 12T boasts a powerful processor, allowing for smooth multitasking and gaming.</p>', N'images/product/Xiaomi12T.jpg', 9900000, 0.1, 3, 6, N'Stocking', N'xiaomi-12t')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (33, N'True Wireless Sony WF-1000XM4', N'<ul>
<li>The Sony WF-1000XM4 is a true wireless earbuds offering from Sony.</li>
<li>These earbuds provide a truly immersive and high-quality audio experience with their advanced noise-canceling technology.</li>
<li>They are designed to deliver exceptional sound clarity and deep bass, making them ideal for music enthusiasts.</li>
</ul>', N'<p>The Sony WF-1000XM4 is a true wireless earbuds offering from Sony. These earbuds provide a truly immersive and high-quality audio experience with their advanced noise-canceling technology. They are designed to deliver exceptional sound clarity and deep bass, making them ideal for music enthusiasts.</p>', N'images/product/TrueWireLessSony.jpg', 6490000, 0, 4, 7, N'Stocking', N'true-wireless-sony-wf-1000xm4')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (34, N'Sony WH-1000XM5 ', N'<ul>
<li>Designed for comfort and convenience, the<strong> Sony WH-1000XM5 Pro</strong> boast a sleek and ergonomic design that fits perfectly in your ears.</li>
<li>They come with a wireless charging case, ensuring that your earbuds are always ready to use whenever you need them.</li>
</ul>', N'<p>Designed for comfort and convenience, the Sony WH-1000XM5 Pro boast a sleek and ergonomic design that fits perfectly in your ears. They come with a wireless charging case, ensuring that your earbuds are always ready to use whenever you need them.</p>', N'images/product/SonyWH.jpg', 7890000, 0, 4, 7, N'Stocking', N'sony-wh-1000xm5')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (35, N'AirPods Pro 2', N'<ul>
<li><strong>The AirPods 2 </strong>Pro deliver an immersive and crystal-clear sound experience, allowing you to truly immerse yourself in your favorite music, podcasts, and more.</li>
<li>With active noise cancellation technology, you can block out distractions and focus on the music you love.</li>
</ul>', N'<p>The AirPods 2 Pro deliver an immersive and crystal-clear sound experience, allowing you to truly immerse yourself in your favorite music, podcasts, and more. With active noise cancellation technology, you can block out distractions and focus on the music you love.</p>', N'images/product/AIRPOD.jpg', 7990000, 0.1, 4, 1, N'Stocking', N'airpods-pro-2')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (36, N' Soundbar Samsung HW-B450/XV', N'<p>The Samsung HW-B450/XV features a built-in subwoofer and multiple audio drivers, delivering immersive and room-filling sound. Whether you''re watching your favorite movies or enjoying your favorite music, this soundbar ensures rich and dynamic audio.</p>', N'<p>The Samsung HW-B450/XV features a built-in subwoofer and multiple audio drivers, delivering immersive and room-filling sound. Whether you''re watching your favorite movies or enjoying your favorite music, this soundbar ensures rich and dynamic audio.</p>', N'images/product/Soundbar.jpg', 3990000, 0.1, 4, 5, N'Stocking', N'soundbar-samsung-hw-b450-xv')
INSERT [dbo].[product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status], [code]) VALUES (37, N'DELL GAMING G15 5520 ', N'<ul>
<li>CPU: <strong>7 12700H</strong></li>
<li>RAM: <strong>16GB RAM</strong></li>
<li>SSD: <strong>512GB SSD.</strong></li>
<li>RTX3060 6G</li>
<li>Size: <strong>15.6 INCH FHD 165HZ.</strong></li>
</ul>', N'<p>- The Dell Gaming G15 5520 is equipped with an Intel Core i7 12700H processor, providing blazing-fast performance and smooth multitasking capabilities. With 16GB of RAM, you can expect seamless gameplay and efficient task handling. The 512GB SSD offers ample storage space for your games, files, and multimedia content.&nbsp;</p>
<ul>
<li>7 12700H/16GB RAM/ 512GB SSD.</li>
<li>RTX3060 6G/15.6 INCH FHD 165HZ.</li>
</ul>', N'images/product/DELLGAMING.jpg', 37349000, 0.1, 1, 2, N'Stocking', N'dell-gaming-g15-5520')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[warranty] ON 

INSERT [dbo].[warranty] ([warranty_id], [orderdetail_id], [product_id], [customer_id], [name], [phone], [product_name], [image], [image_product], [product_status], [warranty_date], [warranty_status], [warrant_quantity], [status], [product_status_admin], [image_product_admin], [warranty_date_admin]) VALUES (1, 1, 28, 1, N'Đỗ Văn Đạt', N'0902121881', N'Samsung Galaxy Z Flip4 - 256GB', N'images/product/SamsungGalaxyZFlip4.jpg', N'images/product/LenovoTabP11Pro__1_.jpg', N'new', CAST(N'2023-06-08' AS Date), N'Still Valid', 1, N'Process', N'<p>New</p>', N'images/product/SamsungGalaxyZFlip4.jpg', CAST(N'2023-06-13' AS Date))
INSERT [dbo].[warranty] ([warranty_id], [orderdetail_id], [product_id], [customer_id], [name], [phone], [product_name], [image], [image_product], [product_status], [warranty_date], [warranty_status], [warrant_quantity], [status], [product_status_admin], [image_product_admin], [warranty_date_admin]) VALUES (2, 2, 6, 1, N'Đỗ Văn Đạt', N'0902121881', N'APPLE MACBOOK AIR (256GB SSD/13.6 INCH IPS/SILVER)', N'images/product/18.png', N'images/product/18.png', N'OS error', CAST(N'2023-06-08' AS Date), N'Still Valid', 1, N'Wait', NULL, NULL, NULL)
INSERT [dbo].[warranty] ([warranty_id], [orderdetail_id], [product_id], [customer_id], [name], [phone], [product_name], [image], [image_product], [product_status], [warranty_date], [warranty_status], [warrant_quantity], [status], [product_status_admin], [image_product_admin], [warranty_date_admin]) VALUES (3, 3, 20, 1, N'Đỗ Văn Đạt', N'0902121881', N'iPhone 14 Pro Max (128GB)', N'images/product/Apple-iPhone-14-Pro-Max.jpg', N'images/product/Apple-iPhone-14-Pro-Max.jpg', N'OS error', CAST(N'2023-06-08' AS Date), N'Still Valid', 1, N'Wait', NULL, NULL, NULL)
INSERT [dbo].[warranty] ([warranty_id], [orderdetail_id], [product_id], [customer_id], [name], [phone], [product_name], [image], [image_product], [product_status], [warranty_date], [warranty_status], [warrant_quantity], [status], [product_status_admin], [image_product_admin], [warranty_date_admin]) VALUES (4, 4, 10, 1, N'Đỗ Văn Đạt', N'0902121881', N'APPLE MACBOOK PRO 13 (512GB SSD/13.3 INCH/GOLD)', N'images/product/1.jpg', N'images/product/1.jpg', N'OS error', CAST(N'2023-06-08' AS Date), N'Still Valid', 1, N'Wait', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[warranty] OFF
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD FOREIGN KEY([newsgroup_id])
REFERENCES [dbo].[news_group] ([newsgroup_id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[warranty]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[warranty]  WITH CHECK ADD FOREIGN KEY([orderdetail_id])
REFERENCES [dbo].[order_detail] ([orderdetail_id])
GO
ALTER TABLE [dbo].[warranty]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
USE [master]
GO
ALTER DATABASE [ProjectSWP391] SET  READ_WRITE 
GO
