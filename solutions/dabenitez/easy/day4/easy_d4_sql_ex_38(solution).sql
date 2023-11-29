Create table Students (student_id int, student_name varchar(20), CONSTRAINT Students_pk PRIMARY KEY (student_id));
Create table Subjects (subject_name varchar(20),CONSTRAINT Subjects_pk PRIMARY KEY (subject_name));
Create table Examinations (student_id int, subject_name varchar(20),
CONSTRAINT fk_Students FOREIGN KEY (student_id) REFERENCES Students(student_id),
CONSTRAINT fk_Subjects FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name));

insert into Students (student_id, student_name) values ('1', 'Alice');
insert into Students (student_id, student_name) values ('2', 'Bob');
insert into Students (student_id, student_name) values ('13', 'John');
insert into Students (student_id, student_name) values ('6', 'Alex');

insert into Subjects (subject_name) values ('Math');
insert into Subjects (subject_name) values ('Physics');
insert into Subjects (subject_name) values ('Programming');

insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Programming');
insert into Examinations (student_id, subject_name) values ('2', 'Programming');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Programming');
insert into Examinations (student_id, subject_name) values ('13', 'Physics');
insert into Examinations (student_id, subject_name) values ('2', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Math');

SELECT * FROM Students CROSS JOIN Subjects ORDER BY Student_id, subject_name;

SELECT st.student_id, st.student_name, sb.subject_name,
COALESCE(COUNT(e.subject_name), 0) AS attended_exams
FROM Students st CROSS JOIN Subjects sb
LEFT JOIN Examinations e ON st.student_id = e.student_id AND sb.subject_name = e.subject_name
GROUP BY st.student_id, st.student_name, sb.subject_name
ORDER BY st.student_id, sb.subject_name;

DROP TABLE Examinations PURGE;
DROP TABLE Subjects PURGE;
DROP TABLE Students PURGE;
