--1
select d.Dnum,d.Dname,D.MGRSSN,e.Fname
from departments d
join Employee e
on d.MGRSSN= e.ssn


--2
select d.Dname,p.Pname
from Departments d
join Project p
on d.dnum=p.dnum


--3
select e.Fname, d.*
from dependent d
join employee e
on d.essn=e.ssn

--4
select Pnumber,Pname,Plocation
from project
where City in ('Cairo ','Alex')

--5
select *
from Project
where Pname like 'a%'

--6
select Fname
from Employee
where Dno = 30 and Salary between 1000 and 2000

--7
select e.Fname
from employee e
join Works_for w
on e.SSN=w.ESSn
join Project p
on p.Pnumber=w.Pno
where e.Dno=10 and Hours>=10 and p.Pname='AL Rabwah'

--8
select e.Fname
from employee s
join employee e
on s.ssn=e.superssn
where concat(s.Fname,' ',s.lname)='Kamel Mohamed'

--9
select e.Fname,p.Pname
from employee e
join departments d
on e.dno=d.dnum
join project p
on d.dnum=d.dnum
order by p.Pname

--10
select p.Pnumber,d.Dname,e.Lname,e.Address,e.Bdate
from employee e
join departments d
on e.dno=d.MGRSSN
join project p
on d.dnum=d.dnum
where p.city='cairo'

--11
select s.* 
from Employee e
join Employee s
on s.ssn=e.Superssn

--12
select *
from employee e
left join dependent d
on e.ssn=d.essn

--13
insert into Employee
values ('omar','nafea',102675,'1996-12-13','ismaillia','male',3000,112233,30)

select * from Employee
--14
insert into Employee(Dno,SSN)
values(30,102660)

--15 
update employee 
set Salary=Salary+.2*Salary
where ssn=102672































































