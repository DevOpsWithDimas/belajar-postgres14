--- truncate statement
select *
from job_history;

TRUNCATE table job_history;

select *
from departments;

TRUNCATE table departments restart identity cascade;
select nextval('departments_department_id_seq');

select * from employees;

select *
from regions;
