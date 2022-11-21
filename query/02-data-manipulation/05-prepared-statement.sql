--- create prepared statement in sql
PREPARE create_a_employee (varchar(25), varchar(20), varchar(25), varchar(10), int, numeric(8, 2), numeric(2, 2)) as
    INSERT INTO employees(email, first_name, last_name, job_id, department_id, salary, commission_pct)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING employee_id, first_name, last_name;

execute create_a_employee('PURWADI', 'Muhamad', 'Purwadi', 'AD_VP', 90, 15000, 0.1);
execute create_a_employee('DENI_S', 'Deni', 'Sutisna', 'AD_PRES', 10, 25000, 0.1);

select * from employees
where employee_id in (7, 8);
