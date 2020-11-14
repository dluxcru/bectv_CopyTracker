CREATE TRIGGER [dbo].[bectv_DispositionDate] ON bectv_Disposition 
AFTER INSERT AS
BEGIN 
	-- create variables for the trigger to process
	DECLARE @CurrentDateTime datetime2 = SYSUTCDATETIME();
	DECLARE @DispositionId INT;
	-- retrieve id of inserted record	
	SELECT @DispositionId = bectv_DispositionID from inserted bectv_Disposition;

	--update with current time of disposition creation
	UPDATE bectv_Disposition SET bectv_UpdatedAt = @CurrentDateTime WHERE bectv_DispositionID = @DispositionId
END
GO