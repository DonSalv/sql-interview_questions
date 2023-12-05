Create table Department (dept_id int, dept_name varchar(255), CONSTRAINT Department_pk PRIMARY KEY (dept_id));
Create table Student (student_id int,student_name varchar(45), gender varchar(6), dept_id int, CONSTRAINT Student_pk PRIMARY KEY (student_id),
CONSTRAINT fk_Student FOREIGN KEY (dept_id) REFERENCES Department(dept_id));

insert into Department (dept_id, dept_name) values ('1', 'Engineering');
insert into Department (dept_id, dept_name) values ('2', 'Science');
insert into Department (dept_id, dept_name) values ('3', 'Law');

insert into Student (student_id, student_name, gender, dept_id) values ('1', 'Jack', 'M', '1');
insert into Student (student_id, student_name, gender, dept_id) values ('2', 'Jane', 'F', '1');
insert into Student (student_id, student_name, gender, dept_id) values ('3', 'Mark', 'M', '2');

SELECT d.dept_name, COUNT(s.student_name) AS student_number FROM Department d
LEFT JOIN Student s
ON s.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY student_number DESC;

DROP TABLE Student PURGE;
DROP TABLE Department PURGE;