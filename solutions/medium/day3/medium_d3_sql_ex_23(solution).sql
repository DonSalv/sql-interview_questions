Create table Enrollments (student_id int, course_id int, grade int not null);

ALTER TABLE Enrollments ADD PRIMARY KEY (student_id, course_id) DISABLE;

insert into Enrollments (student_id, course_id, grade) values ('2', '2', '95');
insert into Enrollments (student_id, course_id, grade) values ('2', '3', '95');
insert into Enrollments (student_id, course_id, grade) values ('1', '1', '90');
insert into Enrollments (student_id, course_id, grade) values ('1', '2', '99');
insert into Enrollments (student_id, course_id, grade) values ('3', '1', '80');
insert into Enrollments (student_id, course_id, grade) values ('3', '2', '75');
insert into Enrollments (student_id, course_id, grade) values ('3', '3', '82');

SELECT Q1.student_id, e.course_id, Q1.grade FROM 
(SELECT student_id, MAX(grade) AS grade FROM Enrollments
GROUP BY student_id) Q1
JOIN Enrollments e
ON e.student_id=q1.student_id AND e.grade=q1.grade;

SELECT student_id, course_id, grade FROM
(SELECT student_id, course_id, grade,
RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS ranking
FROM Enrollments)
WHERE ranking = 1
ORDER BY student_id;

DROP TABLE Enrollments PURGE;