SELECT concat(first_name, ' ', last_name) as      fullname,
       lower(email)                       as      lower_email,
       reverse(last_name)                 as      last_name_reverse,
       length(concat(first_name, ' ', last_name)) length_from_concat
from employees;

SELECT 3 * 3 as multiply,
       div(10, 3) as division,
       mod(10, 3) as modulus,
       round(5.4475, 2) rounding_up,
       floor(6.9) floor;
