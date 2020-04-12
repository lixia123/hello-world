USE [NuggetDemoDB]
GO

IF OBJECT_ID ('ProductPriceHistory','U') IS NOT NULL
	DROP TABLE ProductPriceHistory
GO

CREATE TABLE dbo.ProductPriceHistory
(
	PriceHistoryID uniqueidentifier NOT NULL PRIMARY KEY,
	ProductID int NOT NULL,
	PreviousPrice decimal (19,4) NULL,
	NewPrice decimal (19,4) NOT NULL,
	PriceChangeDate  datetime NOT NULL
) ON [PRIMARY]

GO


IF OBJECT_ID ('uProductPriceChange','TR') IS NOT NULL
	DROP TRIGGER uProductPriceChange
GO

CREATE TRIGGER uProductPriceChange ON Products
	FOR UPDATE
AS

	INSERT [dbo].[ProductPriceHistory] ([PriceHistoryID],[ProductID],[PreviousPrice],[NewPrice],[PriceChangeDate])
	SELECT
		NEWID(), p.ProductID, d.price, i.Price, GETDATE()
	FROM
		Products p
			JOIN
		inserted i on p.ProductID = i.ProductID
			JOIN
		deleted d on p.ProductID = d.ProductID