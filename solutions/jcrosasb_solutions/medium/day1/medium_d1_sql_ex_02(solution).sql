-- Create the employee table
Create table Employee (id int, salary int);

-- Populate the employee table    
Truncate table Employee;
insert into Employee (id, salary) values (1, 100);
insert into Employee (id, salary) values (2, 200);
insert into Employee (id, salary) values (3, 300);

-- Write a solution to find the nth highest salary from the EMPLOYEE table. If there is no nth highest salary, return null

-- NOTE: you can adjust the n value in RANK. For the case below, RANK=3, so n=3
SELECT NVL((SELECT 
                DISTINCT salary
            FROM 
                (SELECT 
                     salary,
                     DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
                 FROM 
                    employee) 
            WHERE RANK = 3) 
            , NULL)  getNthHighestSalary
FROM 
    dual;

-- Drop tables
DROP TABLE Employee;
