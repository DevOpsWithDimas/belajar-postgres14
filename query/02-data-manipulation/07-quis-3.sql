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
