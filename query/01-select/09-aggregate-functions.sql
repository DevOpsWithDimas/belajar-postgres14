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
