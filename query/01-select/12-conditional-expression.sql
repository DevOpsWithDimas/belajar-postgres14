-- simple conditional expression
select employee_id,
       salary,
       commission_pct,
       case
           when
               commission_pct is null
               then 'Tidak memiliki komisi!'
           end as keternangan
from employees;
