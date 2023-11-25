Create table Person (personId int, firstName varchar(255), lastName varchar(255), CONSTRAINT Person_pk PRIMARY KEY (personId));
Create table Address (addressId int, personId int, city varchar(255), state varchar(255), CONSTRAINT Address_pk PRIMARY KEY (addressId));

insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob');

insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');

SELECT p.firstName, p.LastName, a.city, a.state
FROM Person p LEFT JOIN Address a
ON p.personid = a.personid;

DROP TABLE Person PURGE;
DROP TABLE Address PURGE;