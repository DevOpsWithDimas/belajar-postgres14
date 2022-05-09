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
