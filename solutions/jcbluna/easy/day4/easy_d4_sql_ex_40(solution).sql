-- Create the employee table
CREATE TABLE Employee (employee_id int, team_id int);
    
-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (employee_id, team_id) VALUES ('1', '8');
INSERT INTO Employee (employee_id, team_id) VALUES ('2', '8');
INSERT INTO Employee (employee_id, team_id) VALUES ('3', '8');
INSERT INTO Employee (employee_id, team_id) VALUES ('4', '7');
INSERT INTO Employee (employee_id, team_id) VALUES ('5', '9');
INSERT INTO Employee (employee_id, team_id) VALUES ('6', '9');

-- Solve the exercise

SELECT e1.employee_id, COUNT(e2.employee_id) AS team_size
FROM Employee e1 JOIN Employee e2
USING(team_id)
GROUP BY e1.employee_id
ORDER BY e1.employee_id;

-- Drop unused tables
DROP TABLE Employee;