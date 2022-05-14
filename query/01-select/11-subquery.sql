--- subquery specified in select-column-list

select job.job_id,
       job.job_title,
       (select max(history.start_date)::date from job_history history) as max_start_date,
       (select min(history.start_date)::date from job_history history) as min_start_date
from jobs job;

-- error only one column
-- select job.job_id,
--        job.job_title,
--        (select max(history.start_date)::date, min(history.start_date)::date from job_history history) as max_start_date
-- from jobs job;

-- error only one row return on subquery expression
-- select job.job_id,
--        job.job_title,
--        (select history.start_date::date from job_history history) as max_start_date
-- from jobs job;

--- correlate subquery
select emp.employee_id,
       emp.first_name,
       (select manager.first_name
        from employees manager
        where emp.manager_id = manager.employee_id) as manager_name
from employees emp;

--- alternative subquery using join
-- select emp.employee_id,
--        emp.first_name,
--        man.first_name as manager_name,
--        man.job_id     as manager_job_id
-- from employees emp
--          left join employees man on (emp.manager_id = man.employee_id);

--- subquery inline view
select emp.employee_id,
       emp.first_name,
       emp.salary,
       func.rata2 as avg_salary,
       func.maximum  max_salary,
       func.minimum  min_salary
from employees emp,
     (select round(avg(job.max_salary)) rata2,
             min(job.max_salary)        minimum,
             max(job.max_salary)        maximum
      from jobs job) as func
where salary >= func.rata2;

--- lateral subquery / inline view in from clause
select emp.employee_id,
       emp.first_name,
       emp.department_id     current_department_id,
       emp.job_id            current_job_id,
       history.start_date,
       history.end_date,
       history.job_id        last_job_id,
       history.department_id last_department_id
from employees emp,
     lateral (select start_date::date, end_date::date, job_id, department_id
              from job_history job
              where job.employee_id = emp.employee_id) as history;

--- subquery as predicates in where clause
select emp.employee_id, emp.first_name, emp.salary, emp.job_id
from employees emp
where emp.salary >= (select min(job.max_salary)
                     from jobs job
                     where job.job_id = 'IT_PROG');

select emp.employee_id, emp.first_name, emp.salary, emp.job_id
from employees emp
where emp.salary >= (select avg(job.min_salary)
                     from jobs job
                     where job.job_id = emp.job_id);

--- subquery as predicates for single-row comparison
select emp.employee_id, emp.first_name, emp.salary, emp.job_id
from employees emp
where emp.salary >= (
    select round(avg(job.max_salary), 0)
    from jobs job
);


select emp.employee_id, emp.first_name, emp.salary, emp.job_id
from employees emp
where emp.salary between (
    select round(avg(job.min_salary), 0)
    from jobs job
) and (
    select round(avg(job.max_salary), 0)
    from jobs job
);

select emp.employee_id, emp.first_name, emp.salary, emp.job_id
from employees emp
where (emp.salary, emp.job_id) >= (
    select job.max_salary, job.job_id
    from jobs job
    order by job.job_id
    limit 1
);


--- subquery as predicates with exists operator
select *
from employees emp
where exists(
              select true
              from job_history history
              where history.employee_id = emp.employee_id
          );

--- subquery as predicate with in operator
select *
from employees out
where out.job_id in (
    select distinct inq.job_id
    from employees inq
    where inq.department_id = 80
);

select *
from employees out
where (out.job_id, out.salary) in (
    select distinct inq.job_id                      as job_id,
                    (select max(job.max_salary)
                     from jobs job
                     where job.job_id = inq.job_id) as salary
    from employees inq
);

--- subquery as predicate with any or some
select max(salary) max_salary
from employees
where department_id in (10, 20, 30, 40)
group by job_id
order by max_salary;

select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary = some (select max(salary) max_salary
                          from employees
                          where department_id in (10, 20, 30, 40)
                          group by job_id
                          order by max_salary)
order by salary;

select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary > some (select max(salary) max_salary
                          from employees
                          where department_id in (10, 20, 30, 40)
                          group by job_id
                          order by max_salary)
order by salary;

select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary < some (select max(salary) max_salary
                          from employees
                          where department_id in (10, 20, 30, 40)
                          group by job_id
                          order by max_salary)
order by salary;

--- subquery as predicate with all operator
select max(salary) max_salary
from employees
where department_id in (10, 20, 30, 40)
group by job_id
order by max_salary;

select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary != ALL (
    select max(salary) max_salary
    from employees
    where department_id in (10, 20, 30, 40)
    group by job_id
    order by max_salary
)
order by outq.salary;

-- salary = 3100 and salary = 3200 ....
-- select outq.employee_id, outq.first_name, outq.salary, outq.job_id
-- from employees outq
-- where outq.salary = ALL (
--     select max(salary) max_salary
--     from employees
--     where department_id in (10, 20, 30, 40)
--     group by job_id
--     order by max_salary
-- )
-- order by outq.salary;

select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary > ALL (
    select max(salary) max_salary
    from employees
    where department_id in (10, 20, 30, 40)
    group by job_id
    order by max_salary
)
order by outq.salary;

select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary < ALL (
    select max(salary) max_salary
    from employees
    where department_id in (10, 20, 30, 40)
    group by job_id
    order by max_salary
)
order by outq.salary;
