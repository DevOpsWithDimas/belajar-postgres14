SELECT *
FROM departments;

SELECT department_id,
       department_name
FROM departments;

SELECT department_id kode_divisi,
       department_name as n$2ama_divisi,
       location_id "$ kode lokasi *",
       manager_id as " tes^&#@$%"
FROM departments;

SELECT E'*',
       E'()asadfsadf',
       E'asldfkjdslkfj\tasd\nfsdf',
       E'[]';

SELECT department_name ||  E'\n' || departments.department_id
from departments;
