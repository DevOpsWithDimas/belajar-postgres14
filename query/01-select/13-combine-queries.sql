-- combine query using union with remove duplicate rows
select *
from (values (1, 'dimasm93', 'Dimas Maryanto', true),
             (2, 'myusuf', 'Muhamad Yusuf', false),
             (3, 'mpurwadi', 'Muhamad Purwadi', true)) as data1
UNION distinct
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
