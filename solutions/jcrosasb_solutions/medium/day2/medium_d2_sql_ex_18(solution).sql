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
insert into Employee (employee_id, name, experience_years) values (3, 'John', 3);
insert into Employee (employee_id, name, experience_years) values (4, 'Doe', 2);

-- Write a solution to report the most experienced employees in each project. 
-- In case of a tie, report all employees with the maximum number of experience years
SELECT
    project_id,
    employee_id
FROM (SELECT 
          p.project_id,
          p.employee_id,
          DENSE_RANK() OVER (PARTITION BY project_id ORDER BY experience_years DESC) rank
      FROM 
          Employee e 
      INNER JOIN 
          Project p 
      ON 
          p.employee_id = e.employee_id)
WHERE rank = 1;

-- Drop tables
DROP TABLE Project;
DROP TABLE Employee;
