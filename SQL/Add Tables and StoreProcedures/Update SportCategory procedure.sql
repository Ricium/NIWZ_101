USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[f_Admin_Update_Fields]
@SportCategoryId int ,
@CategoryName varchar(100),
@ClientID int
AS
UPDATE SportCategory 
           SET 
		CategoryName=@CategoryName,
		ClientId =@ClientId
		   WHERE SportCategoryId =@SportCategoryId
    
SET NOCOUNT ON 
	RETURN