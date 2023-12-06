-- Create the tables
Create table Employees (employee_id int, needed_hours int);
Create table Logs (employee_id int, in_time timestamp, out_time timestamp);

-- Populate the employees table    
Truncate table Employees;
insert into Employees (employee_id, needed_hours) values ('1', '20');
insert into Employees (employee_id, needed_hours) values ('2', '12');
insert into Employees (employee_id, needed_hours) values ('3', '2');

-- Populate the logs table    
Truncate table Logs;
insert into Logs (employee_id, in_time, out_time) values ('1', TO_TIMESTAMP('2022-10-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Logs (employee_id, in_time, out_time) values ('1', TO_TIMESTAMP('2022-10-06 09:05:04', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-06 17:09:03', 'YYYY-MM-DD HH24:MI:SS'));
insert into Logs (employee_id, in_time, out_time) values ('1', TO_TIMESTAMP('2022-10-12 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-13 03:00:01', 'YYYY-MM-DD HH24:MI:SS'));
insert into Logs (employee_id, in_time, out_time) values ('2', TO_TIMESTAMP('2022-10-29 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-29 23:58:58', 'YYYY-MM-DD HH24:MI:SS'));

-- In a company, each employee must work a certain number of hours every month. Employees work in sessions. The number of hours an employee worked can be calculated 
-- from the sum of the number of minutes the employee worked in all of their sessions. The number of minutes in each session is rounded up.
--   * For example, if the employee worked for 51 minutes and 2 seconds in a session, we consider it 52 minutes.
-- Write a solution to report the IDs of the employees that will be deducted. In other words, report the IDs of the employees that did not work the needed hours.
WITH hours_by_emp AS (
    SELECT 
        e.employee_id,
        NVL(CEIL(SUM(EXTRACT(DAY    FROM (l.out_time - l.in_time))*60*24 +
                     EXTRACT(HOUR   FROM (l.out_time - l.in_time))*60 +
                     EXTRACT(MINUTE FROM (l.out_time - l.in_time)) +
                     EXTRACT(SECOND FROM (l.out_time - l.in_time))/60))/60, 0) AS total_hours  
    FROM
        Employees e
    LEFT JOIN
        Logs l
    ON
        e.employee_id = l.employee_id
    GROUP BY
        e.employee_id)
SELECT
    employee_id
FROM
    hours_by_emp 
JOIN
    Employees 
USING
    (employee_id)
WHERE
    total_hours < needed_hours;
    
-- Drop tables
DROP TABLE Employees;
DROP TABLE Logs;
