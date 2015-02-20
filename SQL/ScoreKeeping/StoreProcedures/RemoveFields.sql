USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE f_Admin_Remove_Fields 
	@FieldsId int
   
AS
DELETE FROM Fields
		   WHERE FieldsId=@FieldsId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN
