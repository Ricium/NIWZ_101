USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Fields]    Script Date: 2015/03/19 01:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_SportCategory] 
	@SportCategoryId int
   
AS
DELETE FROM SportCategory
		   WHERE SportCategoryId=@SportCategoryId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN
