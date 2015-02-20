USE netinmlf_netint
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE f_Admin_Update_Fields
			@FieldsId int,
@FieldName varchar(50),
@ClientId int
	
AS
UPDATE Fields 
           SET 
		FieldName=@FieldName,
		ClientId =@ClientId
		   WHERE FieldsId =@FieldsId
    
SET NOCOUNT ON 
	RETURN