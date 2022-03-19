SELECT 2 + 2  as tambah,
       2 * 3  as kali,
       10 % 2 as mod,
       2 ^ 3  as pangkat;


SELECT first_name,
       salary,
       commission_pct,
       salary * commission_pct as bonus
from employees;


SELECT current_date - 2                      as lusa,
       current_date + 1                      as besok,
       current_timestamp                     as sekarang,
       current_timestamp + interval '2 hour' as "kurang 2 jam";

SELECT employee_id AS id,
       first_name,
       last_name,
       last_name || ', ' || first_name
from employees;

SELECT cast('100' as int)                  as string_to_int,
       '100'::int                          as string_to_int_short,
       cast(100 as character varying(100)) as int_to_string,
       cast('1000'::varchar as int) + 1000 as tambah,
       cast('on' as boolean) as to_boolean;
