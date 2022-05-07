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

--- inner join
-- select employee_id, first_name, job_id
-- from employees;

-- select *
-- from jobs;

select emp.employee_id, emp.first_name, emp.salary as current_salary, job.job_title, job.max_salary
from employees emp
         inner join jobs job on (emp.job_id = job.job_id);

select emp.employee_id, emp.first_name, emp.salary as current_salary, job.job_title, job.max_salary
from employees emp
         join jobs job on (emp.job_id = job.job_id);

select emp.employee_id,
       emp.first_name,
       emp.salary          as current_salary,
       job.job_title,
       job.max_salary,
       dep.department_name as dep_name
from employees emp
         join jobs job on (emp.job_id = job.job_id)
         join departments dep on (dep.department_id = emp.department_id);

--- left or right outer join

select employee_id, department_id
from employees;

select department_id
from departments;

select emp.employee_id, emp.first_name, dep.department_id, dep.department_name
from employees emp
         left join departments dep on (emp.department_id = dep.department_id);

select emp.employee_id, emp.first_name, dep.department_id, dep.department_name
from employees emp
         right join departments dep on (emp.department_id = dep.department_id);

--- full outer join

select emp.employee_id, emp.first_name, dep.department_id, dep.department_name
from employees emp
         full outer join departments dep on (emp.department_id = dep.department_id);
