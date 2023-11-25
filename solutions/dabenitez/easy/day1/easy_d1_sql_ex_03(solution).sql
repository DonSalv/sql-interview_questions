Create table Person (id int, email varchar(255), CONSTRAINT Person_pk PRIMARY KEY (id));

insert into Person (id, email) values ('1', 'a@b.com');
insert into Person (id, email) values ('2', 'c@d.com');
insert into Person (id, email) values ('3', 'a@b.com');

SELECT email FROM Person
GROUP BY email
HAVING COUNT(email)>1;

DROP TABLE Person PURGE;