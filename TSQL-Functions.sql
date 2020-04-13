
--CASE (equality expression)
SELECT
	[FirstName],
	[LastName],
	CASE Gender
			WHEN 'F' THEN 'Female'
			WHEN 'M' THEN ' Male'
			ELSE 'Unknown'
		END as GenderDescription,
	MaritalStatusDescription	 =    CASE [MaritalStatus]
		WHEN 'S' THEN 'Single'
		WHEN 'M' THEN 'Married'
		ELSE 'Unknown'
	END
FROM
	AdventureWorks2016CTP3.[HumanResources].[Employee] e
	JOIN
        AdventureWorks2016CTP3.[Person].[Person] p on e.BusinessEntityID = p.BusinessEntityID

--CASE (searched expression using range)
SELECT
	ProductID,
	Name,
	Price,
	CASE
		WHEN Price < 100  THEN 'Hmmm...afordable!'
		WHEN Price >= 100 and Price < 1000 THEN 'How much??'
		When Price >= 1000 THEN 'Galactic robbery!'
	END as CustomerResponse
FROM
	Products


	--CASE (in ORDER BY)
	SELECT *
	FROM Products
	Order by
		CASE DiscontinuedFlag WHEN 0 THEN ProductID END DESC

	-- CASE (in WHERE)
	SELECT * FROM Products
	where 1=CASE WHEN Price < 100 THEN 1 ELSE 0 END





--COALESCE (x params, ANSI SQL standard)
SELECT
	[EmployeeID],
	[FirstName],
	[MiddleName],
	[FirstName] + '-' + [LastName] as FirstLastName,
	COALESCE([FirstName] + ' ' + [MiddleName]+ ' ' + [LastName], 
		FirstName + ' ' + LastName,
			FirstName,
			LastName,
			'No Name') as FullName
FROM Employees

--ISNULL (2 params, T-SQL specific)
SELECT
	[EmployeeID],
	[FirstName],
	ISNULL([MiddleName],'N/A') as [MiddleName],
	LastName
FROM
	Employees


	--Ranking (employees by salary)
	SELECT
		COALESCE([FirstName]+ ' ' + [MiddleName]+' ' + [LastName],	FirstName + ' ' + LastName,
			FirstName,
			LastName ) as FullName,
		Title,
		Salary,
		DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank,
		ROW_Number() OVER (ORDER BY Salary DESC) AS SalaryRank
	FROM
		[dbo].[Employees]
	

	--Ranking (top sales by employee, products)
	SELECT
		s.EmployeeID,
		p.ProductID,
		SUM(Quantity * Price) AS TotalProductSales,
		RANK() OVER (ParTITION BY s.EmployeeID ORDER BY SUM(Quantity * Price))
	FROM
		Sales s
			JOIN
		Products p on s.ProductID = p.ProductID
	GROUP BY
		s.employeeid, p.ProductID	






