SELECT *
FROM departments
ORDER BY department_id;

SELECT *
FROM departments
ORDER BY department_id DESC;

SELECT *
FROM departments
ORDER BY department_name DESC;

SELECT employee_id,
       first_name,
       salary,
       COALESCE(commission_pct, 0)             commission_digit,
       salary * coalesce(commission_pct, 0) as commission_currency
FROM employees
order by salary * COALESCE(commission_pct, 0);


SELECT employee_id,
       first_name,
       salary,
       COALESCE(commission_pct, 0)             commission_digit,
       salary * coalesce(commission_pct, 0) as commission_currency
FROM employees
order by commission_digit desc;
