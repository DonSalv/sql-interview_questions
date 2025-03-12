-- medium day 01 ex 09 

Create table  Student (student_id number primary key , student_name varchar(45), gender varchar(6), dept_id number);
Create table  Department (dept_id number, dept_name varchar(255));
    
-- Populate the student table
Truncate table Student
insert into Student (student_id, student_name, gender, dept_id) values (1, 'Jack', 'M', 1);
insert into Student (student_id, student_name, gender, dept_id) values (2, 'Jane', 'F', 1);
insert into Student (student_id, student_name, gender, dept_id) values (3, 'Mark', 'M', 2);

select * from student;

-- Populate the department table
Truncate table Department
insert into Department (dept_id, dept_name) values (1, 'Engineering');
insert into Department (dept_id, dept_name) values (2, 'Science');
insert into Department (dept_id, dept_name) values (3, 'Law');

select * from Department;

select dp.dept_name, nvl(tot.num_students,0) as student_number 
from department dp left join 
(select dept_id , count(dept_id)as num_students from student
group by dept_id) tot on dp.dept_id = tot.dept_id
order by student_number desc, dept_name desc;

-- drop tables
drop table Department;
drop table student;