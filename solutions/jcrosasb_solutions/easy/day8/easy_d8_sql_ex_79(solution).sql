-- Create the tables
Create table Employees (employee_id int, name varchar(30));
Create table Salaries (employee_id int, salary int);
    
-- Populate the employees table
Truncate table Employees;
insert into Employees (employee_id, name) values (2, 'Crew');
insert into Employees (employee_id, name) values (4, 'Haven');
insert into Employees (employee_id, name) values (5, 'Kristian');

-- Populate the salaries table
Truncate table Salaries;
insert into Salaries (employee_id, salary) values (5, 76071);
insert into Salaries (employee_id, salary) values (1, 22517);
insert into Salaries (employee_id, salary) values (4, 63539);

-- Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:
--      * The employee's name is missing, or
--      * The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order
SELECT 
    t.employee_id 
FROM (SELECT 
          DISTINCT employee_id 
      FROM (SELECT 
                employee_id 
            FROM Employees 
            UNION ALL 
            SELECT 
                employee_id 
            FROM Salaries)) t 
FULL OUTER JOIN Employees e 
    ON t.employee_id = e.employee_id 
FULL OUTER JOIN Salaries s  
    ON t.employee_id = s.employee_id
WHERE 
    e.name IS NULL 
    OR s.salary IS NULL
ORDER BY t.employee_id;

-- Drop tables
DROP TABLE Employees;
DROP TABLE Salaries;
