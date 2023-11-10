-- Create the employee table
CREATE TABLE Employee (id int, salary int);

--Example 1
-- Populate the employee table and reset variable
UNDEFINE n
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, salary) VALUES ('1', '100');
INSERT INTO Employee (id, salary) VALUES ('2', '200');
INSERT INTO Employee (id, salary) VALUES ('3', '300');

--Example 2
-- Populate the employee table  and reset variable
UNDEFINE n
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, salary) VALUES ('1', '100');

-- Solve the exercise
SELECT (SELECT salary
FROM (SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num FROM Employee) s
WHERE row_num=&&n) AS "getNthHighestSalary(&n)" FROM dual;

-- Drop unused table
DROP TABLE Employee;