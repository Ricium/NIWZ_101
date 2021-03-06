USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Teams]    Script Date: 2015/03/19 03:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[f_Admin_Insert_Teams]


@Name varchar(50),
@Age varchar(10),
@Ranks varchar(1),
@ClientId int,
@SportCategoryID int,
@PictureId int
			AS
			INSERT INTO Teams  
			(
			
			Name,
			Age,
			Ranks,
			ClientId,
			SportCategoryID,
			PictureId
						  )
			VALUES
			(
	@Name,
	@Age,
	@Ranks,
	@ClientId,
	@SportCategoryID,
	@PictureId
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN