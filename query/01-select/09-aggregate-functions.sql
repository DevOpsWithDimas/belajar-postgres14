select count(*) as row_count
from jobs;

select max(salary) max_salary
from employees;

select max(coalesce(commission_pct, 0)) max_commission_pct
from employees;

select min(coalesce(commission_pct, 0)) max_commission_pct
from employees;

select avg(salary) as average_salary
from employees
where job_id = 'IT_PROG';


--- group by query

-- select distinct job_id
-- from employees;

SELECT job_id,
       count(employee_id) as count_employee_by_job,
       max(salary)        as max_salary_employee_by_job,
       sum(salary)        as sum_salary_employee_by_job
from employees
group by job_id;

select department_id, job_id, count(*) as employee_by_dep_and_job
from employees
group by department_id, job_id
order by job_id;
