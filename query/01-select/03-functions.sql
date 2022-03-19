SELECT concat(first_name, ' ', last_name) as      fullname,
       lower(email)                       as      lower_email,
       reverse(last_name)                 as      last_name_reverse,
       length(concat(first_name, ' ', last_name)) length_from_concat
from employees;
