--- update with default value
select employee_id, first_name, last_name, salary, job_id, commission_pct
from employees
where department_id = 10;

UPDATE employees
SET salary = DEFAULT
WHERE department_id = 10;

alter table employees
    alter column salary SET default 4400;

--- update with sub-select clause
select min_salary, max_salary, job_id
from jobs
where job_id in (select job_id
                 from employees
                 where department_id = 10);

UPDATE employees emp
SET salary = (select min_salary from jobs job where emp.job_id = job.job_id)
WHERE department_id = 10;

UPDATE employees emp
SET salary = salary + 1000
WHERE department_id = 10;

--- update with column-list syntax
UPDATE employees emp
SET (salary, commission_pct) = (
    select max_salary, 0.2 as commission_pct
    from jobs job
    where emp.job_id = job.job_id)
WHERE department_id = 10;

-- eq
UPDATE employees emp
SET salary         = (
    select max_salary
    from jobs job
    where emp.job_id = job.job_id),
    commission_pct = 0.2
WHERE department_id = 10;
