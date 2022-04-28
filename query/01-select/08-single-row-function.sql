SELECT employee_id,
       concat(first_name, ' ', last_name) as fullname,
       to_char(salary, '$L999,999,999')   as salary,
       coalesce(commission_pct, 0)        as commision
from employees
limit 10;

SELECT employee_id,
       concat(first_name, ' ', last_name) as fullname,
       to_char(salary, '$L999,999,999')   as salary,
       coalesce(commission_pct, 0)        as commision
from employees
where coalesce(commission_pct, 0) > 0
limit 10;
