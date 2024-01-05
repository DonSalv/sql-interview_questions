Create table Employee (employee_id int, department_id int, CONSTRAINT Employee_pk PRIMARY KEY (employee_id));
Create table Salary (id int, employee_id int, amount int, pay_date date, CONSTRAINT Salary_pk PRIMARY KEY (id),
CONSTRAINT fk_Salary FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

insert into Employee (employee_id, department_id) values ('1', '1');
insert into Employee (employee_id, department_id) values ('2', '2');
insert into Employee (employee_id, department_id) values ('3', '2');

insert into Salary (id, employee_id, amount, pay_date) values ('1', '1', '9000', TO_DATE('2017/03/31','YYYY-MM-DD'));
insert into Salary (id, employee_id, amount, pay_date) values ('2', '2', '6000', TO_DATE('2017/03/31','YYYY-MM-DD'));
insert into Salary (id, employee_id, amount, pay_date) values ('3', '3', '10000', TO_DATE('2017/03/31','YYYY-MM-DD'));
insert into Salary (id, employee_id, amount, pay_date) values ('4', '1', '7000', TO_DATE('2017/02/28','YYYY-MM-DD'));
insert into Salary (id, employee_id, amount, pay_date) values ('5', '2', '6000', TO_DATE('2017/02/28','YYYY-MM-DD'));
insert into Salary (id, employee_id, amount, pay_date) values ('6', '3', '8000', TO_DATE('2017/02/28','YYYY-MM-DD'));

SELECT pay_month, department_id,
CASE WHEN avg_department>avg_month THEN 'higher'
WHEN avg_department<avg_month THEN 'lower'
ELSE 'same' END AS comparison FROM
(SELECT DISTINCT department_id, pay_month, 
AVG(amount) OVER (PARTITION BY pay_month, department_id) AS avg_department,
AVG(amount) OVER (PARTITION BY pay_month) AS avg_month FROM
(SELECT e.department_id, s.amount, TO_CHAR(pay_date,'YYYY-MM') AS pay_month FROM Salary s
JOIN Employee e ON s.employee_id = e.employee_id))
ORDER BY pay_month, department_id;

DROP TABLE Salary PURGE;
DROP TABLE Employee PURGE;