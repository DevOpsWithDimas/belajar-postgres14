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
