Create table Users (user_id int, user_name varchar(20), CONSTRAINT Users_pk PRIMARY KEY (user_id));
Create table Register (contest_id int, user_id int,
CONSTRAINT fk_Register FOREIGN KEY (user_id) REFERENCES Users(user_id));

ALTER TABLE Register ADD PRIMARY KEY (contest_id, user_id) DISABLE;

insert into Users (user_id, user_name) values ('6', 'Alice');
insert into Users (user_id, user_name) values ('2', 'Bob');
insert into Users (user_id, user_name) values ('7', 'Alex');

insert into Register (contest_id, user_id) values ('215', '6');
insert into Register (contest_id, user_id) values ('209', '2');
insert into Register (contest_id, user_id) values ('208', '2');
insert into Register (contest_id, user_id) values ('210', '6');
insert into Register (contest_id, user_id) values ('208', '6');
insert into Register (contest_id, user_id) values ('209', '7');
insert into Register (contest_id, user_id) values ('209', '6');
insert into Register (contest_id, user_id) values ('215', '7');
insert into Register (contest_id, user_id) values ('208', '7');
insert into Register (contest_id, user_id) values ('210', '2');
insert into Register (contest_id, user_id) values ('207', '2');
insert into Register (contest_id, user_id) values ('210', '7');

SELECT contest_id, ROUND(100*COUNT(user_id) / (Select COUNT(DISTINCT user_id) FROM Users),2) AS percentage
FROM Register GROUP BY contest_id
ORDER BY percentage DESC, contest_id;

DROP TABLE Register PURGE;
DROP TABLE Users PURGE;