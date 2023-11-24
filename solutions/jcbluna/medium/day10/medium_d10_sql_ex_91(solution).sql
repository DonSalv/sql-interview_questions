-- Create the tables
CREATE TABLE Employees (employee_id int, needed_hours int);
CREATE TABLE Logs (employee_id int, in_time date, out_time date);

-- Populate the employees table    
TRUNCATE TABLE Employees;
INSERT INTO Employees (employee_id, needed_hours) VALUES ('1', '20');
INSERT INTO Employees (employee_id, needed_hours) VALUES ('2', '12');
INSERT INTO Employees (employee_id, needed_hours) VALUES ('3', '2');

-- Populate the logs table    
TRUNCATE TABLE Logs;
INSERT INTO Logs (employee_id, in_time, out_time) VALUES ('1', TO_DATE('2022-10-01 09:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2022-10-01 17:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logs (employee_id, in_time, out_time) VALUES ('1', TO_DATE('2022-10-06 09:05:04','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2022-10-06 17:09:03','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logs (employee_id, in_time, out_time) VALUES ('1', TO_DATE('2022-10-12 23:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2022-10-13 03:00:01','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logs (employee_id, in_time, out_time) VALUES ('2', TO_DATE('2022-10-29 12:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2022-10-29 23:58:58','%YYYY-%MM-%DD %HH24:%MI:%SS'));

-- Solve the exercise
SELECT e.employee_id
FROM Employees e LEFT OUTER JOIN
(SELECT employee_id, NVL(CEIL(SUM((out_time-in_time)*24*60)),0) AS total_time
FROM Logs
GROUP BY employee_id) l
ON(e.employee_id=l.employee_id)
WHERE total_time<needed_hours*60
OR total_time IS NULL;

-- Drop unused tables
DROP TABLE Employees;
DROP TABLE Logs;