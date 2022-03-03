create procedure spEmployee_Getall
As
begin
select * from Employees
end
-----------------------------------------------------------
alter procedure spAdd_Employees
@Employee_Name varchar(20),
@City varchar(20),
@phNo varchar(20),
@Gender char,
@Salary varchar(255)
As
Begin
insert into Employees (Employee_Name,City,phNo,Gender,Salary) values (@Employee_Name,@City,@phNo,@Gender,@Salary)
end

-------------------------------------------------------------------------------------------
--create procedure spEmployeesBy_City

Alter procedure spEmployeesBy_City
@City varchar(20),
@Employee_Id int  --primary key identity(1,1) (10)
As
Begin
select Employee_Id,Employee_Name
from Employees
where
City = @City and Employee_Id=@Employee_Id
end
------------------------------------------------------------------

alter procedure spEmployeeUpdate
@Employee_Id int,
@Employee_Name varchar(20),
@City varchar(20),
@phNo varchar(20)
As
begin
update Employees 
set Employee_Name=@Employee_Name,City=@City,phNo=@phNo
where Employee_Id=@Employee_Id
end

----------------------------------------------------------------------------
create procedure spDelete_Emp
@Employee_Id int
As
begin
Delete from Employees where Employee_Id=@Employee_Id
end

---------------------------------------------------------------------------
create procedure spUpdateSalaryAndGender
@Salary varchar(255),
@Gender char,
@Employee_Id int
As
begin 
update Employees
Set Salary=@Salary,Gender=@Gender where Employee_Id=@Employee_Id
end

---------------------------------------------------------------------------------

create procedure spAdd_Details
@Address varchar(255),
@Alt_phNo varchar(255),
@Job_Title varchar(255)
As
Begin
insert into Details (Address,Alt_phNo,Job_Title) values (@Address,@Alt_phNo,@Job_Title)
end
----------------------------------------------------------------------------------------------------------------
create procedure spMinSalary
As
begin
select Employee_Name,Min(salary) from Employees
end
----------------------------------------------------------------------------------------
create procedure spMaxSalary
As
begin
select Employee_Name,Max(salary) from Employees
end

--------------------------------------------------------------------------
--greater than
Alter procedure spGreaterSalary
@Greater_Salary varchar(255),
@Lesser_Salary varchar(255)
As
begin
select Employee_Name,Salary from Employees
 where  Salary >= @Greater_Salary   And Salary <= @Lesser_Salary
 order by Salary
end

---total salary
create procedure spTotalSalary
As
begin
select sum(Convert(float,salary)) from Employees 
end

--avg 
alter procedure spAvgSalary
As
begin
select Round(Avg(Convert(float,salary)),2) from Employees 
end

------------------------------------------------

 Alter procedure ExistsorNot
 @IDs int
 As
 Begin

 if @IDs = (select Employee_Id from Employees where Employee_Id=@IDs)
 begin
 print 'EMPLOYEE ID  EXIST'
 end
 else 
 begin
 print 'EMPLOYEE ID IS NOT EXIST'
 end 
 end

 ------------------------------------------------------------------------------
create procedure spdivide
 @a decimal,
 @b decimal,
@c decimal output
As
begin
begin try


set @c=@a/@b

end try
begin catch

select ERROR_LINE() as ErrorLineNo,
ERROR_NUMBER() as ErrorNo,
ERROR_MESSAGE() as ErrorMessage

end catch
end


