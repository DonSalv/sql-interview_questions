Create table Employee (employee_id int, name varchar(10), experience_years int, CONSTRAINT Employee_pk PRIMARY KEY (employee_id));
Create table Project (project_id int, employee_id int,
CONSTRAINT fk_Project FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

ALTER TABLE Project ADD PRIMARY KEY (project_id, employee_id) DISABLE;

insert into Employee (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee (employee_id, name, experience_years) values ('3', 'John', '3');
insert into Employee (employee_id, name, experience_years) values ('4', 'Doe', '2');

insert into Project (project_id, employee_id) values ('1', '1');
insert into Project (project_id, employee_id) values ('1', '2');
insert into Project (project_id, employee_id) values ('1', '3');
insert into Project (project_id, employee_id) values ('2', '1');
insert into Project (project_id, employee_id) values ('2', '4');

SELECT project_id, employee_id FROM
(SELECT p.project_id, p.employee_id,
RANK() OVER (PARTITION BY project_id ORDER BY experience_years DESC) AS ranking
FROM Project p JOIN Employee e ON p.employee_id = e.employee_id)
WHERE ranking=1;

DROP TABLE Project PURGE;
DROP TABLE Employee PURGE;