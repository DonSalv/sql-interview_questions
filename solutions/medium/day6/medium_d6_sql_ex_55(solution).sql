Create table Calls (from_id int, to_id int, duration int);

insert into Calls (from_id, to_id, duration) values ('1', '2', '59');
insert into Calls (from_id, to_id, duration) values ('2', '1', '11');
insert into Calls (from_id, to_id, duration) values ('1', '3', '20');
insert into Calls (from_id, to_id, duration) values ('3', '4', '100');
insert into Calls (from_id, to_id, duration) values ('3', '4', '200');
insert into Calls (from_id, to_id, duration) values ('3', '4', '200');
insert into Calls (from_id, to_id, duration) values ('4', '3', '499');

SELECT person1, person2, COUNT(*) AS call_count, SUM(duration) AS total_duration FROM
(SELECT from_id AS person1, to_id AS person2, duration FROM Calls
WHERE from_id <to_id
UNION ALL
SELECT to_id AS person1, from_id AS person2, duration FROM Calls
WHERE from_id>to_id)
GROUP BY person1, person2
ORDER BY person1, person2;

DROP TABLE Calls PURGE;