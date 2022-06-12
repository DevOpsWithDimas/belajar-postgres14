-- simple conditional expression
select employee_id,
       salary,
       commission_pct,
       case
           when
               commission_pct is null
               then 'Tidak memiliki komisi!'
           end as keternangan
from employees;

-- using condition expression with case-when-else
select employee_id    as kode_karyawan,
       first_name     as nama_karyawan,
       salary         as gaji_sebulan,
       commission_pct as komisi,
       case
           when commission_pct is null then 'Tidak memiliki komisi!'
           when commission_pct = 0.2 then 'Komisinya sama dengan 20%'
           when commission_pct >= 0.2 then 'Komisinya lebih besar dari 20%'
           else 'Komisi lebih kecil dari 20%'
           end        as keterangan
from employees;


-- using condition expression with nested case-when
select employee_id    as kode_karyawan,
       first_name     as nama_karyawan,
       salary         as gaji_sebulan,
       commission_pct as komisi,
       case
           when commission_pct is not null
               then
               case
                   when commission_pct <= 0.1 then 'Memiliki komisi lebih kecil dari 10%'
                   when commission_pct <= 0.2 then 'Memiliki komisi lebih lecil dari 20%'
                   else 'Memiliki komisi lebih besar dari 30%'
                   end
           else 'Tidak memiliki komisi!'
           end        as keterangan
from employees;
