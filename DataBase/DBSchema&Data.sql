USE [master]
GO
/****** Object:  Database [ShopBridge]    Script Date: 10-10-2021 8.52.05 PM ******/
CREATE DATABASE [ShopBridge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopBridge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopBridge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopBridge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopBridge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopBridge] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopBridge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopBridge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopBridge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopBridge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopBridge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopBridge] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopBridge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopBridge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopBridge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopBridge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopBridge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopBridge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopBridge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopBridge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopBridge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopBridge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopBridge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopBridge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopBridge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopBridge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopBridge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopBridge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopBridge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopBridge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopBridge] SET  MULTI_USER 
GO
ALTER DATABASE [ShopBridge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopBridge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopBridge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopBridge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopBridge] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopBridge] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopBridge] SET QUERY_STORE = OFF
GO
USE [ShopBridge]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10-10-2021 8.52.05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CategoryDescription] [nvarchar](250) NULL,
	[CreatedOn] [datetime] NULL,
	[updatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10-10-2021 8.52.05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductDescription] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[CategoryId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription], [CreatedOn], [updatedOn], [IsActive]) VALUES (2, N'Laptop', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', CAST(N'2021-10-07T11:48:42.147' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription], [CreatedOn], [updatedOn], [IsActive]) VALUES (3, N'Mobile', N'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', CAST(N'2021-10-07T11:49:55.980' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription], [CreatedOn], [updatedOn], [IsActive]) VALUES (4, N'PC Accessories', N'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', CAST(N'2021-10-07T11:51:41.073' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'4ad89e70-4e27-4a52-8e91-109a152aa475', N'Accessories 4', N'Molestias excepturi sint id est laborum et dolorum fuga, Occaecati cupiditate non provident, atque corrupti quos dolores et quas . At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.', 1290, 4, CAST(N'2021-10-07T21:43:28.640' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'dd192c88-78ca-4774-887a-50c61c9b90cd', N'Laptop 2', N'Sed sed lacinia lectus. Duis sit amet sodales felis. Duis nunc eros, convallis semper risus. Aliquam erat volutpat. Sed ut dui ut lacus dictum fermentum vel tincidunt neque. In adipiscing ultrices tellus, in suscipit massa vehicula eu.', 93490, 2, CAST(N'2021-10-07T19:55:48.773' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'26e12ba0-b035-4c82-a52d-77305737a661', N'Accessories 2', N'Deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,id est laborum et dolorum fuga. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.', 897, 4, CAST(N'2021-10-07T21:42:25.940' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'51a9a71b-4cb8-4bc8-94ef-81c6d7e81716', N'Accessories 5', N'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.', 1990, 4, CAST(N'2021-10-07T21:44:02.357' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'e932805e-8619-4083-a202-828a0f2c1e47', N'Laptop 3', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis nunc eros, convallis semper risus. In adipiscing ultrices tellus, in suscipit massa vehicula eu.', 72900, 2, CAST(N'2021-10-07T19:56:35.413' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'781be9eb-7b1a-4f31-beb7-942be19a69db', N'Accessories 1', N'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,id est laborum et dolorum fuga.', 999, 4, CAST(N'2021-10-07T21:41:26.423' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'92cf3d70-f5d8-4ac3-af7c-97f486474bb6', N'Laptop 4', N'Duis nunc eros, convallis semper risus. In adipiscing ultrices tellus, in suscipit massa vehicula eu.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 68900, 2, CAST(N'2021-10-07T19:57:15.717' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'f51943ab-ae57-495a-9260-9ad7696615c6', N'Mobile 1', N'Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam. Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis. Donec a dui et dui fringilla consectetur id nec massa.', 9909, 3, CAST(N'2021-10-07T11:57:36.630' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'a5468ef3-2593-4d63-81b0-a6d865fd9982', N'Mobile 2', N'Aliquam erat volutpat. Sed ut dui ut lacus dictum fermentum vel tincidunt neque. Sed sed lacinia lectus. Duis sit amet sodales felis. Duis nunc eros, convallis semper risus. In adipiscing ultrices tellus, in suscipit massa vehicula eu.', 16990, 3, CAST(N'2021-10-07T19:55:23.967' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'15342746-9e0d-4c4a-bb26-b2baf77b83c6', N'Laptop9', N'asdjhcbeh bnfiuenjckdvmoewmcl C', 1290, 0, CAST(N'2021-10-10T16:24:41.137' AS DateTime), CAST(N'2021-10-10T16:27:15.733' AS DateTime), 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'a6a5f2f5-3367-4988-ab76-c31e6c702412', N'Laptop 1', N'In adipiscing ultrices tellus, in suscipit massa vehicula eu. Aliquam erat volutpat. Sed ut dui ut lacus dictum fermentum vel tincidunt neque. Sed sed lacinia lectus. Duis sit amet sodales felis. Duis nunc eros, convallis semper risus.', 162990, 3, CAST(N'2021-10-07T19:55:39.033' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [Price], [CategoryId], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'b0a96028-e529-479c-9fd7-dd8f243801e6', N'Accessories 3', N'Occaecati cupiditate non provident, atque corrupti quos dolores et quas molestias excepturi sint id est laborum et dolorum fuga. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.', 2970, 4, CAST(N'2021-10-07T21:43:03.103' AS DateTime), NULL, 1)
GO
/****** Object:  StoredProcedure [dbo].[usp_AddInventory]    Script Date: 10-10-2021 8.52.06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddInventory]
	
	
	@productName varchar(50),
	@productDescription  varchar(250) ='',
	@price float,
	@CategoryId int =4,
	@isActive bit


AS
BEGIN
	
INSERT INTO [dbo].[Product]
           ([ProductId]
           ,[ProductName]
           ,[ProductDescription]
           ,[Price]
           ,[CategoryId]
           ,[CreatedOn]
           ,[UpdatedOn]
           ,[IsActive])
     VALUES
           (NEWID()
           ,@productName
           ,@productDescription
           ,@Price
           ,@CategoryId
           ,GetDATE()
           ,null
           ,@isActive)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteInventory]    Script Date: 10-10-2021 8.52.06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteInventory]
	@productId uniqueidentifier
AS
BEGIN
	UPDATE Product SET IsActive=0
	WHERE ProductId=@productId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetInventory]    Script Date: 10-10-2021 8.52.06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetInventory]
	
AS
BEGIN

SELECT P.[ProductId]
      ,P.[ProductName]
      ,P.[ProductDescription]
      ,P.[Price]
      ,P.[CategoryId]
      ,C.[CategoryName]
      ,C.[CategoryDescription]
      ,P.[IsActive]
  FROM [dbo].[Product]  P
  LEFT JOIN [dbo].[Category] C  ON P.CategoryId=C.CategoryId
  WHERE P.IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetInventoryById]    Script Date: 10-10-2021 8.52.06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetInventoryById]
	@id uniqueIdentifier
AS
BEGIN

SELECT P.[ProductId]
      ,P.[ProductName]
      ,P.[ProductDescription]
      ,P.[Price]
      ,P.[CategoryId]
      ,C.[CategoryName]
      ,C.[CategoryDescription]
      ,P.[IsActive]
  FROM [dbo].[Product]  P
  LEFT JOIN [dbo].[Category] C  ON P.CategoryId=C.CategoryId
  WHERE ProductId=@id AND P.IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateInventory]    Script Date: 10-10-2021 8.52.06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateInventory]
	
	@productId uniqueidentifier,
	@productName varchar(50),
	@productDescription  varchar(250),
	@price float,
	@isActive bit


AS
BEGIN
	UPDATE Product SET ProductName = @productName, ProductDescription=@productDescription, Price= @price, IsActive= @isActive, UpdatedOn=GETDATE()
	WHERE ProductId= @productId
END
GO
USE [master]
GO
ALTER DATABASE [ShopBridge] SET  READ_WRITE 
GO
