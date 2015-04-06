USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Fields]    Script Date: 2015/03/19 01:50:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[f_Admin_Update_Fields]
			@FieldsId int,
@FieldName varchar(50),
@ClientId int,
@SportCategoryID int
	
AS
UPDATE Fields 
           SET 
		FieldName=@FieldName,
		ClientId =@ClientId,
		SportCategoryID =@SportCategoryID 
		   WHERE FieldsId =@FieldsId
    
SET NOCOUNT ON 
	RETURN