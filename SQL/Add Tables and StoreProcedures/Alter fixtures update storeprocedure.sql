USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Fixtures]    Script Date: 2015/04/06 07:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[f_Admin_Update_Fixtures]
@FixturesId int,
@FieldsId int,
@ClientId int,
@TeamIdA int,
@TeamIdB int,
@StartTime datetime,
@SportCategoryId int
	
AS
UPDATE fixtures 
           SET 
		FieldsId=@FieldsId,
		TeamIdA = @TeamIdA,
		TeamIdB =@TeamIdB,
		StartTime =@StartTime,
		ClientId =@ClientId,
		SportCategoryId =@SportCategoryId
		   WHERE FixturesId =@FixturesId
    
SET NOCOUNT ON 
	RETURN