Create table Friends (user1 int, user2 int);

ALTER TABLE Friends ADD PRIMARY KEY (user1, user2) DISABLE;

insert into Friends (user1, user2) values ('2', '1');
insert into Friends (user1, user2) values ('1', '3');
insert into Friends (user1, user2) values ('4', '1');
insert into Friends (user1, user2) values ('1', '5');
insert into Friends (user1, user2) values ('1', '6');
insert into Friends (user1, user2) values ('2', '6');
insert into Friends (user1, user2) values ('7', '2');
insert into Friends (user1, user2) values ('8', '3');
insert into Friends (user1, user2) values ('3', '9');


SELECT user1, ROUND(100*COUNT(user2)/ 
(SELECT COUNT(DISTINCT user1) FROM
(SELECT * FROM Friends UNION ALL
SELECT user2, user1 FROM Friends)),2)
AS percentage_popularity FROM
(SELECT * FROM Friends UNION ALL
SELECT user2, user1 FROM Friends)
GROUP BY user1 ORDER BY user1;

DROP TABLE Friends PURGE;
