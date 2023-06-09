USE [master]
GO
/****** Object:  Database [cis55_49]    Script Date: 3/28/2023 2:49:11 PM ******/
CREATE DATABASE [cis55_49]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cis55_49', FILENAME = N'E:\MSSQL\DATA\cis55_49.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cis55_49_log', FILENAME = N'E:\MSSQL\LOG\cis55_49_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [cis55_49] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cis55_49].[dbo].[sp_fulltext_database] @action = 'enable'
GO
ALTER DATABASE [cis55_49] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cis55_49] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cis55_49] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cis55_49] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cis55_49] SET ARITHABORT OFF 
GO
ALTER DATABASE [cis55_49] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cis55_49] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cis55_49] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cis55_49] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cis55_49] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cis55_49] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cis55_49] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cis55_49] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cis55_49] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cis55_49] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cis55_49] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cis55_49] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cis55_49] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cis55_49] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cis55_49] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cis55_49] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cis55_49] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cis55_49] SET RECOVERY FULL 
GO
ALTER DATABASE [cis55_49] SET  MULTI_USER 
GO
ALTER DATABASE [cis55_49] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cis55_49] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cis55_49] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cis55_49] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cis55_49] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cis55_49] SET QUERY_STORE = OFF
GO
USE [cis55_49]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [cis55_49]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] NOT NULL,
	[Customer_Name] [varchar](50) NULL,
	[Customer_Address] [varchar](50) NULL,
	[Phone] [int] NULL,
	[Email] [varchar](50) NULL,
	[Customer_Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] NOT NULL,
	[User_Name] [varchar](255) NOT NULL,
	[User_Status] [varchar](30) NULL,
	[User_Password] [varchar](10) NULL,
	[User_Email] [varchar](50) NULL,
	[Customer_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[customer_info]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[customer_info] AS
SELECT 
    c.customer_name, 
    u.user_email, 
    u.user_name, 
    u.user_password 
FROM 
    customer as c  
    JOIN [User] as u 
    ON c.customer_id = u.customer_id;
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Vendor_ID] [int] NOT NULL,
	[Vendor_Name] [varchar](64) NULL,
	[Vendor_Check_Name] [varchar](64) NULL,
	[Address_ID] [varchar](60) NULL,
	[Phone_Number] [int] NULL,
	[Vendor_Status] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Order]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order](
	[Purchase_Order_ID] [int] NOT NULL,
	[Purchase_order_Status] [varchar](50) NULL,
	[Verdor_ID] [int] NULL,
	[SalesPerson_ID] [int] NULL,
	[Purchase_Order_amount] [decimal](20, 3) NULL,
	[Purchase_order_date] [date] NULL,
	[Product_ID] [int] NULL,
	[Purchase_Order_quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Purchase_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vendor_purchases_info]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vendor_purchases_info] AS
SELECT 
    v.vendor_name, 
    p.purchase_order_id, 
    p.purchase_order_date, 
    p.purchase_order_amount 
FROM 
    vendor as v 
    JOIN Purchase_Order as p  
    ON v.vendor_id = p.Verdor_ID;
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[Shipping_ID] [int] NOT NULL,
	[Order_ID] [int] NULL,
	[Shipping_type] [varchar](250) NULL,
	[Shipping_Company] [varchar](60) NULL,
	[Shipping_Street] [varchar](80) NULL,
	[Shipping_City] [varchar](60) NULL,
	[Shipping_state] [varchar](10) NULL,
	[Shipping_Zip] [int] NULL,
	[Shipping_date] [date] NULL,
	[Shipping_cost] [float] NULL,
	[Shipping_status] [varchar](40) NULL,
	[Inventory_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Shipping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Inventory_ID] [int] NOT NULL,
	[Product_ID] [int] NULL,
	[Inventory_Status] [varchar](100) NULL,
	[Inventory_Name] [varchar](100) NULL,
	[Inventory_Description] [varchar](1000) NULL,
	[Product_Price] [decimal](20, 3) NULL,
	[Inventory_Serial_Number] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Inventory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ShippingDelivery]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ShippingDelivery]
as
select Shipping.Shipping_status, Inventory.Inventory_Name
from Shipping
INNER JOIN Inventory
on Shipping.Inventory_ID = Inventory.Inventory_ID
GO
/****** Object:  Table [dbo].[Customer_Order]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Order](
	[Order_ID] [int] NOT NULL,
	[Order_Status] [varchar](50) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[SalesPerson_ID] [int] NOT NULL,
	[Order_amount] [decimal](20, 3) NOT NULL,
	[Address_ID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Profit_by_Area]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Profit_by_Area] AS
SELECT Address_ID, Order_amount
FROM  Customer_Order

GO
/****** Object:  View [dbo].[Customer_Orders_Per_Month]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Customer_Orders_Per_Month] AS
SELECT Customer_ID, OrderDate
FROM  Customer_Order

GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] NOT NULL,
	[Address_Street] [varchar](50) NOT NULL,
	[Address_City] [varchar](50) NOT NULL,
	[Address_State] [varchar](50) NOT NULL,
	[Address_ZipCode] [int] NOT NULL,
	[IsShipping] [int] NULL,
	[IsBilling] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[Asset_ID] [int] NOT NULL,
	[Customer_Name] [varchar](100) NULL,
	[Phone] [int] NULL,
	[Email] [varchar](100) NULL,
	[Customer_Address] [varchar](100) NULL,
	[Order_ID] [int] NULL,
	[Price] [int] NULL,
	[Product_Type] [varchar](100) NULL,
	[Product_ID] [int] NULL,
	[Product_Name] [varchar](100) NULL,
	[Product_SN] [varchar](100) NULL,
	[Product_Status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Asset_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Line]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Line](
	[Order_line_ID] [int] NOT NULL,
	[order_line_Status] [varchar](100) NULL,
	[Order_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Product_Price] [decimal](20, 3) NULL,
	[Order_line_Quantity] [int] NULL,
	[Order_line_total] [decimal](20, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Method]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Method](
	[Payment_Method_ID] [int] NOT NULL,
	[Payment_Method_Status] [varchar](50) NULL,
	[Customer_ID] [int] NULL,
	[Payment_Method_Type] [varchar](50) NULL,
	[Card_No] [int] NULL,
	[Expired_Date] [date] NULL,
	[Name_On_Card] [varchar](50) NULL,
	[Billing_Address] [varchar](50) NULL,
	[Zip_Code] [int] NULL,
	[CVC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_Method_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Payments_ID] [int] NOT NULL,
	[Order_ID] [int] NULL,
	[Payment_amount] [int] NULL,
	[Payment_Status] [varchar](60) NULL,
	[Payment_notes] [varchar](500) NULL,
	[Payment_date] [date] NULL,
	[Payment_Method_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Payments_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] NOT NULL,
	[Product_Status] [varchar](100) NULL,
	[Product_Name] [varchar](100) NULL,
	[Product_Description] [varchar](1000) NULL,
	[Product_Price] [decimal](20, 3) NULL,
	[Product_Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_Person]    Script Date: 3/28/2023 2:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Person](
	[Sales_Person_ID] [int] NOT NULL,
	[Sales_Person_Name] [varchar](50) NULL,
	[Sales_Person_Status] [varchar](50) NULL,
	[Sales_Person_Email] [varchar](50) NULL,
	[Sales_Person_Title] [varchar](50) NULL,
	[Sales_Person_Dept] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sales_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10001, N'765 Mariot St', N'Houston', N'TX', 77551, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10002, N'755 Pacific St', N'El Dorado', N'CA', 89411, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10003, N'9955 Blam St', N'Santa Clara', N'CA', 89554, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10004, N'125 King Rd', N'San Jose', N'CA', 95122, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10005, N'655 White Rd', N'San Jose', N'CA', 95123, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10006, N'365 Reed St', N'Santa Clara', N'CA', 95050, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10007, N'2075 25th St', N'Brooklyn', N'NY', 11223, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10008, N'8654 Manhattan St', N'New York', N'NY', 10451, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10009, N'60 Van Duzer St', N'Staten Island', N'NY', 10301, 1, 1)
INSERT [dbo].[Address] ([Address_ID], [Address_Street], [Address_City], [Address_State], [Address_ZipCode], [IsShipping], [IsBilling]) VALUES (10010, N'50 Evsun Dr', N'Centerville', N'MA', 2632, 1, 1)
GO
INSERT [dbo].[Asset] ([Asset_ID], [Customer_Name], [Phone], [Email], [Customer_Address], [Order_ID], [Price], [Product_Type], [Product_ID], [Product_Name], [Product_SN], [Product_Status]) VALUES (100001, N'Maggie Luu', 5108765, N'mluu@yahoo.com', N'765 Mariot St,Houston,TX,77551', 11111, 35, N'Jewelry', 500087, N'Couple Necklace', N'None', N'New')
INSERT [dbo].[Asset] ([Asset_ID], [Customer_Name], [Phone], [Email], [Customer_Address], [Order_ID], [Price], [Product_Type], [Product_ID], [Product_Name], [Product_SN], [Product_Status]) VALUES (100002, N'Shane May', 4089865, N'shane_m@aol.com', N'755 Pacific St,El Dorado,CA,89411', 11112, 26, N'Clothes', 600054, N'Mens Cargo Pants', N'None', N'New')
INSERT [dbo].[Asset] ([Asset_ID], [Customer_Name], [Phone], [Email], [Customer_Address], [Order_ID], [Price], [Product_Type], [Product_ID], [Product_Name], [Product_SN], [Product_Status]) VALUES (100003, N'Jie Tang', 6508764, N'jae@outlook.com', N'9955 Blam St, Santa Clara, CA, 89554', 11113, 25, N'Clothes', 200045, N'Women Wide Jeans', N'None', N'New')
GO
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (1, N'Maggie Luu', N'765 Mariot St,Houston,TX,77551', 5108765, N'mluu@yahoo.com', N'Active')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (2, N'Shane May', N'755 Pacific St,El Dorado,CA,89411', 4089865, N'shane_m@aol.com', N'Active')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (3, N'Jie Tang', N'365 Reed St, Santa Clara,CA 95050', 6508764, N'jae@outlook.com', N'Active')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (4, N'Guillermo Gomez', N'765 Mariot St, Houston, TX 77551', 8068790, N'g_gomez@gmail.com', N'Active')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (5, N'Shamsi Tebyami', N'755 Pacific St, El Dorado, CA 89411', 7757890, N'shamsi_t@me.com', N'Inactive')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (6, N'Min Joong Yoo', N'9955 Blam St, Santa Clara, CA 89554', 4808677, N'mjy76@icloud.com', N'Active')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (7, N'Nella Dang', N'2075 25st, Brooklyn, NY 11223', 4087257, N'n_dang@hotmail.com', N'Inactive')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (8, N'An Ngo', N'8654 Manhattan St, New York, NY 10451', 6509837, N'iron_man@island.com', N'Active')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (9, N'James Kim', N'60 Van Duzer St, Staten Island, NY 10301', 5108373, N'james@dozenice.com', N'Active')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Address], [Phone], [Email], [Customer_Status]) VALUES (10, N'Christina Lopez', N'50 Evsun Dr, Centerville, MA 02632', 6779268, N'christina876@hotmail.es', N'Active')
GO
INSERT [dbo].[Customer_Order] ([Order_ID], [Order_Status], [Customer_ID], [SalesPerson_ID], [Order_amount], [Address_ID], [OrderDate]) VALUES (11111, N'Processing', 1, 80001, CAST(34.990 AS Decimal(20, 3)), 10001, CAST(N'2023-01-15' AS Date))
INSERT [dbo].[Customer_Order] ([Order_ID], [Order_Status], [Customer_ID], [SalesPerson_ID], [Order_amount], [Address_ID], [OrderDate]) VALUES (11112, N'Delivered', 2, 80007, CAST(25.990 AS Decimal(20, 3)), 10002, CAST(N'2023-01-13' AS Date))
INSERT [dbo].[Customer_Order] ([Order_ID], [Order_Status], [Customer_ID], [SalesPerson_ID], [Order_amount], [Address_ID], [OrderDate]) VALUES (11113, N'Processing', 3, 80008, CAST(74.670 AS Decimal(20, 3)), 10003, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (101, 150072, N'In Stock', N'Jewelry', N'Earring Stud Flower', CAST(5.990 AS Decimal(20, 3)), N'J123456')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (102, 200045, N'In Stock', N'Clothes', N'Women Wide Jeans', CAST(24.890 AS Decimal(20, 3)), N'C123456')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (103, 270063, N'Out of Stock', N'Clothes', N'Couple T-Shirt', CAST(55.890 AS Decimal(20, 3)), N'C234567')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (104, 300021, N'In Stock', N'Jewelry', N'Men Cross Detail Ring 5pcs', CAST(4.990 AS Decimal(20, 3)), N'J012345')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (105, 400065, N'In Stock', N'Shoes', N'Men Hiking Shoes', CAST(55.890 AS Decimal(20, 3)), N'S123456')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (106, 500087, N'In Stock', N'Jewelry', N'Couple Necklace Star', CAST(34.990 AS Decimal(20, 3)), N'J234567')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (107, 600054, N'In Stock', N'Clothes', N'Men Cargo Pants', CAST(25.990 AS Decimal(20, 3)), N'C012345')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (108, 700054, N'Low In Stock', N'Shoes', N'Low Drunk Shoes', CAST(99.000 AS Decimal(20, 3)), N'S234567')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (109, 800075, N'In Stock', N'Clothes', N'Set Pajama', CAST(36.950 AS Decimal(20, 3)), N'C345678')
INSERT [dbo].[Inventory] ([Inventory_ID], [Product_ID], [Inventory_Status], [Inventory_Name], [Inventory_Description], [Product_Price], [Inventory_Serial_Number]) VALUES (110, 900087, N'Out of Stock', N'Shoes', N'Women Platform Shoes', CAST(44.950 AS Decimal(20, 3)), N'S012345')
GO
INSERT [dbo].[Order_Line] ([Order_line_ID], [order_line_Status], [Order_ID], [Product_ID], [Product_Price], [Order_line_Quantity], [Order_line_total]) VALUES (99001, N'Active', 11111, 500087, CAST(34.990 AS Decimal(20, 3)), 1, CAST(34.990 AS Decimal(20, 3)))
INSERT [dbo].[Order_Line] ([Order_line_ID], [order_line_Status], [Order_ID], [Product_ID], [Product_Price], [Order_line_Quantity], [Order_line_total]) VALUES (99002, N'Active', 11112, 600054, CAST(25.990 AS Decimal(20, 3)), 1, CAST(25.990 AS Decimal(20, 3)))
INSERT [dbo].[Order_Line] ([Order_line_ID], [order_line_Status], [Order_ID], [Product_ID], [Product_Price], [Order_line_Quantity], [Order_line_total]) VALUES (99003, N'Active', 11113, 200045, CAST(24.890 AS Decimal(20, 3)), 3, CAST(74.670 AS Decimal(20, 3)))
GO
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65001, N'Active', 1, N'VISA', 425578064, CAST(N'2027-11-01' AS Date), N'Maggie Luu', N'125 King Rd, San Jose, CA', 95122, 696)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65002, N'Inactive', 2, N'AMEX', 310076489, CAST(N'2026-09-01' AS Date), N'Shane May', N'655 White Rd, San Jose, CA', 95123, 923)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65003, N'Active', 3, N'DISCOVERY', 900642678, CAST(N'2025-10-01' AS Date), N'Jie Tang', N'365 Reed St, Santa Clara, CA', 95050, 876)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65004, N'Active', 4, N'VISA', 728803026, CAST(N'2023-12-01' AS Date), N'Guillermo Gomez', N'765 Mariot St, Houston, TX', 77551, 123)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65005, N'Inactive', 5, N'VISA', 986562883, CAST(N'2025-06-01' AS Date), N'Shamsi Tebyami', N'755 Pacific St, El Dorado, CA', 89411, 566)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65006, N'Active', 6, N'AMEX', 222008756, CAST(N'2026-08-06' AS Date), N'Min Joong Yoo', N'9955 Blam St, Santa Clara, CA', 89554, 989)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65007, N'Inactive', 7, N'DISCOVERY', 998765678, CAST(N'2023-09-06' AS Date), N'Nella Dang', N'2075 25st, Brooklyn, NY', 11223, 654)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65008, N'Active', 8, N'AMEX', 320076489, CAST(N'2027-03-27' AS Date), N'An Ngo', N'8654 Manhattan St, New York, NY', 10451, 909)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65009, N'Active', 9, N'VISA', 837380888, CAST(N'2024-05-07' AS Date), N'James Kim', N'60 Van Duzer St, Staten Island, NY', 10301, 427)
INSERT [dbo].[Payment_Method] ([Payment_Method_ID], [Payment_Method_Status], [Customer_ID], [Payment_Method_Type], [Card_No], [Expired_Date], [Name_On_Card], [Billing_Address], [Zip_Code], [CVC]) VALUES (65010, N'Active', 10, N'VISA', 2765262, CAST(N'2024-11-11' AS Date), N'Christina Lopez', N'50 Evsun Dr, Centerville, MA', 2632, 357)
GO
INSERT [dbo].[Payments] ([Payments_ID], [Order_ID], [Payment_amount], [Payment_Status], [Payment_notes], [Payment_date], [Payment_Method_ID]) VALUES (12344, 11111, 35, N'Incomplete', N'Card error', CAST(N'2023-01-15' AS Date), 65001)
INSERT [dbo].[Payments] ([Payments_ID], [Order_ID], [Payment_amount], [Payment_Status], [Payment_notes], [Payment_date], [Payment_Method_ID]) VALUES (12355, 11112, 26, N'Complete', N'Done', CAST(N'2023-01-13' AS Date), 65003)
INSERT [dbo].[Payments] ([Payments_ID], [Order_ID], [Payment_amount], [Payment_Status], [Payment_notes], [Payment_date], [Payment_Method_ID]) VALUES (12366, 11113, 25, N'Incomplete', N'Enter your address', CAST(N'2023-02-20' AS Date), 65008)
INSERT [dbo].[Payments] ([Payments_ID], [Order_ID], [Payment_amount], [Payment_Status], [Payment_notes], [Payment_date], [Payment_Method_ID]) VALUES (12377, 11114, 67, N'Complete', N'Done', CAST(N'2022-12-25' AS Date), 65004)
INSERT [dbo].[Payments] ([Payments_ID], [Order_ID], [Payment_amount], [Payment_Status], [Payment_notes], [Payment_date], [Payment_Method_ID]) VALUES (12388, 11115, 90, N'Complete', N'Done', CAST(N'2022-10-24' AS Date), 65005)
INSERT [dbo].[Payments] ([Payments_ID], [Order_ID], [Payment_amount], [Payment_Status], [Payment_notes], [Payment_date], [Payment_Method_ID]) VALUES (12399, 11116, 25, N'Complete', N'Done', CAST(N'2023-02-15' AS Date), 65002)
GO
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (150072, N'In Stock', N'Jewelry', N'Earring Stud Flower', CAST(5.990 AS Decimal(20, 3)), 50)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (200045, N'In Stock', N'Clothes', N'Women Wide Jeans', CAST(24.890 AS Decimal(20, 3)), 15)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (270063, N'Out of Stock', N'Clothes', N'Couple T-Shirt', CAST(55.890 AS Decimal(20, 3)), 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (300021, N'In Stock', N'Jewelry', N'Men Cross Detail Ring 5pcs', CAST(4.990 AS Decimal(20, 3)), 5)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (400065, N'In Stock', N'Shoes', N'Men Hiking Shoes', CAST(55.890 AS Decimal(20, 3)), 10)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (500087, N'In Stock', N'Jewelry', N'Couple Necklace Star ', CAST(34.990 AS Decimal(20, 3)), 3)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (600054, N'In Stock', N'Clothes', N'Men Cargo Pants', CAST(25.990 AS Decimal(20, 3)), 8)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (700054, N'Low in Stock', N'Shoes', N'Low Drunk Shoes', CAST(99.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (800075, N'In Stock', N'Clothes', N'Set Pajama ', CAST(36.950 AS Decimal(20, 3)), 7)
INSERT [dbo].[Product] ([Product_ID], [Product_Status], [Product_Name], [Product_Description], [Product_Price], [Product_Quantity]) VALUES (900087, N'Out of Stock', N'Shoes', N'Women Platform Shoes', CAST(44.950 AS Decimal(20, 3)), 0)
GO
INSERT [dbo].[Purchase_Order] ([Purchase_Order_ID], [Purchase_order_Status], [Verdor_ID], [SalesPerson_ID], [Purchase_Order_amount], [Purchase_order_date], [Product_ID], [Purchase_Order_quantity]) VALUES (999001, N'Processing', 70007, 80001, CAST(34.990 AS Decimal(20, 3)), CAST(N'2023-01-15' AS Date), 500087, 1)
INSERT [dbo].[Purchase_Order] ([Purchase_Order_ID], [Purchase_order_Status], [Verdor_ID], [SalesPerson_ID], [Purchase_Order_amount], [Purchase_order_date], [Product_ID], [Purchase_Order_quantity]) VALUES (999002, N'Delivered', 70002, 80008, CAST(25.990 AS Decimal(20, 3)), CAST(N'2023-01-13' AS Date), 600054, 1)
INSERT [dbo].[Purchase_Order] ([Purchase_Order_ID], [Purchase_order_Status], [Verdor_ID], [SalesPerson_ID], [Purchase_Order_amount], [Purchase_order_date], [Product_ID], [Purchase_Order_quantity]) VALUES (999003, N'Processing', 70007, 80007, CAST(24.890 AS Decimal(20, 3)), CAST(N'2023-01-15' AS Date), 200045, 3)
GO
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80001, N'John Axel', N'Active', N'john.axel@goodmarket.com', N'Sales Representative', N'Jewelry')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80002, N'Jane Woo', N'Active', N'jane.woo@goodmarket.com', N'Sales Representative', N'Clothes')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80003, N'Beatrice Clackson', N'Active', N'beaterice.clackson@goodmarket.com', N'Sales Representative', N'Shoes')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80004, N'Cory Scheder', N'Active', N'cory_s2@goodmarket.com', N'Sales Representative', N'Shoes')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80005, N'Andy Jing', N'Active', N'andy.jing@goodmarket.com', N'Sales Representative', N'Jewelry')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80006, N'Sam Martin', N'Inactive', N'Smartin@goodmarket.com', N'Sales Representative', N'Jewelry')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80007, N'Justin Goodwins', N'Active', N'J18368@goodmarket.com', N'Sales Representative', N'Clothes')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80008, N'Kenneth Lee', N'Active', N'Kenneth@goodmarket.com', N'Sales Representative', N'Clothes')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80009, N'John Im', N'Actice', N'John_im@goodmarket.com', N'Sales Representative', N'Shoes')
INSERT [dbo].[Sale_Person] ([Sales_Person_ID], [Sales_Person_Name], [Sales_Person_Status], [Sales_Person_Email], [Sales_Person_Title], [Sales_Person_Dept]) VALUES (80010, N'Alondra Mitchelle', N'Active', N'Alondra@goodmarket.com', N'Sales Representative', N'Jewelry')
GO
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666001, 11111, N'Ground', N'Fedex', N'765 Mariot St', N'Houston', N'TX', 77551, CAST(N'2023-03-20' AS Date), 7.99, N'Shipped', 105)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666002, 11112, N'Express', N'UPS', N'755 Pacific St', N'El Dorado', N'CA', 89411, CAST(N'2023-02-10' AS Date), 12, N'Shipped', 108)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666003, 11113, N'First Class', N'UPSP', N'9955 Blam St', N'Santa Clara', N'CA', 89551, CAST(N'2023-01-25' AS Date), 0, N'Delivered', 107)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666004, 11114, N'Priority', N'USPS', N'125 King Rd', N'San Jose', N'CA', 95122, CAST(N'2022-11-11' AS Date), 5.99, N'Delivered', 102)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666005, 11115, N'Overnight', N'Fedex', N'655 White Rd', N'San Jose', N'CA', 95123, CAST(N'2022-12-22' AS Date), 18, N'Delivered', 101)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666006, 11116, N'Ground', N'UPS', N'365 Reed St', N'Santa Clara', N'CA', 95050, CAST(N'2023-03-15' AS Date), 7.99, N'Shipped', 110)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666007, 11117, N'Ground', N'UPS', N'2075 25th St', N'Brooklyn', N'NY', 11223, CAST(N'2023-02-28' AS Date), 7.99, N'Shipped', 103)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666008, 11118, N'Ground', N'Fedex', N'8654 Manhattan St', N'New York', N'NY', 10451, CAST(N'2022-09-17' AS Date), 8.99, N'Delivered', 106)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666009, 11119, N'Express', N'USPS', N'60 Van Duzer St', N'Staten Island', N'NY', 10301, CAST(N'2022-05-08' AS Date), 12, N'Delivered', 109)
INSERT [dbo].[Shipping] ([Shipping_ID], [Order_ID], [Shipping_type], [Shipping_Company], [Shipping_Street], [Shipping_City], [Shipping_state], [Shipping_Zip], [Shipping_date], [Shipping_cost], [Shipping_status], [Inventory_ID]) VALUES (666010, 11120, N'First Class', N'USPS', N'50 Evsun Dr', N'Centerville', N'MA', 2632, CAST(N'2023-03-12' AS Date), 15.99, N'Shipped', 104)
GO
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (1011, N'wheel_wheel', N'Active', N'runrunnn!!', N'christina876@hotmail.es', 10)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (1122, N'maybeline2', N'Active', N'iusethis$$', N'james@dozenice.com', 9)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (2233, N'mimamo_d', N'Active', N'@yaayyyy!', N'mluu@yahoo.com', 1)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (3344, N'mayflower', N'Active', N'betonit!', N'shane_m@aol.com', 2)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (4455, N'spow_wow', N'Active', N'MiniJie$', N'jae@outlook.com', 3)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (5566, N'Gomeeee', N'Active', N'Loveoreo4!', N'g_gomez@gmail.com', 4)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (6677, N'metaphor', N'Inactive', N'doyouknow?', N'shamsi_t@me.com', 5)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (7788, N'falashaa', N'Active', N'maybecall?', N'mjy76@icloud.com', 6)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (8899, N'yolandaaa', N'Inactive', N'yohayooha!', N'n_dang@hotmail.com', 7)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Status], [User_Password], [User_Email], [Customer_ID]) VALUES (9910, N'junebug', N'Active', N'JUNE_b!', N'iron_man@island.com', 8)
GO
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70001, N'Abercrombie', N'Abercrombie Company', N'10004', 4803772, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70002, N'Levis', N'Levis Company', N'10005', 5301347, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70003, N'Vans', N'Vans Company', N'10006', 2305748, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70004, N'Converse', N'Converse Company', N'10007', 6714300, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70005, N'Coach', N'Coach Company', N'10008', 7210093, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70006, N'REI', N'REI Company', N'10009', 4503221, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70007, N'Wholesale Jewelry Website', N'Wholesale Jewelry Website Company', N'10010', 8210021, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Vendor_Check_Name], [Address_ID], [Phone_Number], [Vendor_Status]) VALUES (70008, N'Essence Sleepwear', N'Essence Sleepwear Company', N'10011', 5220912, N'Active')
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Customer_Order]  WITH CHECK ADD FOREIGN KEY([SalesPerson_ID])
REFERENCES [dbo].[Sale_Person] ([Sales_Person_ID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([Payment_Method_ID])
REFERENCES [dbo].[Payment_Method] ([Payment_Method_ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
USE [master]
GO
ALTER DATABASE [cis55_49] SET  READ_WRITE 
GO
