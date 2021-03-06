USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Fixtures]    Script Date: 2015/04/06 07:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[f_Admin_Insert_Fixtures]


@FieldsId int,
@ClientId int,
@TeamIdA int,
@TeamIdB int,
@StartTime datetime,
@SportCategoryId int
			AS
			INSERT INTO fixtures  
			(
			
			TeamIdA,
			TeamIdB,
			StartTime,
			FieldsId,
			ClientId,
			SportCategoryId
						  )
			VALUES
			(
	@TeamIdA,
	@TeamIdB,
	@StartTime,
	@FieldsId,
	@ClientId,
	@SportCategoryId
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN