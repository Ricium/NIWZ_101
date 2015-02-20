USE [netinmlf_netint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE f_Admin_Remove_Fields_Per_School 
	@ClientId int
   
AS
DELETE FROM Fields
		   WHERE ClientId =@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN