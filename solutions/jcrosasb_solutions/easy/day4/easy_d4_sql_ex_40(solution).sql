-- Create the employee table
Create table Employee (employee_id int, team_id int);
    
-- Populate the employee table
Truncate table Employee;
insert into Employee (employee_id, team_id) values ('1', '8');
insert into Employee (employee_id, team_id) values ('2', '8');
insert into Employee (employee_id, team_id) values ('3', '8');
insert into Employee (employee_id, team_id) values ('4', '7');
insert into Employee (employee_id, team_id) values ('5', '9');
insert into Employee (employee_id, team_id) values ('6', '9');

-- Write a solution to find the team size of each of the employees.
SELECT 
    e.employee_id, 
    t.team_size 
FROM Employee e 
LEFT JOIN (SELECT 
               team_id, 
               count(*) team_size 
           FROM Employee 
           GROUP BY team_id) t 
ON t.team_id = e.team_id;

-- Drop tables
DROP TABLE Employee;
