
--enter datas
create procedure spInsertDatas
@id int ,
@first_name varchar(100) ,
@middle_name varchar(100) NULL,
@last_name varchar(100) ,
@email varchar(50) ,
@mobile_num bigint ,
@hired_city varchar(50) ,
@hired_date datetime ,
@degree varchar(100) ,
@percen float ,
@current_pincode int NULL,
@permanent_pincode int  NULL,
@hired_lab varchar(20)  NULL,
@attitude_remark varchar(15) NULL,
@communication_remark varchar(15)  NULL,
@knowledge_remark varchar(15)  NULL,
@status varchar(20)

As
begin
insert into  hired_candidates (
  id ,
  first_name ,
  middle_name ,
  last_name ,
  email ,
  mobile_num ,
  hired_city ,
  hired_date ,
  degree ,
  percen  ,
  current_pincode ,
  permanent_pincode ,
  hired_lab ,
  attitude_remark ,
  communication_remark ,
  knowledge_remark ,
  status)
  
  values (@id ,
@first_name ,
@middle_name ,
@last_name ,
@email ,
@mobile_num ,
@hired_city ,
@hired_date ,
@degree ,
@percen  ,
@current_pincode ,
@permanent_pincode ,
@hired_lab ,
@attitude_remark ,
@communication_remark ,
@knowledge_remark ,
@status
)

End

------------------------------------------------------------------------------------------------

create procedure sp_Details_Candidates
@id int ,
@permanent_address varchar(50),
@Job_Title varchar(50),
@salary_package bigint
As
Begin 
Insert into Details_Candidates
(id,permanent_address,Job_Title,salary_package) values (@id,@permanent_address,@Job_Title,@salary_package)
End
