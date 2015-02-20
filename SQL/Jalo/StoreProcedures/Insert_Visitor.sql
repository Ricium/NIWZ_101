USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[f_Admin_Insert_Visitors]
@ClientId int ,
@ClientNo varchar(15) ,
@VisitorNo varchar(15) ,
@ModifiedDate datetime ,
@SendReceived bit 
			AS
			INSERT INTO Visitors  
			(
			ClientId,
			ClientNo,
			VisitorNo,
			ModifiedDate,
			SendReceived
						  )
			VALUES
			(
		@ClientId,
			@ClientNo,
			@VisitorNo,
			@ModifiedDate,
			@SendReceived
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN