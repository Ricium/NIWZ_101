USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[f_Admin_Insert_RegisterClient]
@ClientId int ,
@ClientNo varchar(15),
@Email varchar(100),
@Passwords varchar(50) ,
@Approved bit 
			AS
			INSERT INTO RegisterClient  
			(
			ClientId,
			ClientNo,
			Email,
			Passwords,
			Approved
						  )
			VALUES
			(
			@ClientId,
			@ClientNo,
			@Email,
			@Passwords,
			@Approved
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN