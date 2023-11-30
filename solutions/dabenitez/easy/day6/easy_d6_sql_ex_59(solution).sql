Create table SchoolA (student_id int, student_name varchar(20), CONSTRAINT SchoolA_pk PRIMARY KEY (student_id));
Create table SchoolB (student_id int, student_name varchar(20), CONSTRAINT SchoolB_pk PRIMARY KEY (student_id));
Create table SchoolC (student_id int, student_name varchar(20), CONSTRAINT SchoolC_pk PRIMARY KEY (student_id));

insert into SchoolA (student_id, student_name) values ('1', 'Alice');
insert into SchoolA (student_id, student_name) values ('2', 'Bob');

insert into SchoolB (student_id, student_name) values ('3', 'Tom');

insert into SchoolC (student_id, student_name) values ('3', 'Tom');
insert into SchoolC (student_id, student_name) values ('2', 'Jerry');
insert into SchoolC (student_id, student_name) values ('10', 'Alice');

SELECT SA.student_name AS member_A, SB.student_name AS member_B, SC.student_name AS member_C
FROM SCHOOLA SA
JOIN SCHOOLB SB ON SA.student_id <> SB.student_id AND SA.student_name <> SB.student_name
JOIN SCHOOLC SC ON SA.student_id <> SC.student_id AND SB.student_id <> SC.student_id
AND SA.student_name <> SC.student_name AND SB.student_name <> SC.student_name;

DROP TABLE SchoolA PURGE;
DROP TABLE SchoolB PURGE;
DROP TABLE SchoolC PURGE;