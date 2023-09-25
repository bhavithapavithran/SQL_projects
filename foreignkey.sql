# Using Database
use emp;

#Creating Table
create table empinf(
dept_id varchar(25) primary key,
first_name varchar(25),
last_name varchar(25),
age int(10),
salary int(25),
foreign key(dept_id) references dept(dept_id)
);

# Inserting values into table
insert into empinf values ('1','anurag','sharma',25,654644),
('2','paranav','shankar',23,235265),
('3','gaurav','singh',54,6998999),
('4','dev','chopra',29,465546);

#Creating Table dept
create table dept(
dept_id varchar(20) primary key,
dept_name varchar(25),
location varchar(25)
);

# Inserting values into table
insert into dept
values('1','mech','lucknow'),
('2','civil','gurugram'),
('3','eee','hyderabad'),
('4','cs','kerala');

#Nested €Queries In SQL
select * from empinf where dept_id in (select dept_id from dept where dept_name ='mech');

# Subqueries in SQL
select dept_name from dept where dept_id= (select dept_id from empinf where first_name ='anurag');
select salary from empinf where dept_id =(select dept_id from empinf where last_name ='chopra');
select upper(first_name) from empinf where dept_id =(select dept_id from empinf where last_name ='chopra');
select reverse(last_name) from empinf where dept_id=(Select dept_id from empinf where age>30);



