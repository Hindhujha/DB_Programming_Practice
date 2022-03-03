select * from Employees

Insert into Employees (Employee_Name,City,phNo) values ('Annie','Salem','9872001234'),
('Nimmiy','Coimbatore','8889901234'),
('Asha','Coimbatore','8889901990'),
('Ram','Chennai','9889981234'),
('Anna','Salem','9012901234')

Exec dbo.spEmployee_Getall

Exec dbo.spEmployeesBy_City 'Coimbatore' , 3

use Practice

Exec dbo.spAdd_Employees 
@Employee_Name='kavi',
@City='Mysore',
@phNo='9800123456'

Exec dbo. spEmployeeUpdate 13,
@Employee_Name='pooja',
@City='Hyderabad',
@phNo='9888120080'

Exec  spDelete_Emp 12

select Employee_Name, City from Employees where Employee_Id= 10

select * from Employees where City='Salem'
---------------------------------------------------------------------------
select * from Employees
order by  Employee_Name 

Exec dbo.spEmployee_Getall
----------------------------------------------------------------------
select * from Employees
order by  Employee_Name DESC

Exec dbo.spEmployee_Getall
----------------------------------------------------------------------------------
select * from Employees  where City='Chennai'
order by  Employee_Name ASC

Exec dbo.spEmployee_Getall
----------------------------------------------------------------------------------

select City, Count(*) from Employees 
group by City  order by City

Exec dbo.spEmployee_Getall
-----------------------------------------------------------------------

select City,Count(*) from Employees
 --where City='Coimbatore'
group by City 
having count(*) >1
order by City
-----------------------------------------------------------------------------

select City from Employees
order by Employee_Name

---------------------------------------------------------------------------

select Employee_Name,City From Employees
order by Employee_Name DESC

------------------------------------------------------------------------------
select  Employee_Name from Employees 
where City='Coimbatore'
order by Len(Employee_Name) DESC

-----------------------------------------------------------------------------
Alter table Employees Add
Salary  varchar(255) ,
Gender char
-----------------------------------------------------------------------
update Employees set Salary='20000',Gender='F' where Employee_Id=1

Exec dbo.spEmployee_Getall
-----------------------------------------------------------------------------------

Exec dbo.spUpdateSalaryAndGender '32000','F',13

----------------------------------------------------------------------------------------------

Exec  spDelete_Emp 14

------------------------------------------------------------------------------------
---offset
select * From Employees
order by Salary DESC
Offset 5 rows
-------------------------------------------------------------------------------
--fetch
select * From Employees
order by Salary DESC
Offset 2 rows
fetch first 5 rows only
-------------------------------------------------------------------------------
select Employee_Name,Salary from Employees
order by Salary DESC
offset 4 rows
Fetch next 4 rows only
---------------------------------------------------------------------------------
select Top 10 Employee_Name,Salary 
from  Employees --where City='Salem'
order by Salary Desc
------------------------------------------------------------------

select Top 1 Percent Employee_Name,Salary from Employees
order by Salary desc

--------------------------------------------------------------------------------

select Top 2 with ties Employee_Name,Salary from Employees
order by Salary DESC
-------------------------------------------------------------------------------

select distinct Employee_Name from Employees

---------------------------------------------------------------------------------------

select * from Employees 

where Employee_Id > 3 AND Gender='F'

order by Salary DESC

---------------------------------------------------------------------------------

select * from Employees 

where Employee_Id > 3 OR Gender='F'

order by Salary DESC

-----------------------------------------------------------------------------------

select * from Employees 

where Salary between 10000 and  30000

order by Salary DESC
----------------------------------------------------------------------------------------

select * from Employees

where salary in (28000,29000,32000)

order by Salary DESC

-------------------------------------------------------------------------------------

select Employee_Name,City from Employees

where Employee_Name Like '%A'
-----------------------------------------------------------
select Employee_Name,City from Employees

where City Like 'C%'
-----------------------------------------------------------
select Employee_Name,City from Employees

where City Like 'H%d'

---------------------------------------------------------------------
select Employee_Name,City from Employees

where City Like '_o%'
----------------------------------------------------------------
select Employee_Name,City from Employees

where City Like '[CH]%'
----------------------------------------------------------------
select Employee_Name,City from Employees

where Employee_Name Like '[A-P]%'
order by Employee_Name

-----------------------------------------------------------------------
select Employee_Name,City from Employees

where Employee_Name Like '[^A-K]%'
order by Employee_Name
------------------------------------------------------------------------------
select Employee_Name,City from Employees

where Employee_Name Not Like 'A%'
order by Employee_Name

--------------------------------------------------------------------

select Employee_Name from Employees

where Employee_Name like '%%Ni%' escape '!'
---------------------------------------------------------------------------------------------

Insert into Employees (Employee_Name,City,Salary,Gender) values ('Ronu','Hyderabad','29000','M')

Exec dbo.spEmployee_Getall

Exec dbo.spAdd_Employees 
@Employee_Name='Kris',
@City='Mysore',
@Salary='29000',
@Gender='M',
@phNo=null

----------------------------------------------------------------------------------

select Employee_Name,City,phNo from Employees
where phNo is Null

----------------------------------------------------------------------------------------------

select * from Employees
where phNo is not null

-----------------------------------------------------------------------------------------

select Employee_Name ,Salary from Employees
 where salary not between 25000 and 30000
 order by Salary DESC
 --------------------------------------------------------------------------------------------------
 ---alias

 select Gender As G from Employees 

 select Employee_Name as Name,City  from Employees
 order by Name

 ---------------------------------------------------------------------

 Exec dbo.spEmployee_Getall

 create table Details(
 Employee_Id int primary key identity(1,1),
 Address varchar(255),
 Alt_phNo varchar(255),
 Job_Title varchar(180))

 select * from Details

Exec dbo.spAdd_Details
@Address='MJ roads',
@Alt_phNo='9012889012',
@Job_Title='Testing'

Exec dbo.spEmployee_Getall

Select Employees.Employee_Name,Employees.City,Details.Address,Details.Job_Title,Employees.Salary
from Employees Inner Join Details on Employees.Employee_Id=Details.Employee_Id
 order by Salary DESC
------------------------------------------------------------------------------------------
--left join

Select Employees.Employee_Name,Employees.City,Details.Address,Details.Job_Title,Employees.Salary
from Employees Left Join Details on Employees.Employee_Id=Details.Employee_Id
 order by Salary DESC

 ------------------------------------------------------------------------------------------
 --right join
 Select Employees.Employee_Name,Employees.City,Details.Address,Details.Job_Title,Employees.Salary
from Employees Right Join Details on Employees.Employee_Id=Details.Employee_Id
 order by Salary DESC

 ------------------------------------------------------------------------------------------
 --full join
 Select Employees.Employee_Name,Employees.City,Details.Address,Details.Job_Title,Employees.Salary
from Employees Full Join Details on Employees.Employee_Id=Details.Employee_Id
 order by Salary DESC

 --------------------------------------------------------------------------------------------------------------
 --min salary
 
 EXEC spMinSalary

 --max salary

 EXEC spMaxSalary

 --within  range

 EXEC spGreaterSalary 10000,30000

 --total salary
 EXEC spTotalSalary

 --avg salary
 EXEC spAvgSalary

 -------------------------------------------------------------------------------------------------

 Exec dbo.spEmployee_Getall

 EXEC ExistsorNot 12

 -------------------------------------------------------------------------
 select * from Employees
 select * from Details
 --cursors
 Declare @EmployeeId  int,@Employee_Name varchar(50),@JobTitle varchar(50);
 Declare CursorRole cursor for Select Employee_Id,Employee_Name from Employees
 open CursorRole;
 Fetch Next from CursorRole into @EmployeeId,@Employee_Name
 while @@FETCH_STATUS=0
  Begin  
     select @JobTitle=Job_Title From Details where Employee_Id=@EmployeeId;
	 print @Employee_Name + ' is a ' + @JobTitle
	 Fetch Next From CursorRole into @EmployeeId,@Employee_Name
  End
  close CursorRole
Deallocate CursorRole

---------------------------------------------------------------------------------
 
 --try catch
 DECLARE @c decimal;
 exec spdivide 10,0 ,@c output
 print @c

 ---------------------------------------------------------------

 