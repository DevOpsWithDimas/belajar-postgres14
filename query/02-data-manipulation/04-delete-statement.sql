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
    select employee_id from job_history jh where jh.job_id = 'ST_CLERK')
