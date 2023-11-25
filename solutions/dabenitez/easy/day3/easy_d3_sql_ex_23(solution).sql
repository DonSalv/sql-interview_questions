Create table Employee (employee_id int, name varchar(10), experience_years int not null, CONSTRAINT Employee_pk PRIMARY KEY (employee_id));
Create table Project (project_id int, employee_id int,
CONSTRAINT fk_Project FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

ALTER TABLE Project 
    ADD PRIMARY KEY (project_id, employee_id) DISABLE;

insert into Project (project_id, employee_id) values ('1', '1');
insert into Project (project_id, employee_id) values ('1', '2');
insert into Project (project_id, employee_id) values ('1', '3');
insert into Project (project_id, employee_id) values ('2', '1');
insert into Project (project_id, employee_id) values ('2', '4');

insert into Employee (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee (employee_id, name, experience_years) values ('3', 'John', '1');
insert into Employee (employee_id, name, experience_years) values ('4', 'Doe', '2');


SELECT project_id FROM 
(SELECT project_id, RANK() OVER (ORDER BY COUNT(employee_id) DESC) AS rnk FROM PROJECT GROUP BY project_id)
WHERE rnk = 1;

DROP TABLE Project PURGE;
DROP TABLE Employee PURGE;
