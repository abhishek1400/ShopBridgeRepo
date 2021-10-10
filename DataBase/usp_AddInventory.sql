USE [ShopBridge]
GO

/****** Object:  StoredProcedure [dbo].[usp_AddInventory]    Script Date: 10-10-2021 8.52.32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[usp_AddInventory]
	
	
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


