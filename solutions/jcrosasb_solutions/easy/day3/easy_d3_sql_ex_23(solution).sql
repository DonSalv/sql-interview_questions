-- Create the tables
Create table Project (project_id int, employee_id int);
Create table Employee (employee_id int, name varchar(10), experience_years int);
    
-- Populate the project table
Truncate table Project;
insert into Project (project_id, employee_id) values (1, 1);
insert into Project (project_id, employee_id) values (1, 2);
insert into Project (project_id, employee_id) values (1, 3);
insert into Project (project_id, employee_id) values (2, 1);
insert into Project (project_id, employee_id) values (2, 4);
    
-- Populate the employee table
Truncate table Employee;
insert into Employee (employee_id, name, experience_years) values (1, 'Khaled', 3);
insert into Employee (employee_id, name, experience_years) values (2, 'Ali', 2);
insert into Employee (employee_id, name, experience_years) values (3, 'John', 1);
insert into Employee (employee_id, name, experience_years) values (4, 'Doe', 2);

-- Write a solution to report all the projects that have the most employees.
SELECT 
    project_id 
FROM (SELECT 
          project_id, 
          COUNT(employee_id) num_employees 
      FROM Project 
      GROUP BY project_id) 
WHERE num_employees = (SELECT 
                           MAX(num_employees) 
                       FROM (SELECT 
                                 project_id, 
                                 COUNT(employee_id) num_employees 
                             FROM Project 
                             GROUP BY project_id));

-- Drop tables 
DROP TABLE Project;
DROP TABLE Employee;
