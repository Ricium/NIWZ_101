USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_RegisterClient]
@RegisterClientID int,
@ClientId int ,
@ClientNo varchar(15),
@Email varchar(100),
@Passwords varchar(50) ,
@Approved bit 
	
AS
UPDATE RegisterClient 
           SET 
		ClientId=@ClientId,
		ClientNo = @ClientNo,
		Email =@Email,
		Passwords =@Passwords,
	@Approved = @Approved
		   WHERE RegisterClientID =@RegisterClientID
    
SET NOCOUNT ON 
	RETURN