--- create prepared statement in sql
PREPARE create_a_employee (varchar(25), varchar(20), varchar(25), varchar(10), int, numeric(8, 2), numeric(2, 2)) as
    INSERT INTO employees(email, first_name, last_name, job_id, department_id, salary, commission_pct, phone_number)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    RETURNING employee_id, first_name, last_name;

execute create_a_employee('PURWADI', 'Muhamad', 'Purwadi', 'AD_VP', 90, 15000, 0.1);
execute create_a_employee('DENI_S', 'Deni', 'Sutisna', 'AD_PRES', 10, 25000, 0.1);

select * from employees
where employee_id in (7, 8);

--- managing object prepared statement
select *
from pg_prepared_statements;

DEALLOCATE create_a_employee;

--- create input placeholder
select employee_id, first_name, last_name, salary, commission_pct, job_id, department_id
from employees
where job_id = ? and department_id = ?;

select employee_id, first_name, last_name, salary, commission_pct, job_id, department_id
from employees
where job_id = :job_id and department_id = :dep_id;
