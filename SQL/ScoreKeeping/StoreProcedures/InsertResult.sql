USE [netinmlf_netint]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[f_Admin_Insert_Results]

@FixtrureId int,
@PointsA varchar(20),
@PointsB varchar(20),
@TimeInMatch varchar(20),
@Comentry varchar(200),
@ClientId int
			AS
			INSERT INTO Results  
			(
			
			FixtureId,
			PointsA,
			PointsB,
			TimeInMatch,
			Comentry,
			ClientId
						  )
			VALUES
			(
	@FixtrureId,
	@PointsA,
	@PointsB,
	@TimeInMatch,
	@Comentry,
	@ClientId
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN