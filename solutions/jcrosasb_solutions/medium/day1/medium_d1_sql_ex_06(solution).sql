-- Create the employee table
Create table Employee (id int, name varchar(255), department varchar(255), managerId int);
    
-- Populate the employee table
Truncate table Employee;
insert into Employee (id, name, department, managerId) values (101, 'John', 'A', NULL);
insert into Employee (id, name, department, managerId) values (102, 'Dan', 'A', 101);
insert into Employee (id, name, department, managerId) values (103, 'James', 'A', 101);
insert into Employee (id, name, department, managerId) values (104, 'Amy', 'A', 101);
insert into Employee (id, name, department, managerId) values (105, 'Anne', 'A', 101);
insert into Employee (id, name, department, managerId) values (106, 'Ron', 'B', 101);

-- Write a solution to find managers with at least five direct reports
WITH manager_count AS (
    SELECT 
        managerid 
    FROM 
        Employee 
    GROUP BY 
        managerid 
    HAVING 
        COUNT(managerid) >= 5)
SELECT 
    e.name
FROM 
    Employee e
INNER JOIN
    manager_count m
ON
    e.id = m.managerid;
    
-- Drop tables
DROP TABLE Employee;
