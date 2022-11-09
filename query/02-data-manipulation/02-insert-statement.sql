INSERT INTO employees(email, first_name, last_name, salary, job_id)
values ('DIMAS1', initcap('dimas'), initcap('maryanto'), '15000', upper('it_prog'));

select *
from employees
where email = 'DIMAS1';

insert into job_history(employee_id, start_date, job_id)
values (2, '2016-07-15', 'IT_PROG');

select *
from job_history
where employee_id = 2;
