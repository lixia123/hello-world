USE [NuggetDemoDB]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.Employees'))
	DROP TABLE dbo.Employees
GO

--Create Employees table with NULL / NOT NULL constraints

CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL IDENTITY(1,1),
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](75) NOT NULL,
	[Title] [nvarchar](100) NULL DEFAULT ('New Hire'),
	[HireDate] [datetime] NOT NULL  CONSTRAINT DF_HireDate DEFAULT (GETDATE())  , CHECK(DATEDIFF(d,GETDATE(),HireDate) <=0),
	[VacationHours] [smallint] NOT NULL DEFAULT (0),
	[Salary] [decimal](19, 4) NOT NULL,
	[EmailAddress] [nvarchar](255) NULL
) ON [PRIMARY]


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Products]'))
	DROP TABLE [dbo].[Products]
GO

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [decimal](19, 4) NOT NULL CONSTRAINT DHK_Price CHECK (Price > 0),
	[DiscontinuedFlag] [bit] NOT NULL CONSTRAINT DF_DiscontinuedFlag DEFAULT(0)
) ON [PRIMARY]



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Sales]'))
	DROP TABLE [dbo].[Sales]
GO

CREATE TABLE [dbo].[Sales](
	[SalesID] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[ProductID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[SaleDate] [datetime] NULL CONSTRAINT DF_SaleDate DEFAULT (GETDATE()),
	CONSTRAINT CHK_QuantitySaleDate CHECK (Quantity >0 AND DATEDIFF(d,GETDATE(),SaleDate)<=0)
) ON [PRIMARY]