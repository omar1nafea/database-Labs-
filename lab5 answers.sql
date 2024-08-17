

use ITI
--1
select count(*)
from Student
where St_Age is not null

--2
select distinct Ins_Name 
from Instructor

--3
select isnull(St_Id,'not_exist'),isnull(St_Fname+' '+St_Lname,'not_exist') as full_name,
isnull(d.Dept_Id,'not_exist')
from student s
join department d
on s.dept_id=d.dept_id


--4
select i.Ins_Name,d.Dept_Name
from instructor i
left join department d
on i.dept_id=d.dept_id

--5

select s.St_Fname+' '+s.St_Lname as full_name,c.Crs_Name
from student s
join stud_course sc
on s.st_id=sc.st_id and grade is not null
join course c
on c.crs_id=sc.crs_id

--6
select top_name,count(c.Crs_Name)
from Topic t
join Course c
on t.Top_Id=c.Top_Id
group by Top_Name


--7
select max(Salary),MIN(Salary)
from Instructor

--8
select Ins_Name
from instructor
where salary<(select AVG(Salary) from Instructor)

--9
select d.Dept_Name
from department d
join instructor i
on d.dept_id=i.dept_id
where salary=(select MIN(Salary)  from Instructor)

--10

select top(2) salary
from Instructor

--11
select Ins_Name,coalesce(Salary,20000)
from instructor
--12
select AVG(salary)
from Instructor

--13

select s.St_Fname,super.*
from student s
join student super
on super.st_id=s.st_super

--14
select ins_name, salary from
(select i.*,row_number() over(partition by d.dept_id order by salary desc) rownum
from department d
join instructor i
on d.dept_id=i.dept_id
where salary is not null) as tab1
where rownum in (1,2)

--15
Select * 
from(Select *,Row_number() over(Partition by dept_id order by newid() ) as rando
from Student) as tab1
where rando=1



----------------------------------------------->part 2
use AdventureWorks2012
--1
select Sales.SalesOrderHeader.SalesOrderID,sales.SalesOrderHeader.ShipDate
from Sales.SalesOrderHeader
where Sales.SalesOrderHeader.OrderDate between '2002-7-28'and'2014-7-29'

--2
select Product.ProductID,Product.Name
from production.product
where Product.StandardCost<110

--3

select ProductID,Name
from production.product 
where Weight is null

--4
select ProductID,Name
from production.product
where Color in ('silver','black','red')

--5

select ProductID,Name
from production.product
where name like 'b%'

--6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select Description
from Production.ProductDescription
where Description like '%_%'

--7

select orderdate,count(duedate) total_due
from sales.SalesOrderHeader
where orderdate between '7-1-2001' and '7-31-2014'
group by orderdate

--8

select distinct NationalIDNumber,HireDate
from humanresources.employee

--9
select AVG(distinct(ListPrice))
from production.product

--10

select name,'the product name '+Name+' is only '+convert(varchar,ListPrice)
from production.product
where ListPrice between 100 and 120

--11

select rowguid,Name,SalesPersonID,Demographics
into sales.store_Archive
from sales.store

select * from Sales.store_Archive
------
select rowguid,Name,SalesPersonID,Demographics
into sales.store_Archive_1
from sales.store
where 1=2

select * from sales.store_Archive_1

--12
select format(GETDATE(),'dd-mm-yyyy')
union 
select format(GETDATE(),'mm-dd-yyyy')
union 
select format(GETDATE(),'yyyy-mm-dd')
union 
select format(GETDATE(),'dd-mm-yyyy')


















































































































































































































