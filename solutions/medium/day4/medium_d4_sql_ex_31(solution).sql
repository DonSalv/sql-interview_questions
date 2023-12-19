Create table Queue (person_id int, person_name varchar(30), weight int, turn int, CONSTRAINT Queue_pk PRIMARY KEY (person_id));

insert into Queue (person_id, person_name, weight, turn) values ('5', 'Alice', '250', '1');
insert into Queue (person_id, person_name, weight, turn) values ('4', 'Bob', '175', '5');
insert into Queue (person_id, person_name, weight, turn) values ('3', 'Alex', '350', '2');
insert into Queue (person_id, person_name, weight, turn) values ('6', 'John Cena', '400', '3');
insert into Queue (person_id, person_name, weight, turn) values ('1', 'Winston', '500', '6');
insert into Queue (person_id, person_name, weight, turn) values ('2', 'Marie', '200', '4');

SELECT MAX(person_name) AS person_name FROM
(SELECT person_name,
SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
FROM Queue)
WHERE cumulative_weight <= 1000;

DROP TABLE Queue PURGE;