--1
select d.Dependent_name,d.Sex
from employee e
join dependent d
on e.ssn=d.essn
where d.Sex ='f' and e.Sex='f'
union
select d.Dependent_name,d.Sex
from employee e
join dependent d
on e.ssn=d.essn
where d.Sex ='m' and e.Sex='m';

--2
select p.Pname,sum(Hours) total_h_week
from project p
join works_for w
on p.pnumber=w.pno
group by Pname

--3
select d.*
from employee e
join departments d
on e.dno=d.dnum 
where e.ssn=(select min(ssn) from Employee)

--4
select Dname,MIN(Salary) min_salary,MAX(Salary) max_salary,AVG(Salary) avg_salary
from departments d
join Employee e
on d.Dnum=e.Dno
group by Dname

--5
select Fname+' '+Lname
from Employee
where superssn not in (select essn from Dependent)

--6

select d.Dnum,d.Dname,COUNT(e.Fname) emp_num
from Employee e
join Departments d
on e.Dno=d.Dnum
group by dnum,d.Dname
having AVG(Salary) <(select AVG(salary) from Employee)

--7
select e.Fname,p.Pname
from employee e
join departments d
on e.dno=d.dnum
join project p
on d.dnum=p.dnum
order by d.Dnum,e.Fname,e.Lname

--8
select top(2)Salary
from Employee
order by Salary desc

--9
select fname+' '+lname
from employee e
join dependent d
on e.ssn=d.essn
where d.dependent_name in (select fname+' '+lname from Employee)

--10
select SSN,Fname from Employee where exists(select * from Dependent)

--11
insert into Departments values('DEPT IT',101,112233,'11-1-2006')
--12

update Departments set MGRSSN=968574
where Dnum=100

update Departments set MGRSSN=102672
where Dnum=20

update Employee set Superssn=102672
where ssn=102660


--13
update Dependent set ESSN=102672 where ESSN=223344
update Departments set MGRSSN=102672 where MGRSSN=223344
update Works_for set ESSn=102672 where ESSn=223344
update Employee set Superssn=102672 where Superssn=223344
delete from Employee where SSN=223344
--14
update Employee set Salary=Salary*1.3
from employee e
join departments d
on e.dno=d.dnum
join project p
on p.dnum=d.dnum
where p.pname='Al Rabwah'























































































































