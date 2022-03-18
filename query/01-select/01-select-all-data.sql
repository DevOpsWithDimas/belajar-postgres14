-- ini query untuk menampilkan semua data
SELECT *
FROM departments;

/*
 ini query untuk
 menampilkan semua data
 untuk kolom department_id dan department_name
 */
SELECT department_id, -- nama kolomnya adalah department_id
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

SELECT DISTINCT job_id
FROM employees;

SELECT DISTINCT (department_id, job_id), department_id, job_id
FROM employees;

SELECT DISTINCT on (department_id, job_id) department_id, job_id
FROM employees;
