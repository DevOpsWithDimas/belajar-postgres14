-- insert with specify columns using custom orders
INSERT INTO employees(email, first_name, last_name, salary, job_id)
values ('DIMAS1', initcap('dimas'), initcap('maryanto'), '15000', upper('it_prog'));

select *
from employees
where email = 'DIMAS1';

-- insert with specify data type with convert from date to timestamp
INSERT INTO job_history(employee_id, start_date, job_id)
VALUES (1, '2016-07-15', 'IT_PROG');

INSERT INTO job_history(employee_id, start_date, job_id)
VALUES (1, '2018-07-15 12:15:00', 'IT_PROG');

SELECT *
FROM job_history
where employee_id = 1;
