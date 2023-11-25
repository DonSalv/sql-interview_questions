Create table Person (Id int, Email varchar(255), CONSTRAINT Person_pk PRIMARY KEY (Id));

insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');

DELETE FROM Person p1
WHERE ROWID > (SELECT MIN(ROWID) FROM Person p2 
WHERE p1.email=p2.email);

SELECT * FROM Person;

DROP TABLE Person PURGE;