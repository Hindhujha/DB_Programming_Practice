--primary key & foreign key

use Practice

select * from hired_candidates

--inserting datas
Exec spInsertDatas
@id=6 ,
@first_name='Preethi' ,
@middle_name='Kumari' ,
@last_name='Velan' ,
@email='preethika@gmail.com' ,
@mobile_num=8882345901 ,
@hired_city='Bangalore' ,
@hired_date='01-05-2021' ,
@degree='BE-EEE' ,
@percen=76  ,
@current_pincode=623901 ,
@permanent_pincode=639908 ,
@hired_lab='Star Labs' ,
@attitude_remark='Good' ,
@communication_remark='Good' ,
@knowledge_remark='Good' ,
@status='Good'


create table candidate_details(
salaryPkg money,
job_Title varchar(20),
alternate_phNo varchar(10),
id int foreign key references hired_candidates(id))

create table candidate_Marks(
Percentage_10th int,
Percantage_12th int ,
education_gap varchar(10),
id int foreign key references hired_candidates(id))

select * from hired_candidates
select * from candidate_details

Exec sp_Insert_candidate_details
@id=5,
@salaryPkg=300000,
@job_Title='Support Engineer',
@alternate_phNo='9081245009' 


Exec sp_Insert_candidate_Marks
@Percentage_10th =97,
@Percantage_12th=71,
@education_gap='No',
@id=5

select * from hired_candidates
select * from candidate_details
select * from candidate_Marks
--------------------------------------------------------------------------
----joins using 'ON' Keyword

--stored procedures
--inner join 

create procedure sp_InnerJoin_Candidates3
As
Begin
Select * from hired_candidates h Inner join candidate_details d ON h.id=d.id
inner join candidate_Marks m ON m.id=h.id
End

EXEC sp_InnerJoin_Candidates3

-------------------------------------------------------------------------------------

--left join 

create procedure sp_leftJoin_Candidates3
As
Begin
Select * from hired_candidates h left join candidate_details d ON h.id=d.id
left join candidate_Marks m ON m.id=h.id
End

Exec sp_leftJoin_Candidates3

--right join

create procedure sp_rightJoin_Candidates3
As
Begin
Select * from hired_candidates h right join candidate_details d ON h.id=d.id
right join candidate_Marks m ON m.id=h.id
End

EXEC sp_rightJoin_Candidates3

--outer join

create procedure sp_outerJoin_Candidates3
As
Begin
Select * from hired_candidates h full outer join candidate_details d ON h.id=d.id
full outer join candidate_Marks m ON m.id=h.id
End

EXEC sp_outerJoin_Candidates3

--cross join
create procedure sp_crossJoin_Candidates3
As
Begin
Select * from hired_candidates cross join candidate_details 
cross join candidate_Marks 
End

EXEC sp_crossJoin_Candidates3

----joins using 'where' keyword
--Equi join

alter procedure sp_EquiJoin_Candidates3
As
Begin
Select * from hired_candidates h,candidate_details d
where h.id=d.id 
End

EXEC sp_EquiJoin_Candidates3

--non-equi join

create procedure sp_NonEquiJoin_Candidates3
As
Begin
Select first_name,degree,percen,salaryPkg,job_Title from hired_candidates h,candidate_details d
where h.id<d.id 
End

EXEC sp_NonEquiJoin_Candidates3

-----------------------------------------------------------------------------------------

--self join

alter procedure sp_selfJoin_candidate_details 
As
begin
select d2.id,d2.job_Title,d2.salaryPkg from candidate_details d1,candidate_details d2 where d1.salaryPkg=d2.salaryPkg 
And d1.salaryPkg=400000
End

EXEC sp_selfJoin_candidate_details 

