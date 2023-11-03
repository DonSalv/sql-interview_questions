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

-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
SELECT 
    t.project_id, 
    CAST(AVG(t.experience_years) AS DECIMAL(10,2)) average_years 
FROM (SELECT 
          p.project_id, 
          e.experience_years 
      FROM Project p 
      INNER JOIN Employee e 
      ON p.employee_id = e. employee_id) t 
GROUP BY t.project_id;

-- Drop tables
DROP TABLE Project;
DROP TABLE Employee;
