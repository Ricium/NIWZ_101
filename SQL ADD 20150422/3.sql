USE [netinmlf_netint]
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Schools_Per_School]    Script Date: 2015/04/22 09:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].f_Admin_Remove_Results
	@ResultsId int
   
AS
DELETE FROM Results
		   WHERE ResultsId =@ResultsId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN
