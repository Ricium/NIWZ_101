USE [netinmlf_netint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Fixtures]
@FixturesId int,
@FieldsId int,
@ClientId int,
@TeamIdA int,
@TeamIdB int,
@StartTime datetime
	
AS
UPDATE fixtures 
           SET 
		FieldsId=@FieldsId,
		TeamIdA = @TeamIdA,
		TeamIdB =@TeamIdB,
		StartTime =@StartTime,
		ClientId =@ClientId
		   WHERE FixturesId =@FixturesId
    
SET NOCOUNT ON 
	RETURN