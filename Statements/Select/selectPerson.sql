SELECT TOP 10 p.FirstName, p.LastName
FROM [Person].[Person] p
    JOIN [Person].[Address] a ON p.BusinessEntityID = a.AddressID