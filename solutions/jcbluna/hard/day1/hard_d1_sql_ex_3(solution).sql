-- Create the employee table
CREATE TABLE Employee (id int, company varchar(255), salary int);

-- Populate the employee table    
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, company, salary) VALUES ('1', 'A', '2341');
INSERT INTO Employee (id, company, salary) VALUES ('2', 'A', '341');
INSERT INTO Employee (id, company, salary) VALUES ('3', 'A', '15');
INSERT INTO Employee (id, company, salary) VALUES ('4', 'A', '15314');
INSERT INTO Employee (id, company, salary) VALUES ('5', 'A', '451');
INSERT INTO Employee (id, company, salary) VALUES ('6', 'A', '513');
INSERT INTO Employee (id, company, salary) VALUES ('7', 'B', '15');
INSERT INTO Employee (id, company, salary) VALUES ('8', 'B', '13');
INSERT INTO Employee (id, company, salary) VALUES ('9', 'B', '1154');
INSERT INTO Employee (id, company, salary) VALUES ('10', 'B', '1345');
INSERT INTO Employee (id, company, salary) VALUES ('11', 'B', '1221');
INSERT INTO Employee (id, company, salary) VALUES ('12', 'B', '234');
INSERT INTO Employee (id, company, salary) VALUES ('13', 'C', '2345');
INSERT INTO Employee (id, company, salary) VALUES ('14', 'C', '2645');
INSERT INTO Employee (id, company, salary) VALUES ('15', 'C', '2645');
INSERT INTO Employee (id, company, salary) VALUES ('16', 'C', '2652');
INSERT INTO Employee (id, company, salary) VALUES ('17', 'C', '65');

-- Solve the exercise
SELECT id, company, salary
FROM(SELECT id, company, salary, ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary, id) AS rn, 
COUNT(id) OVER(PARTITION BY company) AS num_employees
FROM Employee)
WHERE rn BETWEEN (num_employees+1)/2-0.5 AND (num_employees+1)/2+0.5;

-- Follow up
-- Not scalable and only works for these three companies
WITH EmpA AS
(SELECT id, company, salary, ROWNUM AS rn
FROM(SELECT id, company, salary
FROM Employee
WHERE company='A'
ORDER BY salary, id)),
EmpB AS
(SELECT id, company, salary, ROWNUM AS rn
FROM(SELECT id, company, salary
FROM Employee
WHERE company='B'
ORDER BY salary, id)),
EmpC AS
(SELECT id, company, salary, ROWNUM AS rn
FROM(SELECT id, company, salary
FROM Employee
WHERE company='C'
ORDER BY salary, id)),
NumEmp AS
(SELECT company, COUNT(id) AS num_employees
FROM Employee
GROUP BY company)
SELECT id, company, salary
FROM(SELECT id, a.company, salary, num_employees, rn
FROM EmpA a JOIN NumEmp n
ON(a.company=n.company)
UNION ALL 
SELECT id, b.company, salary, num_employees, rn
FROM EmpB b JOIN NumEmp n
ON(b.company=n.company)
UNION ALL
SELECT id, c.company, salary, num_employees, rn
FROM EmpC c JOIN NumEmp n
ON(c.company=n.company))
WHERE rn BETWEEN (num_employees+1)/2-0.5 AND (num_employees+1)/2+0.5;

-- Drop unused table
DROP TABLE Employee;