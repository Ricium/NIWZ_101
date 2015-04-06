USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Fixtures] 
	@FixturesId int
   
AS
DELETE FROM fixtures
		   WHERE FixturesId=@FixturesId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN
