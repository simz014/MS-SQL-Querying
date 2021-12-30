use AdventureWorks2017
select *From [HumanResources].[Department]

---show all the department names ---

select Name from [HumanResources].[Department]

---show me all the group--
select GroupName from [HumanResources].[Department]

--- show me all the distinct group name
select distinct groupname from [HumanResources].[Department]
--show me all the dept names who are part of manufacturing

select Name, GroupName from [HumanResources].[Department]
where GroupName like 'Manufacturing'

---Give me all the Employee from the Employee table
 select * from [HumanResources].[Employee]

 --Give a list of all employee who have org level =2
 select * from [HumanResources].[Employee]
 where OrganizationLevel =2;
  
  --Give a list of employee who have orglevel 2 or 3;
 select * from [HumanResources].[Employee]
where OrganizationLevel  In (2, 3)

--Give me a list of employee who have a title facility title
 select * from [HumanResources].[Employee]
 where JobTitle like 'FACILITIES MANAGER';


 --give me  all the employee who have manager in their title
  select * from [HumanResources].[Employee]
where JobTitle like '%Manager';

--give me  all the employee who have control in their title
  select * from [HumanResources].[Employee]
where JobTitle like '%Control%';

--Give me all the employee born after Jan 01 1980
  select * from [HumanResources].[Employee]
Where BirthDate > '1/1/1980';


--Give me all the employee born between Jan 01 1970 and Jan 01 980
 select * from [HumanResources].[Employee]
Where BirthDate > '1/1/1970' and BirthDate < '1/1/1980';

select * from [HumanResources].[Employee]
Where BirthDate Between '1/1/1970' and  '1/1/1980';

--calculated columns.n].
select Name, ListPrice from [Production].[Product]

select Name, ListPrice +10 AS Adjusted_List_Price from [Production].[Product]
 
 --INTO
 select Name, ListPrice +10 AS Adjusted_List_Price INTO [Production].[Product_2] 
 from [Production].[Product]

 select * from [Production].[Product_2]

  select Name, ListPrice +10 AS Adjusted_List_Price INTO #tempTable
 from [Production].[Product]

 select * from #tempTable


 --Delete data from table
delete from [Production].[Product_2]
where name like 'Bearing Ball'

select * from [Production].[Product_2]

--Update 

Update [Production].[Product_2]
set name ='Blade_New'
where Name like 'Blade'

select * from [Production].[Product_2]

---Joins------------------

create Table myEmployee (
EmployeeID INT, 
FirstName varchar(20), 
LastName varchar(20)
)

Insert into myEmployee values (1, 'Michael', 'Scott')
Insert into myEmployee values (2, 'Pam', 'Beesly')
Insert into myEmployee values (3, 'Dwight', 'Schrute')

select *from myEmployee

create Table MySalary (EmployeeID Int, Salary Float)
 Insert Into MySalary values(1, 1000)
  Insert Into MySalary values(2, 8000)
   Insert Into MySalary values(3, 5000)

   select *from MySalary

select A.FirstName, A.LastName,  B.Salary from myEmployee As A Inner Join MySalary AS B on A.EmployeeID=B.EmployeeID

Create Table MyPhone(EmployeeID Int , Phone_Number Int)
Insert Into MyPhone values(1, 36896634)
  Insert Into MyPhone values(2, 996778522)
  select *from myEmployee
  select *from MyPhone

  select A.FirstName,A.LastName, B.Phone_Number from myEmployee As A left outer join MyPhone As B on A.EmployeeID=B.EmployeeID;


  -----Right join-----

create Table MyParking (EmployeeID INT, ParkingSpot Varchar(20))

Insert into MyParking values (1, 'A1')
Insert into MyParking values (2, 'A2')
select *from MyParking
  select *from myEmployee

select A.ParkingSpot,B.FirstName, B.LastName from MyParking AS A Right Join myEmployee AS B on B.EmployeeID=A.EmployeeID

--full join

create Table MyCustomer (CustomerID Int, CustomerName varchar(20))
Insert into MyCustomer values (1 , 'John')
Insert into MyCustomer values (2 , 'Hawa')

Create Table MyOrder (OrderNumber Int, OrderName varchar(20), CustomerID Int)
INSERT INTO MyOrder values (1, 'Bluetooth Speaker', 1)
INSERT INTO MyOrder values (2, 'Wireless Headphones', 2)
INSERT INTO MyOrder values (3, 'Alexa device', 4)
INSERT INTO MyOrder values (4, 'Soundbar', 3)
INSERT INTO MyOrder values (5, 'Wireles Mouse', 5)

Select A.CustomerID, A.CustomerName, B.OrderNumber,B.OrderName
From MyCustomer A FULL OUTER JOIN MyOrder B ON A.CustomerID=B.CustomerID

Select * from MyCustomer
Select * from MyOrder

select *from MyCustomer CROSS Join MySalary
------TSQL Date functions-----
select getdate()-2
 select DATEPART(yyyy, GETDATE ());


 ---DateADD----
 select DATEADD(day, 4, GETDATE())
  select DATEADD(month, 4, GETDATE())

  select Top 10 *from [Production].[WorkOrder]

  select workOrderID, ProductID, StartDate, EndDate, DateDiff(day, StartDate, EndDate) AS Different
  from [Production].[WorkOrder]


Select  DateAdd(dd,-(DATEPART(day, GETDATE()-1) ), GetDate())


----TSQL Aggregation----

select*from MySalary

select AVG(salary) from MySalary
select Count(salary) from MySalary
select Sum(Salary) from MySalary
select Min (Salary) from MySalary
select Max (Salary) from MySalary


---String-----
Select * from MyOrder

Print Concat('String 1', 'String 2')
 Select OrderNumber, OrderName , concat (OrderName, '', Rand()) As ConcatNAme
 from MyOrder

 --Left

Select OrderNumber, OrderName, Left (OrderName, 5) from MyOrder
--Right
Select OrderNumber, OrderName, Right (OrderName, 5) from MyOrder
 --SubString
 
Select OrderNumber, OrderName, SubString (OrderName, 2, 5) from MyOrder

--LowerCase
Select OrderNumber, OrderName, Lower  (OrderName) from MyOrder
--Upper
Select OrderNumber, OrderName, Upper  (OrderName) from MyOrder
--Lenght
Select OrderNumber, OrderName, Len(OrderName) from MyOrder

Select OrderNumber, OrderName, Concat( Upper (left (OrderName, 3)),Lower( SUBSTRING(OrderName, 2, Len(OrderName)))) from MyOrder


---Trim
---LTRIM and RTRIM
Select '   MytexT  '
Select Len('   MytexT  ')

select LTRIM('   MytexT  ')

select RTRIM('   MytexT  ')
select LTRIM (RTRIM('   MytexT  '))





