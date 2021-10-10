USE [ShopBridge]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetInventoryById]    Script Date: 10-10-2021 9.03.02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[usp_GetInventoryById]
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


