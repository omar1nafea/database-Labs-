use ITI

--1

create function date_month(@adate date)
returns varchar(30)
begin  
declare @mon varchar(30)
	set @mon=month(@adate)

return @mon
end

select dbo.date_month('7-10-2000')

--2

create function vbetween (@int1 int, @int2 int)
returns @bvalues table (
                       vdifference int)
					   
as 
begin 
     
     while (abs(@int1-@int2)<>0)
	      begin 
		         if @int1>@int2
				    begin
			             insert into @bvalues values ((@int1))
			             set @int1= @int1-1
                    end
                 else
				     begin
			              insert into @bvalues values ((@int2))
			             set @int2= @int2-1 
                     end
             
          end 
return
end
	
select * from dbo.vbetween(50,20)


--3
create function inc (@id int)
returns table 
as 
return(

select s.St_Fname+' '+s.St_Lname as fullname,d.Dept_Name
from Student s
join Department d
on s.Dept_Id=d.Dept_Id
where s.St_Id=@id 
)

select * from dbo.inc(1)

--4
create function inc2 (@id int)
returns varchar(50)
begin 
     declare @pri varchar(50)
	 declare @fir varchar(50)
	 declare @las varchar(50)
	 select @fir=St_Fname,@las=St_Lname
	 from Student
	 where St_Id=@id

	 if (@fir is null and @las is null)
	    begin 
		     set @pri= 'First name & last name are null'
        end
     else if (@fir is null)
	    begin 
		     set @pri='first name is null'
        end
      else if (@las is null)
	    begin 
		    set @pri='last name is null'
        end
       else 
	    begin 
		  set @pri='First name & last name are not null'
        end
return @pri
end

select dbo.inc2(1)


--5
create function mid(@mid int)
returns table as 
return (
select d.Dept_Name,s.Ins_Name,d.Manager_hiredate
from Department d
join Instructor s
on s.Ins_Id=d.Dept_Manager
where s.Ins_Id=@mid)

select * from mid(5)

--6
create function st(@nam varchar(50))
returns @stnam table(
			 sname varchar(5))
as
begin
		if @nam = 'first name'
			insert into @stnam
			select isnull(st_fname,'not existed') from Student
		else if @nam = 'last name'
			insert into @stnam
			select isnull(st_Lname,'not existed') from Student
		else if @nam = 'full name'
			insert into @stnam 
			select isnull(st_fname,'not existed')+' '+isnull(st_lname,' ') from Student
		return 
end

select * from st('last name')


--7
select st_id,SUBSTRING(st_fname,1,LEN(st_fname)-1) FROM Student;

--8

delete from c
from Stud_Course c 
join Student s 
on c.St_Id=s.St_Id 
join Department d
on s.Dept_Id=d.Dept_Id 
where d.Dept_Name='SD'


























	   





































		










  

















