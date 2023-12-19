Create table Person (id int, name varchar(15), phone_number varchar(11), CONSTRAINT Person_pk PRIMARY KEY (id));
Create table Country (name varchar(15), country_code varchar(3), CONSTRAINT Country_pk PRIMARY KEY (country_code));
Create table Calls (caller_id int, callee_id int, duration int,
CONSTRAINT fk_caller FOREIGN KEY (caller_id) REFERENCES Person(id),
CONSTRAINT fk_callee FOREIGN KEY (callee_id) REFERENCES Person(id));

insert into Person (id, name, phone_number) values ('3', 'Jonathan', '051-1234567');
insert into Person (id, name, phone_number) values ('12', 'Elvis', '051-7654321');
insert into Person (id, name, phone_number) values ('1', 'Moncef', '212-1234567');
insert into Person (id, name, phone_number) values ('2', 'Maroua', '212-6523651');
insert into Person (id, name, phone_number) values ('7', 'Meir', '972-1234567');
insert into Person (id, name, phone_number) values ('9', 'Rachel', '972-0011100');

insert into Country (name, country_code) values ('Peru', '051');
insert into Country (name, country_code) values ('Israel', '972');
insert into Country (name, country_code) values ('Morocco', '212');
insert into Country (name, country_code) values ('Germany', '049');
insert into Country (name, country_code) values ('Ethiopia', '251');

insert into Calls (caller_id, callee_id, duration) values ('1', '9', '33');
insert into Calls (caller_id, callee_id, duration) values ('2', '9', '4');
insert into Calls (caller_id, callee_id, duration) values ('1', '2', '59');
insert into Calls (caller_id, callee_id, duration) values ('3', '12', '102');
insert into Calls (caller_id, callee_id, duration) values ('3', '12', '330');
insert into Calls (caller_id, callee_id, duration) values ('12', '3', '5');
insert into Calls (caller_id, callee_id, duration) values ('7', '9', '13');
insert into Calls (caller_id, callee_id, duration) values ('7', '1', '3');
insert into Calls (caller_id, callee_id, duration) values ('9', '7', '1');
insert into Calls (caller_id, callee_id, duration) values ('1', '7', '7');

SELECT country FROM
(SELECT country, sum(duration)/sum(num) AS average FROM
(SELECT c.name AS country, COUNT(*) AS num, SUM(duration) AS duration FROM
Calls cl JOIN Person p ON cl.caller_id = p.id JOIN Country c 
ON SUBSTR(p.phone_number, 1, 3) = c.country_code GROUP BY c.name
UNION ALL
SELECT c.name AS country, COUNT(*) AS num, SUM(duration) AS duration FROM
Calls cl JOIN Person p ON cl.callee_id = p.id JOIN Country c 
ON SUBSTR(p.phone_number, 1, 3) = c.country_code GROUP BY c.name)
GROUP BY country)
WHERE average> (SELECT sum(duration)/count(*) FROM Calls);

DROP TABLE Calls PURGE;
DROP TABLE Country PURGE;
DROP TABLE Person PURGE;