-- Create the employee table
CREATE TABLE Employee (id int, month int, salary int);

-- Populate the employee table    
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, month, salary) VALUES ('1', '1', '20');
INSERT INTO Employee (id, month, salary) VALUES ('2', '1', '20');
INSERT INTO Employee (id, month, salary) VALUES ('1', '2', '30');
INSERT INTO Employee (id, month, salary) VALUES ('2', '2', '30');
INSERT INTO Employee (id, month, salary) VALUES ('3', '2', '40');
INSERT INTO Employee (id, month, salary) VALUES ('1', '3', '40');
INSERT INTO Employee (id, month, salary) VALUES ('3', '3', '60');
INSERT INTO Employee (id, month, salary) VALUES ('1', '4', '60');
INSERT INTO Employee (id, month, salary) VALUES ('3', '4', '70');
INSERT INTO Employee (id, month, salary) VALUES ('1', '7', '90');
INSERT INTO Employee (id, month, salary) VALUES ('1', '8', '90');

-- Solve the exercise
SELECT id, month, "Salary"
FROM(SELECT e1.id, e1.month, e1.salary +NVL(e2.salary,0) + NVL(e3.salary,0) AS "Salary", DENSE_RANK() OVER(PARTITION BY e1.id ORDER BY e1.month DESC) AS month_rank
FROM Employee e1 LEFT OUTER JOIN Employee e2
ON(e1.id=e2.id AND e1.month=e2.month+1)
LEFT OUTER JOIN Employee e3
ON(e2.id=e3.id AND e1.month=e3.month+2)
ORDER BY id, month DESC)
WHERE month_rank>1;

-- Drop unused table
DROP TABLE Employee;