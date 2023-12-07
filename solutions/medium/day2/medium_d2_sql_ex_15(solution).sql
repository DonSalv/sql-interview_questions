Create table Seat (id int, student varchar(255), CONSTRAINT Seat_pk PRIMARY KEY (id));

insert into Seat (id, student) values ('1', 'Abbot');
insert into Seat (id, student) values ('2', 'Doris');
insert into Seat (id, student) values ('3', 'Emerson');
insert into Seat (id, student) values ('4', 'Green');
insert into Seat (id, student) values ('5', 'Jeames');

SELECT id, CASE
WHEN MOD(id, 2) = 0 THEN LAG(student) OVER (ORDER BY id)
WHEN MOD(id, 2) = 1 AND id <> (SELECT MAX(id) FROM Seat) THEN LEAD(student) OVER (ORDER BY id)
ELSE student END AS student
FROM Seat ORDER BY id;

DROP TABLE Seat PURGE;