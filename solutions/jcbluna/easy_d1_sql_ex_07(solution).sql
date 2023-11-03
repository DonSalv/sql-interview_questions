-- Create the tables
CREATE TABLE Employee (empId int, name varchar(255), supervisor int, salary int);
CREATE TABLE Bonus (empId int, bonus int);

-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (empId, name, supervisor, salary) VALUES ('3', 'Brad', NULL, '4000');
INSERT INTO Employee (empId, name, supervisor, salary) VALUES ('1', 'John', '3', '1000');
INSERT INTO Employee (empId, name, supervisor, salary) VALUES ('2', 'Dan', '3', '2000');
INSERT INTO Employee (empId, name, supervisor, salary) VALUES ('4', 'Thomas', '3', '4000');

-- Populate the bonus table
TRUNCATE TABLE Bonus;
INSERT INTO Bonus (empId, bonus) values ('2', '500');
INSERT INTO Bonus (empId, bonus) values ('4', '2000');

-- Solve the exercise
SELECT name, bonus
FROM Employee e LEFT OUTER JOIN Bonus b
ON (b.empId=e.empId)
WHERE bonus IS NULL
OR bonus<1000
ORDER BY bonus DESC, name NULLS FIRST;

-- Drop unused tables
DROP TABLE Employee;
DROP TABLE Bonus;