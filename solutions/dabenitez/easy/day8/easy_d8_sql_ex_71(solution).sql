Create table Employee (employee_id int, department_id int, primary_flag VARCHAR2(5), CONSTRAINT primary_flag_check CHECK (primary_flag IN ('Y', 'N')));

ALTER TABLE Employee ADD PRIMARY KEY (employee_id, department_id) DISABLE;

insert into Employee (employee_id, department_id, primary_flag) values ('1', '1', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '1', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('3', '3', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '3', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '4', 'N');

SELECT employee_id, 
CASE WHEN COUNT(department_id) = 1 THEN MAX(department_id)
ELSE MAX(CASE WHEN primary_flag = 'Y' THEN department_id END) END 
AS department_id FROM Employee
GROUP BY employee_id
ORDER BY employee_id;

DROP TABLE Employee PURGE;