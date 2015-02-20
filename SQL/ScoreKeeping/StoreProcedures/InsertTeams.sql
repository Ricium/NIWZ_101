USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[f_Admin_Insert_Teams]


@Name varchar(50),
@Age varchar(10),
@Ranks varchar(1),
@ClientId int
			AS
			INSERT INTO Teams  
			(
			
			Name,
			Age,
			Ranks,
			ClientId
						  )
			VALUES
			(
	@Name,
	@Age,
	@Ranks,
	@ClientId
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN