Create table Person (person_id int, name varchar(30), profession VARCHAR2(10), CONSTRAINT Person_pk PRIMARY KEY (person_id),
CONSTRAINT profession_check CHECK (profession IN ('Doctor','Singer','Actor','Player','Engineer','Lawyer')));

insert into Person (person_id, name, profession) values ('1', 'Alex', 'Singer');
insert into Person (person_id, name, profession) values ('3', 'Alice', 'Actor');
insert into Person (person_id, name, profession) values ('2', 'Bob', 'Player');
insert into Person (person_id, name, profession) values ('4', 'Messi', 'Doctor');
insert into Person (person_id, name, profession) values ('6', 'Tyson', 'Engineer');
insert into Person (person_id, name, profession) values ('5', 'Meir', 'Lawyer');

SELECT person_id, name || '(' || SUBSTR(profession, 1, 1) || ')' AS name
FROM Person ORDER BY person_id DESC;

DROP TABLE Person PURGE;