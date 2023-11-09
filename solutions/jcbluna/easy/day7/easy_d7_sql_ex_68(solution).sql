-- Create the employees table
CREATE TABLE Employees(emp_id int, event_day date, in_time int, out_time int);

-- Populate the employees table    
TRUNCATE TABLE Employees;
INSERT INTO Employees (emp_id, event_day, in_time, out_time) VALUES ('1', TO_DATE('2020-11-28','%YYYY-%MM-%DD'), '4', '32');
INSERT INTO Employees (emp_id, event_day, in_time, out_time) VALUES ('1', TO_DATE('2020-11-28','%YYYY-%MM-%DD'), '55', '200');
INSERT INTO Employees (emp_id, event_day, in_time, out_time) VALUES ('1', TO_DATE('2020-12-03','%YYYY-%MM-%DD'), '1', '42');
INSERT INTO Employees (emp_id, event_day, in_time, out_time) VALUES ('2', TO_DATE('2020-11-28','%YYYY-%MM-%DD'), '3', '33');
INSERT INTO Employees (emp_id, event_day, in_time, out_time) VALUES ('2', TO_DATE('2020-12-09','%YYYY-%MM-%DD'), '47', '74');

-- Solve the exercise
SELECT TO_CHAR(event_day,'YYYY-MM-DD') AS day, emp_id, SUM(out_time-in_time) AS total_time
FROM Employees
GROUP BY TO_CHAR(event_day,'YYYY-MM-DD'), emp_id
ORDER BY TO_CHAR(event_day,'YYYY-MM-DD'), emp_id;

-- Drop unused table
DROP TABLE Employees;