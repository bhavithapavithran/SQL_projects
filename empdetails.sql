use emp;

#Create table 1

create table EmployeeDetails (
empID varchar(20) NOT NULL,
fullName varchar(20),
ManagerID varchar(10),
DateOfJoining date,
City varchar(20),
primary key(empID),
foreign key(empid) references employeesalary(empid)
);
insert into EmployeeDetails
values('121','John Snow','321','2019-01-31','Toronto'),
('321','Walter White','986','2020-01-30','California'),
('421','Kuldeep Rana','876','2020-11-27','NewDelhi')
;

# create Table 2

create table EmployeeSalary (
empID varchar(10),
Project varchar(10),
Salary varchar(10),
Variable varchar(10),
PRIMARY KEY(EMPid)
);
insert into EmployeeSalary
values('121','P1','8000','500'),
('321','P2','10000','1000'),
('421','P1','12000','0')
;

# View table 1 and 2

select * from employeedetails;
select * from employeesalary;

#Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
select empid , Fullname from employeedetails where managerid = '986';

#Ques.2. Write an SQL query to fetch the different projects available fromtheEmployeeSalary table.

select project from employeesalary;

#Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.
 select count(*) from employeesalary where project ='P1';
 
 #Ques.4. Write an SQL query to find the maximum, minimum, and average salaryof the employees
 
 select max(salary) as maxsalary from employeesalary;
 select min(salary) as minsalary from employeesalary;
 select avg(salary) as avgsalary from employeesalary;
 
 #Ques.5. Write an SQL query to find the employee id whose salary lies intherangeof 9000 and 15000.
 
 select empid from employeesalary where salary between  9000 and 15000;
 
 #Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
 
 select * from employeedetails where city ='Toronto' and managerid ='321';


# Ques.7. Write an SQL query to fetch all those employees who work on Projectsother than P1.
select * from employeesalary where project != 'p1';

#Ques.8. Write an SQL query to fetch the EmpIds that are present in both thetables– ‘EmployeeDetails’ and ‘EmployeeSalary.
select empid from employeedetails where empid in (select empid from employeesalary );

#Ques.9. Write an SQL query to fetch employee names having a salary greater thanor equal to 5000 and less than or equal to 10000.
select fullname from employeedetails where empid in (select empid from employeesalary where salary >= 5000 and salary <=10000);

#Ques.10. Write an SQL query to add a new column named Mobile no: totheemployee details table. Fill the column with values.
alter table employeedetails
add column mobilenum int(25);
update  employeedetails set mobilenum =999999 where empid='121';
update  employeedetails set mobilenum =999989 where empid='321';
update employeedetails set mobilenum =54654665 where empid = '421';

update employeedetails set mobilenum=
case
	when empid=121 then 999999
    when empid=321 then 345456
    when empid=421 then 789978
end;
select * from employeedetails;
update employeesalary
set salary = salary +5000;

# Ques.12. Change the column name Full Name to employee name from the employee details.
ALTER TABLE `emp`.`employeedetails` 
CHANGE COLUMN `fullName` `employeeName` VARCHAR(20) NULL DEFAULT NULL ;

#Ques.1. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
alter table employeesalary 
add totalsalary where totalsalary= salary+variable;
SELECT *, (salary + variable) AS totsalary from employeesalary;
#Ques.2. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
select * from employeedetails where employeename like '__hn%';

# Ques.3. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
select empid from employeedetails where empid not in (select empid from employeesalary);

# Ques.4. Fetch all the employees who are not working on any project.
select * from employeesalary where project is null;

#Ques.5. Write an SQL query to fetch all the Employee details from the EmployeeDetailstable who joined in the Year 2020.
select * from employeedetails where year(Dateofjoining) = 2020;

# Ques.6. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order
select project, count(project)   from employeesalary group by(project) ;

# Ques.7. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
SELECT a.fullname,b.salary
from employeedetails as a
left join employeesalary as b
on a.empid=b.empid;

# Ques.2. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select *  from employeedetails where City ='California' or managerid ='321';

#Ques.3. Write an SQL query to fetch common records between two tables.
select employeedetails.* , employeesalary.* from employeedetails inner join employeesalary on employeedetails.empid=employeesalary.empid ;

#Ques.4. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
select empid from EmployeeDetails where empid not in (select empid from employeesalary);
select employeedetails.empid from employeedetails left join employeesalary on employeedetails.empid = employeesalary.empid;
#Ques.5 Write an SQL query to fetch the employee’s full names and replace the space with ‘-’.
 select replace (fullname,' ','_') as newname from employeedetails; 
 
# Ques.6. Write an SQL query to display both the EmpId and ManagerId together.
select * from employeedetails;
select employeedetails.managerid,employeesalary.empid from employeedetails left join employeesalary on employeedetails.empid=employeesalary.empid;

#Ques.7. Write an SQL query to uppercase the name of the employee and lowercase the city values.
select upper(fullname) as upper,lower(city) as lower from employeedetails;

#Ques.8. Write an SQL query to find the current date-time.
select curdate() as currentdate;

#Ques. 9. Write an SQL query to fetch all the Employees who are also managers from the EmployeeDetails table.
select employeedetails.*,employeesalary.empid from employeesalary left join employeedetails on employeesalary.empid=employeedetails.empid;

#Ques.10. Write an SQL query to fetch duplicate records from EmployeeDetails (without considering the primary key – EmpId)
bangalore_restaurantsbangalore_restaurants