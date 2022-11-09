INSERT INTO employees(email, first_name, last_name, salary, job_id)
values ('DIMAS', initcap('dimas'), initcap('maryanto'), 15000, upper('it_prog'));

select *
from employees
where email = 'DIMAS';

