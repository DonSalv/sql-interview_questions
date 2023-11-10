-- Create the salary table
CREATE TABLE Salary (emp_id int,firstname varchar(100),lastname varchar(100),salary int, department_id varchar(100));

-- Populate the salary table    
TRUNCATE TABLE Salary;
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('1', 'Todd', 'Wilson', '110000', 'D1006');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('1', 'Todd', 'Wilson', '106119', 'D1006');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('2', 'Justin', 'Simon', '128922', 'D1005');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('2', 'Justin', 'Simon', '130000', 'D1005');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('3', 'Kelly', 'Rosario', '42689', 'D1002');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('4', 'Patricia', 'Powell', '162825', 'D1004');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('4', 'Patricia', 'Powell', '170000', 'D1004');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('5', 'Sherry', 'Golden', '44101', 'D1002');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('6', 'Natasha', 'Swanson', '79632', 'D1005');
INSERT INTO Salary (emp_id, firstname, lastname, salary, department_id) VALUES ('6', 'Natasha', 'Swanson', '90000', 'D1005');

-- Solve the exercise
SELECT emp_id, firstname, lastname, MAX(salary) AS salary, department_id
FROM Salary
GROUP BY emp_id, firstname, lastname, department_id
ORDER BY emp_id ASC;

-- Drop unused table
DROP TABLE Salary;