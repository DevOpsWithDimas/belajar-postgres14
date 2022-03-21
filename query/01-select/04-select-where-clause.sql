SELECT *
FROM employees
WHERE employee_id = 101;

SELECT employee_id, first_name, salary
FROM employees
WHERE salary <= 17000;

SELECT *
FROM employees
WHERE first_name like 'S%';

SELECT *
FROM employees
WHERE first_name like '__a%';

SELECT *
FROM employees
WHERE first_name ilike 's%';
