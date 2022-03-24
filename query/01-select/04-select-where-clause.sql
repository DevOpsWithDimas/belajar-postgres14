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

SELECT *
FROM employees
WHERE manager_id IS NOT NULL;

SELECT *
FROM employees
WHERE manager_id = 100
  and department_id = 90;

SELECT *
FROM employees
WHERE manager_id = 100
   OR department_id = 90;

SELECT *
FROM employees
WHERE job_id NOT LIKE '%_MAN';

SELECT *
FROM employees
WHERE manager_id = 100
  AND (department_id = 90 OR SALARY >= 10000)
  AND commission_pct IS NOT NULL;

SELECT *
FROM employees
WHERE first_name SIMILAR TO '%(ph|v)%';

SELECT *
FROM employees
WHERE first_name ~ '^S.*(a|v|ph)';

SELECT *
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'PU_CLERK');

SELECT *
FROM employees
WHERE salary NOT IN (3100, 7700, 4800, 6000);

SELECT *
FROM employees
WHERE job_id = ANY (ARRAY['IT_PROG', 'FI_ACCOUNT', 'PU_CLERK']);

SELECT *
FROM employees
WHERE salary > ANY (ARRAY [3100, 7700, 4800, 6000]);
