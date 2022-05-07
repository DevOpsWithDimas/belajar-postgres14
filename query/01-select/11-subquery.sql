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
