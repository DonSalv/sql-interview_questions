-- Create the tables
Create table  Department (id NUMBER PRIMARY KEY,
                          name varchar(255));

Create table  Employee (id number primary key,
                        name varchar(255),
                        salary number, 
                        departmentId number,
                        constraint fk_department FOREIGN  KEY (departmentId) REFERENCES Department(id)
                        );
                        
-- Populate the employee table    
Truncate table Employee
;

-- Populate the department table
Truncate table Department
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

-- Populate the employee table    
Truncate table Employee
insert into Employee (id, name, salary, departmentId) values (1, 'Joe', 70000, 1);
insert into Employee (id, name, salary, departmentId) values (2, 'Jim', 90000, 1);
insert into Employee (id, name, salary, departmentId) values (3, 'Henry', 80000, 2);
insert into Employee (id, name, salary, departmentId) values (4, 'Sam', 60000, 2);
insert into Employee (id, name, salary, departmentId) values (5,'Max', 90000, 1);

select * from Employee;
select * from Department;        
        
        
-- solution  1
-- 1) select the max salaries en each department
-- 2) join tables to get the nameo of the department 
-- 3) filter to get employees whose salary is equal to the max salary

with max_salaries as (        
select departmentId, max(salary) as max_salary
from Employee
group by departmentId)
select  dp.name,
        emp.name   as Employee,
        emp.salary as salary
from max_salaries mx join Department dp on  mx.departmentId = dp.id
                     join Employee  emp on  emp.departmentid = mx.departmentId
where mx.max_salary = emp.salary;
        
-- solution 2

select dp.name as name,
      emp.name as Employee,
      emp.salary as salary
from Employee emp join Department dp on emp.departmentid = dp.id
where (emp.departmentId , emp.salary) IN   
             (select departmentId, max(salary) as max_salary 
              from Employee group by departmentId )   ;
-- more efficient query since first the IN"" clause filters rows to the max salary en each department

-- drop table
drop table Employee;
drop table department;