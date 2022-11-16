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

-- insert with default value
INSERT INTO employees(email, first_name, last_name, job_id)
values ('DIMAS2', initcap('dimas'), initcap('maryanto'), upper('it_prog'));

select *
from employees
where email = 'DIMAS2';

INSERT INTO employees(email, first_name, salary, last_name, job_id)
values ('DIMAS3', initcap('dimas'), default, initcap('maryanto'), upper('it_prog'));

select *
from employees
where email = 'DIMAS3';

INSERT INTO employees(email, first_name, salary, last_name, job_id)
values ('DIMAS4', initcap('dimas'), null, initcap('maryanto'), upper('it_prog'));

select *
from employees
where email = 'DIMAS4';

--- insert with multiple rows
INSERT INTO countries(country_id, country_name, region_id)
values ('ID', 'Indonesia', 3),
       ('SI', 'Singapure', 3),
       ('TH', 'Thailand', 3);

SELECT *
FROM countries
where country_id in ('ID', 'SI', 'TH');

--- insert with on conflict action
INSERT INTO countries(country_id, country_name, region_id)
values ('ID', 'Republic Indonesia', 3)
on conflict (country_id) do nothing;

INSERT INTO countries(country_id, country_name, region_id)
values ('ID', 'Republic Indonesia', 3)
on conflict (country_id) do update
    set country_name = excluded.country_name,
        region_id    = excluded.region_id;

--- insert using with query
WITH insert_emp as (
    INSERT INTO employees (email, first_name, last_name, salary, job_id, department_id)
        values ('DIMAS8', initcap('dimas'), initcap('maryanto'), '15000', upper('it_prog'), 10)
        returning employee_id, job_id, department_id)
INSERT
INTO job_history(employee_id, start_date, job_id, department_id)
select employee_id, now(), job_id, department_id
from insert_emp
returning employee_id;

select *
from employees
where email = 'DIMAS8';

select *
from job_history
where employee_id = 8;

