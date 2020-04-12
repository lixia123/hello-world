

IF OBJECT_ID ('HumanResources.dEmployee','TR' ) IS NOT NULL
	DROP TRIGGER [HumanResources].[dEmployee]
GO

CREATE TRIGGER HumanREsources.dEmployee ON [HumanResources].[Employee]
	INSTEAD OF DELETE NOT FOR REPLICATION AS
BEGIN
	DECLARE @Count int;

	SET @Count = @@ROWCOUNT;
	IF @Count = 0
		RETURN;

	SET NOCOUNT ON;

	BEGIN
		RAISERROR
			(N'Employees cannot be deleted. They can only be maked as not current.',
			10, -- Severity.
			1);  -- State.

		--Rollback any active or uncommittable transactions
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
	END;
END;
