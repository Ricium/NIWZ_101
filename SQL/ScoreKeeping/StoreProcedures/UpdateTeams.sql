USE [netinmlf_netint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Teams]
@TeamsId int,
@Name varchar(50),
@Age varchar(10),
@Ranks varchar(1),
@ClientId int
	
AS
UPDATE Teams 
           SET 
		Name=@Name,
		Age = @Age,
		Ranks =@Ranks,
		ClientId =@ClientId
		   WHERE TeamsId =@TeamsId
    
SET NOCOUNT ON 
	RETURN