-- Create the employee table
CREATE TABLE Employee (id int, salary int);

--Example 1
-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, salary) VALUES ('1', '100');
INSERT INTO Employee (id, salary) VALUES ('2', '200');
INSERT INTO Employee (id, salary) VALUES ('3', '300');

--Example 2
-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, salary) VALUES ('1', '100');

-- Solve the exercise
DEFINE n='2'

-- Use the DISTINCT clause to return only one value
SELECT (SELECT DISTINCT salary
-- Use the DENSE_RANK function to consider only the second different value
FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_salary FROM Employee) s
WHERE rank_salary=&n) AS "getNthHighestSalary(&n)" FROM dual;

UNDEFINE n

-- Drop unused table
DROP TABLE Employee;