USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Fields]    Script Date: 2015/03/19 01:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[f_Admin_Insert_Fields]


@FieldName varchar(50),
@ClientId int,
@SportCategoryID int
			AS
			INSERT INTO Fields  
			(
			
			ClientId,
			FieldName,
			SportCategoryID
						  )
			VALUES
			(
	@ClientId,
	@FieldName,
	@SportCategoryID
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN