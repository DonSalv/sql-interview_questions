-- Create the employees table
Create table Employees(employee_id int, name varchar(20), reports_to int, age int);

-- Populate the employees table    
Truncate table Employees;
insert into Employees (employee_id, name, reports_to, age) values (9, 'Hercy', Null, 43);
insert into Employees (employee_id, name, reports_to, age) values (6, 'Alice', 9, 41);
insert into Employees (employee_id, name, reports_to, age) values (4, 'Bob', 9, 36);
insert into Employees (employee_id, name, reports_to, age) values (2, 'Winston', Null, 37);

-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
-- Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id
SELECT
    e1.employee_id AS employee_id,
    e1.name AS name,
    COUNT(e2.employee_id) AS number_of_employees,
    ROUND(AVG(e2.age)) AS average_age
FROM EMPLOYEES e1
LEFT JOIN EMPLOYEES e2
ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id, e1.name
ORDER BY e1.employee_id;
    
-- Drop tables
DROP TABLE Employees;
