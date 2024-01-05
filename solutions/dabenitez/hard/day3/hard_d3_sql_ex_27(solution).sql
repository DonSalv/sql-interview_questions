Create table Candidates (employee_id int, experience VARCHAR2(10), salary int, CONSTRAINT Candidates_pk PRIMARY KEY (employee_id),
CONSTRAINT experience_check CHECK (experience IN ('Senior', 'Junior')));

insert into Candidates (employee_id, experience, salary) values ('1', 'Junior', '10000');
insert into Candidates (employee_id, experience, salary) values ('9', 'Junior', '10000');
insert into Candidates (employee_id, experience, salary) values ('2', 'Senior', '20000');
insert into Candidates (employee_id, experience, salary) values ('11', 'Senior', '20000');
insert into Candidates (employee_id, experience, salary) values ('13', 'Senior', '50000');
insert into Candidates (employee_id, experience, salary) values ('4', 'Junior', '40000');

SELECT experience, COUNT(employee_id) As accepted_candidates FROM
(SELECT * FROM (SELECT employee_id, experience, salary,
SUM(salary) OVER (PARTITION BY experience ORDER BY salary, employee_id) AS sum_salary FROM Candidates)
WHERE experience='Senior' AND sum_salary<=70000
UNION
SELECT * FROM (SELECT employee_id, experience, salary,
SUM(salary) OVER (PARTITION BY experience ORDER BY salary, employee_id) AS sum_salary FROM Candidates)
WHERE experience='Junior' AND sum_salary<=
(SELECT MAX(sum_salary) FROM
(SELECT * FROM (SELECT employee_id, experience, salary,
SUM(salary) OVER (PARTITION BY experience ORDER BY salary, employee_id) AS sum_salary FROM Candidates)
WHERE experience='Senior' AND sum_salary<=70000)))
GROUP BY experience;

DROP TABLE Candidates PURGE;