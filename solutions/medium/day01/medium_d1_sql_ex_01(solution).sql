-- Create the employee table

create table Employee( 
id  number UNIQUE,
salary NUMBER);


-- Populate the employee table    
Truncate table Employee;
insert into Employee (id, salary) values (1, 100);
insert into Employee (id, salary) values (2, 200);
insert into Employee (id, salary) values (3, 300);



with ranked_salaries as (select salary, dense_rank() over (order by salary desc) as rank_salary from Employeeone)
select max(salary) as SecondHighestSalary from ranked_salaries where rank_salary = 2;

truncate table Employee;

drop table Employee;