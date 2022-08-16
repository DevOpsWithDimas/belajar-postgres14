-- simple with query for select statement
WITH get_emp_in_dep_hundred AS (
    select *
    from employees
    where department_id = 100
)
select employee_id, first_name, salary, commission_pct
from get_emp_in_dep_hundred
limit 5;
