use Practice

select * from hired_candidates 

create NonClustered Index IX_hired_candidates_Id
on hired_candidates (first_name ASC)

select first_name from hired_candidates 

