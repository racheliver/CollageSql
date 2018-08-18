
drop view if exists CountDepartment;
create view CountDepartment as
select count(Student.dname) as countStudent ,established, Department.dname
from Department,Student
where Department.dname= Student.dname
group by established, Department.dname;


drop view if exists maxCount;
create view maxCount as
select max(countStudent) as countStudent,established
from CountDepartment
group by established;

select distinct CountDepartment.countStudent,CountDepartment.established,dname
from maxCount, CountDepartment
where maxCount.countStudent= CountDepartment.countStudent
and maxCount.established= CountDepartment.established ;



/******************************************/
