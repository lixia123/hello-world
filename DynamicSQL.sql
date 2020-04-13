USE [NuggetDemoDB]
GO


--Using EXEC
DECLARE @sql nvarchar(MAX),
		@topCount int
	--	SELECT TOP @TopCount FROM Sales

SET @topCount = 10
SET @sql = 'SELECT TOP ' + CAST(@topCount as nvarchar(8)) + '  * FROM Sales ORDER BY SaleDate DESC'

EXEC (@sql)

--Using sp_ExecuteSQL
SUE master;
GO

DECLARE UserDatabases CURSOR FOR
	SELECT name FROM sys.databases WHERE database_id > 4
OPEN UserDatabases

DECLARE @dbName nvarchar(128)
DECLARE @sql nvarchar(max)

FETCH NEXT FROM UserDatabases INTO @dbName
WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @sql = 'USE' + @dbName + ';' + CHAR(13) + 'DBCC SHRINKDATABASE (' + @dbName + 
		EXEC sp_ExecuteSQL @sql

	FETCH NEXT FROM UserDatabases INTO @dbName
	END

CLOSE UserDatabases
DEALLOCATE UserDatabases
