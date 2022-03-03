
use Practice

create table Employee(
Id int primary key identity(1000,1),
age int,
name varchar(50))

create table Employee_Log(
Id int,
Action varchar(10),
aTime dateTime)

create trigger Employee_Trigger_Insert on Employee
After insert
As
Begin
    Insert into Employee_Log select Id ,'Inserted',GetDate() from Inserted
End


Insert into Employee values(20,'Anu')

-----------------------------------------------------------------------------------------

create trigger Employee_Trigger_Update on Employee
After Update
As
Begin
    Insert into Employee_Log select Id ,'Updated',GetDate() from Inserted
End

update Employee set age=21 where Id=1003

----------------------------------------------------------------------------------------------

create trigger Employee_Trigger_Delete on Employee
After Delete
As
Begin
    Insert into Employee_Log select Id ,'Deleted',GetDate() from Deleted
End

Delete Employee  where Id=1006

----------------------------------------------------------------------------------------------

Disable Trigger  Employee_Trigger_Insert on Employee

Enable Trigger Employee_Trigger_Insert on Employee

select * From Employee

select * From Employee_Log

-----------------------------------------------------------------------------------------------



