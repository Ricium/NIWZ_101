USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[f_Admin_Insert_SportCategory]


@CategoryName varchar(100),
@ClientID int
			AS
			INSERT INTO SportCategory  
			(
			
			ClientId,
			CategoryName
						  )
			VALUES
			(
	@ClientId,
	@CategoryName
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN