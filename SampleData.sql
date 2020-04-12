USE [NuggetDemoDB]
GO

--Create sample employee records
INSERT [dbo].[Employees] ([FirstName],[MiddleName],[LastName],[Title],[HireDate],[VacationHours],[Salary])
	VALUES ('John', NULL,'Shepard','DEFAULT','DEFAULT','DEFAULT','50000');

INSERT Employees ([FirstName],[MiddleName],[LastName],[Salary])
	VALUES ('John',NULL,'Shepard','50000');
INSERT Employees ([FirstName],[MiddleName],[LastName],[Salary])
	VALUES ('Joe',NULL,'Smits','60000');
INSERT Employees ([FirstName],[MiddleName],[LastName],[Salary])
	VALUES ('Linda',NULL,'Wu','55500');
INSERT Employees ([FirstName],[MiddleName],[LastName],[Salary])
	VALUES ('Jenny',NULL,'Spa','30000');


	select * from [dbo].[Employees]

--Create sample product records -- CHECK Options
ALTER TABLE Products NOCHECK CONSTRAINT CHK_Price;
INSERT Products SELECT 'Shiry',-1,0
INSERT Products SELECT 'Shirt',12.99,0
INSERT Products SELECT 'Shorts',14.99,0
INSERT Products SELECT 'Pants',19.99,0
ALTER TABLE Products CHECK CONSTRAINT CHK_Price;
INSERT Products SELECT 'Hat',9.99,0

select * from [dbo].[Products]
select * from [dbo].[Sales]

--Create sample sale records
ALTER TABLE Sales DROP [FK__Sales__EmployeeI__02284B6B];
ALTER TABLE Sales DROP [FK__Sales__ProductID__01342732];
INSERT Sales SELECT NEWID(), 1 , 1, 4, '02/01/2012'
INSERT Sales SELECT NEWID(), 2 , 1, 1, '03/01/2012'
INSERT Sales SELECT NEWID(), 3 , 1, 2, '02/01/2012'
INSERT Sales SELECT NEWID(), 2 , 2, 2, '04/01/2012'
INSERT Sales SELECT NEWID(), 3 , 2, 1, '02/01/2012'
INSERT Sales SELECT NEWID(), 4 , 2, 2, '03/01/2012'
INSERT Sales SELECT NEWID(), 4 , 2, 2, '02/01/2012'

ALTER TABLE dbo.Sales WITH NOCHECK
	ADD CONSTRAINT FK_EmployeeSalesSales FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
	GO

ALTER TABLE dbo.Sales WITH NOCHECK
	ADD CONSTRAINT FK_ProductsSales FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
	GO
