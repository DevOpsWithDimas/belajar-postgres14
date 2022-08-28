-- pembahasan soal no 1
select emp.employee_id                                                           "Kode Karyawan",
       dep.department_name                                                       "Nama Department",
       concat(emp.first_name, ' ', emp.last_name)                                "Nama Lengkap",
       to_char(salary, '999,999')                                                "Gaji Sebulan",
       case
           when commission_pct is null then 'Tidak punya komisi'
           else to_char((salary * coalesce(commission_pct, 0)), '999,999') end   "Mendapatkan komisi",
       to_char((salary + (salary * coalesce(commission_pct, 0))), '999,999,999') gaji_terima
from employees emp
         join departments dep on emp.department_id = dep.department_id
where salary + (salary * coalesce(commission_pct, 0)) >= 12000
order by gaji_terima;

-- pembahasan soal no 2
select emp.employee_id                                           "Kode Karyawan",
       concat(emp.first_name, ' ', emp.last_name)                nama_karyawan,
       dep.department_id                                         "Kode Department",
       dep.department_name                                       "Nama Department",
       emp.job_id                                                "Kode Jabatan",
       job.job_title                                             "Nama Jabatan",
       case
           when emp.manager_id is null then 'Saya gak punya manager!'
           else
               concat(man.first_name, ' ', man.last_name) end as manager_name
from employees emp
         join departments dep on emp.department_id = dep.department_id
         join jobs job on emp.job_id = job.job_id
         left join employees man on emp.manager_id = man.employee_id
order by manager_name, nama_karyawan;
