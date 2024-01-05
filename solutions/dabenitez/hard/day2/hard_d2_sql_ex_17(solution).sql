Create table Student (student_id int, student_name varchar(30), CONSTRAINT Student_pk PRIMARY KEY (student_id));
Create table Exam (exam_id int, student_id int, score int,
CONSTRAINT fk_Exam FOREIGN KEY (student_id) REFERENCES Student(student_id));

ALTER TABLE Exam ADD PRIMARY KEY (exam_id, student_id) DISABLE;

insert into Student (student_id, student_name) values ('1', 'Daniel');
insert into Student (student_id, student_name) values ('2', 'Jade');
insert into Student (student_id, student_name) values ('3', 'Stella');
insert into Student (student_id, student_name) values ('4', 'Jonathan');
insert into Student (student_id, student_name) values ('5', 'Will');

insert into Exam (exam_id, student_id, score) values ('10', '1', '70');
insert into Exam (exam_id, student_id, score) values ('10', '2', '80');
insert into Exam (exam_id, student_id, score) values ('10', '3', '90');
insert into Exam (exam_id, student_id, score) values ('20', '1', '80');
insert into Exam (exam_id, student_id, score) values ('30', '1', '70');
insert into Exam (exam_id, student_id, score) values ('30', '3', '80');
insert into Exam (exam_id, student_id, score) values ('30', '4', '90');
insert into Exam (exam_id, student_id, score) values ('40', '1', '60');
insert into Exam (exam_id, student_id, score) values ('40', '2', '70');
insert into Exam (exam_id, student_id, score) values ('40', '4', '80');

SELECT s.student_id, s.student_name 
FROM Student s JOIN
(SELECT DISTINCT student_id FROM Exam MINUS
(SELECT DISTINCT student_id FROM
(SELECT exam_id, student_id, score,
RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS ranking,
COUNT(student_id) OVER (PARTITION BY exam_id) AS num
FROM Exam) WHERE ranking=1 OR ranking=num)) Q1
ON s.student_id=Q1.student_id;

DROP TABLE Exam PURGE;
DROP TABLE Student PURGE;
