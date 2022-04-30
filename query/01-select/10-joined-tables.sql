--- simple natural join
select *
from employees
         natural join jobs;

--- multiple natural join
select *
from employees
         natural join jobs
         natural join departments
         natural join locations;

--- using specify column in natural join
select emp.employee_id,
       concat(emp.first_name, ' ', emp.last_name) as fullname,
       emp.job_id,
       job.job_title,
       emp.department_id,
       dep.department_name
from employees emp
         natural join jobs job
         natural join departments dep;

--- cross join
select count(*)
from departments;

select count(*)
from jobs;

select 28 * 19 as cartesian_rows;

select dep.department_id, dep.department_name, job.job_id, job.job_title
from departments dep
         cross join jobs job;
