USE [NuggetDemoDB]
GO

/*--SELECT Basics --*/
--Basic SELECT all columns from table

SELECT * FROM Employees

--Basic SELECT specific columns from table
SELECT
	[FirstName],
	[LastName],
	[Title]
FROM Employees

--Basic SELECT specific columns from table with a filter (WHERE clause)
SELECT
	[FirstName],
	[LastName],
	[Title]
FROM Employees
WHERE Title LIKE 'Sales%'

/*--JOIN Basics --*/
--SELECT using INNER JOIN
SELECT *
FROM Products p
	JOIN
	Sales s ON p.ProductID = s.ProductID

--SELECT using left OUTER JOIN, products with sales
SELECT
	[Name],
	COUNT(*) as NumberOfSales,
	SUM(Quantity) as SalesQuantityTotal,
	SUM(Price * Quantity) as SalesGrossTotal
FROM
	Products p
	LEFT JOIN
	Sales s ON p.ProductID = s.ProductID
GROUP BY
	Name

--Select using right OUTER JOIN, employees with sales
SELECT
	FirstName + ' ' + LastName + ' - ' + Title as NameAndTitle
FROM
	Sales s
		RIGHT JOIN
	Employees e ON s.EmployeeID = e.EmployeeID
GROUP BY
	[FirstName] + ' ' + [LastName] + ' - '+ Title
Having COUNT(s.SaleID) > 0


/*--Derived Tables */
SELECT
[FirstName] + ' ' + [LastName] as Employee
FROM 
	(SELECT * FROM Employees WHERE Title LIKE 'Sales%') as EmployeeDerived

--Derived Table Query with JOINS
SELECT TOP 10
	[Name],
	[Quantity],
	[FirstName] + ' ' + [LastName] as Employee,
	SaleDate
FROM
	(SELECT * FROM Sales WHERE Quantity = 10) as SalesQuantity10
		JOIN
		Products ON SalesQuantity10.ProductID = Products.ProductID
		JOIN
		Employees ON SalesQuantity10.EmployeeID = Employees.EmployeeID
	WHERE
		Products.ProductID = 5
	Order BY
		SaleDate DESC


		--Derived Table Query Aggregate
		SELECT
			Name,
			COUNT(s.ProductID) as NumberOfSales,
			ISNULL(SUM(Quantity),0) as SalesQuantityTotal,
			ISNULL(SUM(Price * Quantity),0) as SalesGrossTotal
		FROM
			Products p
				LEFT JOIN
			Sales s ON p.ProductID = s.ProductID
		GROUP BY
			Name


		SELECT
			Name,
			NumberOfSales,
			SalesQuantityTotal,
			SalesGrossTotal
		FROM
			Products pout
				JOIN 
			(SELECT
			s.ProductID,
			COUNT(s.ProductID) as NumberOfSales,
			SUM(Quantity) as SalesQuantityTotal,
			SUM(Price * Quantity) as SalesGrossTotal
				FROM
					Sales s
						 JOIN
					Products p ON p.ProductID = s.ProductID
		GROUP BY
			s.ProductID) pin 
			ON pout.ProductID = pin.ProductID

/*--Synonyms--*/



