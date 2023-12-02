Create table NewYork (student_id int, score int, CONSTRAINT NewYork_pk PRIMARY KEY (student_id));
Create table California (student_id int, score int, CONSTRAINT California_pk PRIMARY KEY (student_id));

insert into NewYork (student_id, score) values ('1', '90');
insert into NewYork (student_id, score) values ('2', '87');

insert into California (student_id, score) values ('2', '89');
insert into California (student_id, score) values ('3', '88');

SELECT CASE 
WHEN (SELECT COUNT(*) FROM NewYork WHERE score >= 90) > (SELECT COUNT(*) FROM California WHERE score >= 90) THEN 'New York University'
WHEN (SELECT COUNT(*) FROM NewYork WHERE score >= 90) < (SELECT COUNT(*) FROM California WHERE score >= 90) THEN 'California University'
ELSE 'No Winner'
END AS winner FROM DUAL;

DROP TABLE California PURGE;
DROP TABLE NewYork PURGE;