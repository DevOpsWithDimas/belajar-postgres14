-- simple with query for select statement
WITH get_emp_in_dep_hundred AS (
    select *
    from employees
    where department_id = 100
)
select employee_id, first_name, salary, commission_pct
from get_emp_in_dep_hundred
limit 5;

-- query with subquery
select employee_id, first_name, salary, department_id
from employees emp
where emp.department_id in
      (
          select distinct department_id dep_id
          from departments
                   natural join locations
          where country_id in ('US', 'UK')
      )
  and salary >= 10000
order by salary desc
limit 10;

-- implementasi complex query using with query
with higher_salaries as
         (
             select employee_id, first_name, salary, department_id
             from employees
             where salary >= 10000
         ),
     department_in_uk_us as
         (
             select distinct department_id dep_id
             from departments
                      natural join locations
             where country_id in ('US', 'UK')
         )
select *
from higher_salaries
where department_id in (select dep_id from department_in_uk_us)
limit 10;

--- with query using correlate temp tables
with employees_in_specific_department as
         (
             select *
             from employees
             where department_id in (90, 100, 110)
         ),
     top3_salaries_from as
         (
             select employee_id, first_name, salary
             from employees_in_specific_department
             order by salary desc
             limit 3
         ),
     employees_with_highest_commission as (
         select employee_id, first_name, salary, commission_pct
         from employees_in_specific_department
         where commission_pct is not null
         order by commission_pct
     )
select *
from employees_with_highest_commission;

-- sum of numbers from 1 through 100
with recursive data(n) as (
    values (1)
    union all
    select n + 1
    from data
    where n < 100
)
select sum(n)
from data;

-- get manager with employees
select emp.employee_id, emp.first_name, man.employee_id, man.first_name
from employees man
         join employees emp on emp.manager_id = man.employee_id
where man.employee_id = 101;

-- get manager with employees with childern
with recursive managed_by(manager_id, employee_id, first_name) as (
    select man.manager_id, man.employee_id, man.first_name
    from employees man
    where man.employee_id = 101
    union all
    select emp.manager_id, emp.employee_id, emp.first_name
    from employees emp
             join managed_by manager on (emp.manager_id = manager.employee_id)
)
select *
from managed_by;
