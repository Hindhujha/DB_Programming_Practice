--transactions
 select * from Employees 

  select * from Details

 begin transaction
 update Details set Job_Title='Support' where Employee_Id=1

 
 Rollback transaction

 commit transaction
--------------------------------------------------------------------------


select * from Employees select * from Details

alter procedure spUpdateAddress
As
begin
   begin try
      begin transaction
	    update Employees set City='Trichy' where Employee_Id=1
		update Details set Address='MKL Nagar' where Employee_Id=1
     commit transaction
	 print 'Transaction Committed'
   end try
   begin catch
      Rollback Transaction
	  Print 'Transaction Rolled Back'
   end catch
end


EXEC spUpdateAddress


--------------------------------------------------------------------------------

create view vwEmployee
As
select Employee_Name,Salary,Job_Title,City
from Employees  join Details on Employees.Employee_Id=Details.Employee_Id

select * from  vwEmployee
------------------------------------------------------------------------------


create view vwEmployee_Role
As
select Employee_Name,Salary,Job_Title,City
from Employees  join Details on Employees.Employee_Id=Details.Employee_Id
where Details.Job_Title='Testing'

select * from  vwEmployee_Role
----------------------------------------------------


create view vwSecured_Details
As
select Employee_Name,Job_Title,City
from Employees  join Details on Employees.Employee_Id=Details.Employee_Id

select * from  vwSecured_Details

--------------------------------------------------------------------

