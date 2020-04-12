USE [NuggetDemoDB]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.Employees'))
	DROP TABLE dbo.Employees
GO

--Create Employees table with NULL / NOT NULL constraints

CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](75) NOT NULL,
	[Title] [nvarchar](100) NULL DEFAULT ('New Hire'),
	[HireDate] [datetime] NOT NULL  CONSTRAINT DF_HireDate DEFAULT (GETDATE())  , CHECK(DATEDIFF(d,GETDATE(),HireDate) <=0),
	[VacationHours] [smallint] NOT NULL DEFAULT (0),
	[Salary] [decimal](19, 4) NOT NULL
	
) ON [PRIMARY]


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Products]'))
	DROP TABLE [dbo].[Products]
GO

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [decimal](19, 4) NOT NULL CONSTRAINT DHK_Price CHECK (Price > 0),
	[DiscontinuedFlag] [bit] NOT NULL CONSTRAINT DF_DiscontinuedFlag DEFAULT(0)
) ON [PRIMARY]



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Sales]'))
	DROP TABLE [dbo].[Sales]
GO

CREATE TABLE [dbo].[Sales](
	[SaleID] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[ProductID] [int] NOT NULL REFERENCES Products (ProductID),
	[EmployeeID] [int] NOT NULL REFERENCES Employees (EmployeeID),
	[Quantity] [smallint] NOT NULL,
	[SaleDate] [datetime] NULL CONSTRAINT DF_SaleDate DEFAULT (GETDATE()),
	CONSTRAINT CHK_QuantitySaleDate CHECK (Quantity >0 AND DATEDIFF(d,GETDATE(),SaleDate)<=0),
	--CONSTRAINT FK_ProductsSales FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
	--CONSTRAINT FK_EmployeeSalesSales FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
) ON [PRIMARY]


ALTER TABLE dbo.Sales WITH NOCHECK
	ADD CONSTRAINT FK_EmployeesSales FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
	GO

--ALTER TABLE dbo.Sales
--	DROP CONSTRAINT FK_EmployeesSales

--ALTER TABLE dbo.Sales
--	DROP CONSTRAINT FK_ProductsSales