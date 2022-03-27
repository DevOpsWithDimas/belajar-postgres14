SELECT *
FROM employees
ORDER BY email DESC;

SELECT *
FROM employees
WHERE salary BETWEEN 3200 AND 12000;

SELECT *
FROM employees
WHERE substr(first_name, 1, 1) = 'A';

SELECT *
FROM employees
WHERE first_name LIKE 'A%';

SELECT *
FROM employees
WHERE employee_id IN (103, 115, 196, 187, 102, 100);

SELECT *
FROM employees
WHERE substr(last_name, 2, 1) = 'u';

SELECT *
FROM employees
WHERE last_name LIKE '_u%';

SELECT DISTINCT department_id
FROM employees;

SELECT concat(first_name, ' ', last_name) AS "NAMA LENGKAP",
       job_id                             AS "KODE JABATAN",
       salary * 12                        AS "GAJI SETAHUN"
FROM employees
WHERE manager_id = 100;

SELECT last_name "NAMA BELAKANG",
       salary    "GAJI SEBULAN",
       job_id    "KODE JABATAN"
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'SH_CLERK');

SELECT *
FROM employees
WHERE job_id <> 'IT_PROG'
   AND job_id <> 'SH_CLERK';
