USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Visitors]
@VisitorsID int,
@ClientId int ,
@ClientNo varchar(15) ,
@VisitorNo varchar(15) ,
@ModifiedDate datetime ,
@SendReceived bit 
	
AS
UPDATE Visitors 
           SET 
		ClientId=@ClientId,
		ClientNo = @ClientNo,
		VisitorNo =@VisitorNo,
		ModifiedDate =@ModifiedDate,
	SendReceived = @SendReceived
		   WHERE VisitorsID =@VisitorsID
    
SET NOCOUNT ON 
	RETURN