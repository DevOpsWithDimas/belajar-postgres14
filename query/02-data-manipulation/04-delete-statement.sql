--- delete statement using from_item clause
SELECT *
FROM job_history
WHERE job_id = 'ST_CLERK';

SELECT *
FROM employees
WHERE job_id = 'ST_CLERK';

DELETE
FROM employees emp
    USING job_history old
WHERE old.job_id = 'ST_CLERK'
  and emp.employee_id = old.employee_id;

select employee_id, first_name, last_name, job_id
from employees
where employee_id in (114, 122);

DELETE
FROM employees emp
WHERE employee_id in (
    select employee_id
    from job_history jh
    where jh.job_id = 'ST_CLERK')


--- delete statement using returning clause
SELECT *
FROM countries;

DELETE
FROM countries
WHERE country_id in ('ZM', 'ZW')
RETURNING country_id, country_name;

--- delete statement using with query
select distinct employee_id
from job_history
where start_date >= '1995-01-01';

WITH history_emps_from_1995 as (
    select distinct employee_id
    from job_history
    where start_date >= '1995-01-01'
)
DELETE
FROM employees emp
    USING history_emps_from_1995 h
where emp.employee_id = h.employee_id
RETURNING emp.employee_id, emp.job_id, emp.department_id;
