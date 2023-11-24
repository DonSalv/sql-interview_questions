-- Create the salaries table
Create table Salaries(emp_name varchar(30), department varchar(30),salary int);
    
-- Populate the salaries table
Truncate table Salaries;
insert into Salaries (emp_name, department, salary) values ('Kathy', 'Engineering', 50000);
insert into Salaries (emp_name, department, salary) values ('Roy', 'Marketing', 30000);
insert into Salaries (emp_name, department, salary) values ('Charles', 'Engineering', 45000);
insert into Salaries (emp_name, department, salary) values ('Jack', 'Engineering', 85000);
insert into Salaries (emp_name, department, salary) values ('Benjamin', 'Marketing', 34000);
insert into Salaries (emp_name, department, salary) values ('Anthony', 'Marketing', 42000);
insert into Salaries (emp_name, department, salary) values ('Edward', 'Engineering', 102000);
insert into Salaries (emp_name, department, salary) values ('Terry', 'Engineering', 44000);
insert into Salaries (emp_name, department, salary) values ('Evelyn', 'Marketing', 53000);
insert into Salaries (emp_name, department, salary) values ('Arthur', 'Engineering', 32000);

-- Write a solution to calculate the difference between the highest salaries in the marketing and engineering department.
-- Output the absolute difference in salaries
SELECT
    ABS(
        MAX(CASE WHEN department = 'Engineering' THEN salary END) - 
        MAX(CASE WHEN department = 'Marketing' THEN salary END)) salary_difference
FROM
    Salaries;
    
-- Drop tables
DROP TABLE Salaries;
