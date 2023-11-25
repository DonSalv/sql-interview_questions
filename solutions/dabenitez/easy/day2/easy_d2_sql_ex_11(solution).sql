Create table Courses (student varchar(255), class varchar(255));

ALTER TABLE Courses 
    ADD PRIMARY KEY (student, class) DISABLE;

insert into Courses (student, class) values ('A', 'Math');
insert into Courses (student, class) values ('B', 'English');
insert into Courses (student, class) values ('C', 'Math');
insert into Courses (student, class) values ('D', 'Biology');
insert into Courses (student, class) values ('E', 'Math');
insert into Courses (student, class) values ('F', 'Computer');
insert into Courses (student, class) values ('G', 'Math');
insert into Courses (student, class) values ('H', 'Math');
insert into Courses (student, class) values ('I', 'Math');

SELECT class FROM
(SELECT class, COUNT(class) AS NUMBER_STUDENTS
FROM Courses GROUP BY class)
WHERE NUMBER_STUDENTS>=5;

DROP TABLE Courses PURGE;