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

SELECT *
FROM employees
WHERE salary BETWEEN 15000 AND 25000;

SELECT *
FROM employees
WHERE substring(email from 1 for 1) between 'A' and 'J';

SELECT *
FROM job_history
where start_date between '1993-01-01' and '1993-12-31';
