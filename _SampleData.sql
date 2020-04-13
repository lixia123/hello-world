USE [NuggetDemoDB]
GO

--DROP Foreign Key Constraints
ALTER TABLE Sales
	DROP CONSTRAINT FK_EmployeesSales, FK_ProductsSales
GO


--Disable Triggers
EXEC sp_MSForEachTable ' ALTER TABLE ? DISABLE TRIGGER ALL'

--Empty Tables / Re-seed auto-numbers
TRUNCATE TABLE Employees
TRUNCATE TABLE Products
TRUNCATE TABLE Sales

--ADD Foreign Key Constraints
ALTER TABLE Sales
	ADD CONSTRAINT FK_ProductsSales FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
	    CONSTRAINT FK_EmployeesSales FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
GO

--Re-enable triggers

EXEC sp_MSForEachTable 'ALTER TABLE ? ENABLE TRIGGER ALL'

--Create sample employee records
INSERT Employees SELECT 'Luck', NULL, 'Skywalker', 'Sales Person', '10/1/2005', 10, 50000
INSERT Employees SELECT 'Darth', NULL, 'Maul', 'Sales Person', '4/27/2005', 10, 40000
INSERT Employees SELECT 'Han', NULL, 'Solo', 'Sales Person', '6/19/2005', 10, 30000
INSERT Employees SELECT 'Emperor', NULL, 'Palpatine', 'Human Resource', '10/1/2005', 10, 60000
INSERT Employees SELECT 'Count', NULL, 'Dooku', 'CFO', '3/22/2005', 10, 80000
INSERT Employees SELECT 'Obi-Wan', NULL, 'Kenobi', 'CFO', '2/14/2005', 15, 50000
INSERT Employees SELECT 'Yoda', NULL, 'who', 'Sales Manager', '1/14/2002', 15, 50000, NULL

select * into [dbo].[EmployeesCopy]
from [dbo].[Employees]
select * from [dbo].[EmployeesCopy]
select * from [dbo].[Employees]
UPDATE [dbo].[Employees]
SET Title = 'CEO'
where [EmployeeID] =6
UPDATE [dbo].[Employees]
SET ManagerID = 8
where [EmployeeID] IN (1,2,3)
UPDATE [dbo].[Employees]
SET ManagerID = 6
where [EmployeeID] = 5


ALTER TABLE [dbo].[Employees]
	ADD
		ManagerID int null
	
--Create sample product records
INSERT Products SELECT 'Lightsaber', 49.99, 0
INSERT Products SELECT 'Blaster', 79.99, 0
INSERT Products SELECT 'Droid', 99.99, 0
INSERT Products SELECT 'Speeder', 250.00, 0
INSERT Products SELECT 'Spaceship', 300.00, 0

--Create 50,000 random sale records!
DECLARE @counter int
SET @counter = 1

WHILE @counter <= 1000
	BEGIN
		INSERT Sales
			SELECT
			NEWID(),
			(ABS(CHECKSUM(NEWID())) % 5) + 1,
			(ABS(CHECKSUM(NEWID())) % 3) + 1,
			(ABS(CHECKSUM(NEWID())) % 10) + 1,
			DATEADD(DAY,ABS(CHECKSUM(NEWID())%3650), '2002-04-12')

		SET @counter +=1
	END


	select * from Sales