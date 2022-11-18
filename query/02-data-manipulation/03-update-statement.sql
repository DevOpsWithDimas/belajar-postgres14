--- update with default value
select employee_id, first_name, last_name, salary
from employees
where department_id = 10;

UPDATE employees
SET salary = DEFAULT
WHERE department_id = 10;

alter table employees
    alter column salary SET default 4400;

