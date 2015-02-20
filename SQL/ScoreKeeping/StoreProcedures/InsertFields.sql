USE netinmlf_netint
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE f_Admin_Insert_Fields


@FieldName varchar(50),
@ClientId int
			AS
			INSERT INTO Fields  
			(
			
			ClientId,
			FieldName
						  )
			VALUES
			(
	@ClientId,
	@FieldName
			 )
	SELECT CAST(SCOPE_IDENTITY() AS int);
    
SET NOCOUNT ON 
	RETURN