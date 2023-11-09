-- Create the employee table
CREATE TABLE Employee (employee_id int, department_id int, primary_flag char(1) CHECK(primary_flag IN ('Y','N')));

-- Populate the employee table    
TRUNCATE TABLE Employee;
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES ('1', '1', 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES ('2', '1', 'Y');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES ('2', '2', 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES ('3', '3', 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES ('4', '2', 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES ('4', '3', 'Y');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES ('4', '4', 'N');

-- Solve the exercise
SELECT employee_id, department_id
FROM Employee e
WHERE primary_flag='Y'
OR (SELECT COUNT(department_id) FROM  Employee
    WHERE employee_id=e.employee_id)=1;

-- Drop unused table
DROP TABLE Employee;