USE [ShopBridge]
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteInventory]    Script Date: 10-10-2021 8.53.54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[usp_DeleteInventory]
	@productId uniqueidentifier
AS
BEGIN
	UPDATE Product SET IsActive=0
	WHERE ProductId=@productId
END
GO


