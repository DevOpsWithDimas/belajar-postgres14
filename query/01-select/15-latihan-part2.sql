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

--  pembahasan soal no 3
select dep.department_id dep_id, dep.department_name dep_name, to_char(sum(salary), '999,999,999') total_gaji
from departments dep
         join employees emp on dep.department_id = emp.department_id
group by dep_id, dep_name
order by total_gaji desc;

-- pembahasan soal no 4
select salary * 12 as     gaji_setahun,
       count(employee_id) kode_karyawan
from employees
where commission_pct is not null
group by gaji_setahun
order by gaji_setahun desc;

-- pembahasan soal no 5
select emp.employee_id                            kode_karyawan,
       concat(emp.first_name, ' ', emp.last_name) nama_lengkap,
       to_char(emp.salary, '999,999,999') as      gaji_karyawan,
       j.job_title                                jabatan,
       emp.email
from employees emp
         join jobs j on emp.job_id = j.job_id
where emp.salary >= (
    select max(k.salary)
    from employees k
    where k.job_id = 'IT_PROG')
  and emp.commission_pct is not null
order by salary desc;
