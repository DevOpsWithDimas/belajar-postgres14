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

select  (true and true) "AND -> true x true",
        (true and false) "AND -> true x false",
        (false and false) "AND -> false x false",
        (null and false) "AND -> null x false",
        (null and true) "AND -> null x true",
        (true or true) "OR -> true x true",
        (true or false) "OR -> true x false",
        (false or false) "OR -> false x false",
        (null or true) "OR -> null x true",
        (null or false) "OR -> null x false",
        NOT(false) "NOT -> false",
        NOT(null) "NOT -> null",
        NOT(true) "NOT -> true";

SELECT 3 > 4 and 3 > 3 as less_then,
       3 > 3 as less_then_same,
       1 >= 3 and (0 < 1 or 1 = 1) as less_then_eq_same,
       3 <> 3 as not_eq,
       '19-MAR-2022'::DATE <> '19-MAR-2021'::DATE as date_not_eq,
       'off'::boolean is not false as compare_boolean,
       null is not null as nilai_null,
       'data' is not null as nilai_not_null;
