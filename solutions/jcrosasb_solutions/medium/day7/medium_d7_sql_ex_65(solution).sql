-- Create the employees table
Create table Employees (employee_id int, name varchar(30), salary int);

-- Populate the employees table
Truncate table Employees;
insert into Employees (employee_id, name, salary) values (2, 'Meir', 3000);
insert into Employees (employee_id, name, salary) values (3, 'Michael', 3000);
insert into Employees (employee_id, name, salary) values (7, 'Addilyn', 7400);
insert into Employees (employee_id, name, salary) values (8, 'Juan', 6100);
insert into Employees (employee_id, name, salary) values (9, 'Kannon', 7400);

-- A company wants to divide the employees into teams such that all the members on each team have the same salary. The teams should follow these criteria:
--      * Each team should consist of at least two employees.
--      * All the employees on a team should have the same salary.
--      * All the employees of the same salary should be assigned to the same team.
--      * If the salary of an employee is unique, we do not assign this employee to any team.
--      * A team's ID is assigned based on the rank of the team's salary relative to the other teams' salaries, where 
--        the team with the lowest salary has team_id = 1. Note that the salaries for employees not on a team are not included in this ranking.
-- Write a solution to get the team_id of each employee that is in a team.
-- Return the result table ordered by team_id in ascending order. In case of a tie, order it by employee_id in ascending order.
SELECT
    DISTINCT employee_id,
    name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary) AS team_id
FROM
    Employees
WHERE salary IN (SELECT 
                     salary
                 FROM 
                     Employees
                 GROUP BY 
                     salary
                 HAVING 
                     COUNT(*) > 1)
                 ORDER BY
                     team_id,
                     employee_id;
    
--
DROP TABLE Employees;
