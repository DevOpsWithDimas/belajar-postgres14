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
