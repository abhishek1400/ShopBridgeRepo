USE [ShopBridge]
GO

/****** Object:  StoredProcedure [dbo].[usp_UpdateInventory]    Script Date: 10-10-2021 8.57.03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[usp_UpdateInventory]
	
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


