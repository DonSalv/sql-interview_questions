Create table Schools (school_id int, capacity int, CONSTRAINT Schools_pk PRIMARY KEY (school_id));
Create table Exam (score int, student_count int, CONSTRAINT Exam_pk PRIMARY KEY (score));

insert into Schools (school_id, capacity) values ('11', '151');
insert into Schools (school_id, capacity) values ('5', '48');
insert into Schools (school_id, capacity) values ('9', '9');
insert into Schools (school_id, capacity) values ('10', '99');

insert into Exam (score, student_count) values ('975', '10');
insert into Exam (score, student_count) values ('966', '60');
insert into Exam (score, student_count) values ('844', '76');
insert into Exam (score, student_count) values ('749', '76');
insert into Exam (score, student_count) values ('744', '100');

SELECT s.school_id, COALESCE(MIN(e.score),-1) AS score
FROM Schools s LEFT JOIN Exam e
ON e.student_count< s.capacity
GROUP BY s.school_id ORDER BY s.school_id;

DROP TABLE Exam PURGE;
DROP TABLE Schools PURGE;