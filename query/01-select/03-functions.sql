SELECT concat(first_name, ' ', last_name) as      fullname,
       lower(email)                       as      lower_email,
       reverse(last_name)                 as      last_name_reverse,
       length(concat(first_name, ' ', last_name)) length_from_concat
from employees;

SELECT 3 * 3      as    multiply,
       div(10, 3) as    division,
       mod(10, 3) as    modulus,
       round(5.4475, 2) rounding_up,
       floor(6.9)       floor;

SELECT employee_id,
       current_timestamp,
       current_date,
       start_date                                            as mulai_kerja,
       extract(year from age(current_timestamp, start_date)) as tahun_kerja
FROM job_history;

select COALESCE(null, 'data1', 'data2') return_data1,
       COALESCE(null, null, 'data2')    return_data2,
       COALESCE(null, null, null)       return_null,
       NULLIF(null, 'data1')            return_null1,
       NULLIF('data1', 'data1')         return_null2,
       NULLIF('data1', 'data2')         return_data1;


select employee_id,
       commission_pct,
       coalesce(commission_pct, 0)          commission_pct_no_null,
       salary,
       salary * coalesce(commission_pct, 0) commission
FROM employees;
