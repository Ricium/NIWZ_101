USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[f_Admin_Insert_Fixtures]


@FieldsId int,
@ClientId int,
@TeamIdA int,
@TeamIdB int,
@StartTime datetime
			AS
			INSERT INTO fixtures  
			(
			
			TeamIdA,
			TeamIdB,
			StartTime,
			FieldsId,
			ClientId
						  )
			VALUES
			(
	@TeamIdA,
	@TeamIdB,
	@StartTime,
	@FieldsId,
	@ClientId
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN