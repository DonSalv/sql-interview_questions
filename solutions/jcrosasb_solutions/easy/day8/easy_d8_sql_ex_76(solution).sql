-- Create teh employees table
Create table Employees (employee_id int, name varchar(30), salary int);

-- Populate the employees table    
Truncate table Employees;
insert into Employees (employee_id, name, salary) values (2, 'Meir', 3000);
insert into Employees (employee_id, name, salary) values (3, 'Michael', 3800);
insert into Employees (employee_id, name, salary) values (7, 'Addilyn', 7400);
insert into Employees (employee_id, name, salary) values (8, 'Juan', 6100);
insert into Employees (employee_id, name, salary) values (9, 'Kannon', 7700);

-- Write a solution to calculate the bonus of each employee. 
-- The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee's name does not start with the character 'M'. The bonus of an employee is 0 otherwise.
-- Return the result table ordered by employee_id
SELECT 
    employee_id, 
    CASE 
        WHEN (MOD(employee_id, 2) = 0 OR SUBSTR(name, 1, 1) = 'M') THEN 0 
        ELSE salary
    END bonus
FROM Employees
ORDER BY employee_id;

-- Drop tables
DROP TABLE Employees;
