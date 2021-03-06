/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[CostYTD]
      ,[CostLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Sales].[SalesTerritory]

----view(Us-view)------
---example1--
Create View MyCustomUSView 
As
select *from [AdventureWorks2017].[Sales].[SalesTerritory]
where CountryRegionCode like 'US'

select * from MyCustomUSView

---example2 joining two tables into a view---
SELECT TOP (1000) [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Sales].[SalesPerson]


  Create View NASalesQuota
  AS
  Select [Name], [Group],[SalesQuota],[Bonus] 
  From [AdventureWorks2017].[Sales].[SalesTerritory] A inner join [Sales].[SalesPerson] B
  ON A.[TerritoryID] = B.TerritoryID
  Where [Group] like'North America'

  Select* From NASalesQuota

  -----Example3 on views------
  SELECT TOP (1000) [ShipMethodID]
      ,[Name]
      ,[ShipBase]
      ,[ShipRate]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Purchasing].[ShipMethod]

  Create View MyShipmentInfo
  As
  Select A.[Name],A.[ShipBase], B.[ShipMethodID],B.[OrderDate] 
  from [Purchasing].[ShipMethod] A left join [Purchasing].[PurchaseOrderHeader] B 
  ON A.ShipMethodID=B.ShipMethodID

  select * from MyShipmentInfo
---------------------------------------------
Select *From HumanResources.Department
Select*From HumanResources.Employee
Select *From HumanResources.EmployeeDepartmentHistory

create Procedure NumberOfEmployee
 @Param_Group varchar(50)
As
set nocount off
Select  DepartmentID, [Name] From HumanResources.Department
Where GroupName =@Param_Group

exec NumberOfEmployee @Param_Group = 'Manufacturing'
