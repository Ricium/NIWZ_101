USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Teams]    Script Date: 2015/03/19 03:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[f_Admin_Update_Teams]
@TeamsId int,
@Name varchar(50),
@Age varchar(10),
@Ranks varchar(1),
@ClientId int,
@SportCategoryID int
	
AS
UPDATE Teams 
           SET 
		Name=@Name,
		Age = @Age,
		Ranks =@Ranks,
		ClientId =@ClientId,
		SportCategoryID =@SportCategoryID
		   WHERE TeamsId =@TeamsId
    
SET NOCOUNT ON 
	RETURN