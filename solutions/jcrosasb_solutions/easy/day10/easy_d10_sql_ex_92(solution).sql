-- Create the salary table
Create table Salary (emp_id int,firstname varchar(100),lastname varchar(100),salary int, department_id varchar(100));

-- Populate the salary table    
Truncate table Salary;
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (1, 'Todd', 'Wilson', 110000, 'D1006');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (1, 'Todd', 'Wilson', 106119, 'D1006');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (2, 'Justin', 'Simon', 128922, 'D1005');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (2, 'Justin', 'Simon', 130000, 'D1005');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (3, 'Kelly', 'Rosario', 42689, 'D1002');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (4, 'Patricia', 'Powell', 162825, 'D1004');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (4, 'Patricia', 'Powell', 170000, 'D1004');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (5, 'Sherry', 'Golden', 44101, 'D1002');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (6, 'Natasha', 'Swanson', 79632, 'D1005');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values (6, 'Natasha', 'Swanson', 90000, 'D1005');

-- Write a solution to find the current salary of each employee assuming that salaries increase each year. Output their emp_id, firstname, lastname, salary, and department_id.
-- Return the result table ordered by emp_id in ascending order
SELECT emp_id, 
    firstname, 
    lastname, 
    MAX(salary) salary, 
    department_id 
FROM 
    Salary 
GROUP BY 
    emp_id, 
    firstname, 
    lastname, 
    department_id 
ORDER BY 
    emp_id; 

-- Drop table
DROP TABLE Salary;
