--- soal no 1
INSERT INTO countries(country_id, country_name, region_id)
values ('ID', 'Indonesia', 3);

select *
from countries
where country_id = 'ID';

--- soal no 2
INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id)
values (6230, 'Cinunuk', 40626, 'Kab. Bandung', 'Jawa Barat', 'ID'),
       (6231, 'Ujung Berung', 40521, 'Kab. Bandung', 'Jawa Barat', 'ID'),
       (6233, 'Margahayu Raya', 40525, 'Kota. Bandung', 'Jawa Barat', 'ID'),
       (6234, 'Blok M', 40220, 'Jakarta Selatan', 'DKI Jakarta', 'ID'),
       (6235, 'Slipi', 40221, 'Jakarta Selatan', 'DKI Jakarta', 'ID');

select *
from locations
where location_id in (6230, 6231, 6233, 6234, 6235);

--- soal no 3
UPDATE employees
SET commission_pct = 0.10
WHERE (employee_id <> 104)
  and job_id = 'IT_PROG';

select employee_id, first_name, commission_pct
from employees
where job_id = 'IT_PROG';

--- soal no 4
with jabatan as (
    select 'IT_PROG' as job_id
),
     rentang_gaji as (
         select job_id, min_salary, max_salary, ((min_salary + max_salary) / 2) med_salary
         from jobs
         where job_id = (select job_id from jabatan limit 1)
     ),
     divisi as (
         select department_id, department_name, manager_id
         from departments
         where department_name = 'IT'
     ),
     nama_lengkap as (
         select 'Dimas' as nama_depan, 'Maryanto' as nama_belakang, '08211731234' telp
     )
INSERT
INTO employees (first_name, last_name, email, phone_number, job_id, salary, commission_pct, department_id, manager_id)
SELECT nama_depan,
       nama_belakang,
       upper(nama_depan),
       telp,
       (select j.job_id from jabatan j),
       (select med_salary from rentang_gaji),
       0.9,
       (select d.department_id from divisi d),
       (select d2.manager_id from divisi d2)
from nama_lengkap
returning *;

--- soal no 5
INSERT INTO jobs as j1 (job_id, job_title, min_salary, max_salary)
VALUES (:job_id, :job_title,
        (select j2.max_salary from jobs j2 where j2.job_id = 'IT_PROG'),
        (select (j2.min_salary + 15000) from jobs j2 where j2.job_id = 'IT_PROG'))
on conflict (job_id) do update
    set job_title  = excluded.job_title,
        min_salary = (select j2.max_salary from jobs j2 where j2.job_id = 'IT_PROG'),
        max_salary = (select (j2.min_salary + 15000) from jobs j2 where j2.job_id = 'IT_PROG')
returning *;

select *
from jobs
where job_id = 'IT_PROG';
