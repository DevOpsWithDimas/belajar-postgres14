-- combine query using union with remove duplicate rows
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
UNION
distinct
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (4, 'abdul', 'Abdul Array', false)) as data2;

-- combine query using union with duplicate rows
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
UNION ALL
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (4, 'abdul', 'Abdul Array', false)) as data2;

-- combine query using intersect with remove duplicate rows
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
INTERSECT
DISTINCT
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (4, 'abdul', 'Abdul array', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data2;

-- combine query using intersect with duplicate rows
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
INTERSECT ALL
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (4, 'abdul', 'Abdul array', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data2;

-- combine query using except with removed duplicate rows
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
EXCEPT
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data2;

-- combine query using except with duplicate rows
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
EXCEPT ALL
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data2;

-- combination all of them
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
union all
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data2
except all
select *
from (values (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data3;

-- combination all of them using union and intercept

select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
union all
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data2
intersect
select *
from (values (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data3
except
select *
from (values (2, 'myusuf', 'Muhamad Yusuf', false)) as data4;

-- combination all of them using real sql select
select employee_id, first_name, salary, commission_pct, department_id
from employees
where department_id = 90
union
select employee_id, first_name, salary, commission_pct, department_id
from employees
where department_id in (10, 80)
except
select employee_id, first_name, salary, commission_pct, department_id
from employees
where salary < 8800;
