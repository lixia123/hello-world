USE [NuggetDemoDB]
GO

ALTER TABLE [dbo].[Employees]
	ADD
		ActiveFlag bit  NULL,
		ModifiedDate datetime  NULL


ALTER TABLE Products
	ALTER COLUMN Price money

EXEC sp_rename 'Sales','SaleOrder'