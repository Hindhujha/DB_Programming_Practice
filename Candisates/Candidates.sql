
CREATE TABLE hired_candidates (
  id int NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  mobile_num bigint NOT NULL,
  hired_city varchar(50) NOT NULL,
  hired_date datetime NOT NULL,
  degree varchar(100) NOT NULL,
  percen float ,
  current_pincode int DEFAULT NULL,
  permanent_pincode int DEFAULT NULL,
  hired_lab varchar(20) DEFAULT NULL,
  attitude_remark varchar(15) DEFAULT NULL,
  communication_remark varchar(15) DEFAULT NULL,
  knowledge_remark varchar(15) DEFAULT NULL,
  status varchar(20) NOT NULL,
  PRIMARY KEY (id)
) 

select * from hired_candidates

insert into hired_candidates values (1,'Anna','christy','John','anna@gmail.com',9123456789,'Chennai',20-02-2021,'BE-EEE',90,632901,623904,
'CKV LABS','Good','Good','Good','Good')


--inserting datas
Exec spInsertDatas
@id=5 ,
@first_name='Pranav' ,
@middle_name='Krithiv' ,
@last_name='Kumar' ,
@email='pranavkrithiv@gmail.com' ,
@mobile_num=9082345789 ,
@hired_city='Chennai' ,
@hired_date='09-07-2021' ,
@degree='BE-Mech' ,
@percen=83  ,
@current_pincode=623001 ,
@permanent_pincode=639008 ,
@hired_lab='PLMN Labs' ,
@attitude_remark='Good' ,
@communication_remark='Good' ,
@knowledge_remark='Good' ,
@status='Good'


select * from hired_candidates

-----

create table Details_Candidates(
id int primary key not null,
permanent_address varchar(50),
Job_Title varchar(50),
salary_package bigint)

select * from Details_Candidates

Exec sp_Details_Candidates
@id=4,
@permanent_address='Hyderabad',
@Job_Title='Testing',
@salary_package=350000

select * from hired_candidates
select * from Details_Candidates

--------------------------------------------------------------------------------------------------------
create view vw_Job_Role
As
select first_name,degree,percen,salary_package,hired_city from hired_candidates join Details_Candidates
on hired_candidates.id=Details_Candidates.id

select * from vw_Job_Role

-----------------------------------------------------------------------------------------------------
----cursor
 Declare @Id int,
 @first_name varchar(50),
 @permanent_address varchar(50),
 @JobTitle varchar(50),
 @salary_package varchar(50);

 Declare CursorRole cursor for Select Id,first_name from hired_candidates
 open CursorRole;
 Fetch Next from CursorRole into @Id,@first_name
 while @@FETCH_STATUS=0
  Begin  
     select @permanent_address=permanent_address,
	        @JobTitle=Job_Title,
	        @salary_package =salary_package From Details_Candidates where Id=@Id;
	 print @first_name + ' from ' + @permanent_address + '  got   placed,	role is a '+ @JobTitle + '  salary package is : ' + @salary_package
	 Fetch Next From CursorRole into @Id,@first_name
  End
  close CursorRole
Deallocate CursorRole

----------------------------------------------------------------------------------------------------

--transactions
                                     
  --implicit transaction
  select @@TRANCOUNT

  SET IMPLICIT_TRANSACTIONS ON
 
 Go


 select * from hired_candidates where id=2

 select @@TRANCOUNT

 update hired_candidates set degree='BE-Mech' where id=1

 rollback

 commit transaction
 
 select @@TRANCOUNT
 
 ------------------------------------------------------------------------------------

 ---explicit transaction
 

 Begin Transaction
 select * from hired_candidates where id=3

 select @@TRANCOUNT
 commit transaction

 ------------------------------------------------------------------------------

 
