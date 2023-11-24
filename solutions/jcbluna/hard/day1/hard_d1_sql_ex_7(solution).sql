-- Create the tables
CREATE TABLE Salary (id int, employee_id int, amount int, pay_date date);
CREATE TABLE Employee (employee_id int, department_id int);
    
-- Populate the salary table
TRUNCATE TABLE Salary;
INSERT INTO Salary (id, employee_id, amount, pay_date) VALUES ('1', '1', '9000', TO_DATE('2017/03/31','%YYYY/%MM/%DD'));
INSERT INTO Salary (id, employee_id, amount, pay_date) VALUES ('2', '2', '6000', TO_DATE('2017/03/31','%YYYY/%MM/%DD'));
INSERT INTO Salary (id, employee_id, amount, pay_date) VALUES ('3', '3', '10000', TO_DATE('2017/03/31','%YYYY/%MM/%DD'));
INSERT INTO Salary (id, employee_id, amount, pay_date) VALUES ('4', '1', '7000', TO_DATE('2017/02/28','%YYYY/%MM/%DD'));
INSERT INTO Salary (id, employee_id, amount, pay_date) VALUES ('5', '2', '6000', TO_DATE('2017/02/28','%YYYY/%MM/%DD'));
INSERT INTO Salary (id, employee_id, amount, pay_date) VALUES ('6', '3', '8000', TO_DATE('2017/02/28','%YYYY/%MM/%DD'));
    
-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (employee_id, department_id) VALUES ('1', '1');
INSERT INTO Employee (employee_id, department_id) VALUES ('2', '2');
INSERT INTO Employee (employee_id, department_id) VALUES ('3', '2');

-- Solve the exercise
SELECT DISTINCT TO_CHAR(TRUNC(pay_date, 'MM'),'YYYY-MM') AS pay_month, department_id,
(CASE WHEN AVG(amount) OVER(PARTITION BY TO_CHAR(TRUNC(pay_date, 'MM'),'YYYY-MM'), department_id)>
AVG(amount) OVER(PARTITION BY TO_CHAR(TRUNC(pay_date, 'MM'),'YYYY-MM')) THEN 'higher'
WHEN AVG(amount) OVER(PARTITION BY TO_CHAR(TRUNC(pay_date, 'MM'),'YYYY-MM'), department_id)=
AVG(amount) OVER(PARTITION BY TO_CHAR(TRUNC(pay_date, 'MM'),'YYYY-MM')) THEN 'same'
ELSE 'lower' END) AS comparison
FROM Salary s JOIN Employee e
USING(employee_id);

-- Drop unused tables
DROP TABLE Salary;
DROP TABLE Employee;