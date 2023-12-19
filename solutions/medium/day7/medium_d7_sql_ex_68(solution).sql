Create table Friendship (user1_id int, user2_id int);

ALTER TABLE Friendship ADD PRIMARY KEY (user1_id, user2_id) DISABLE;

insert into Friendship (user1_id, user2_id) values ('1', '2');
insert into Friendship (user1_id, user2_id) values ('1', '3');
insert into Friendship (user1_id, user2_id) values ('2', '3');
insert into Friendship (user1_id, user2_id) values ('1', '4');
insert into Friendship (user1_id, user2_id) values ('2', '4');
insert into Friendship (user1_id, user2_id) values ('1', '5');
insert into Friendship (user1_id, user2_id) values ('2', '5');
insert into Friendship (user1_id, user2_id) values ('1', '7');
insert into Friendship (user1_id, user2_id) values ('3', '7');
insert into Friendship (user1_id, user2_id) values ('1', '6');
insert into Friendship (user1_id, user2_id) values ('3', '6');
insert into Friendship (user1_id, user2_id) values ('2', '6');


SELECT user1_id, user2_id, common_friend FROM
(SELECT Q1.user1_id AS user1_id, Q2.user1_id AS user2_id,
COUNT(Q1.user2_id) AS common_friend FROM 
(SELECT user1_id, user2_id FROM Friendship UNION
SELECT user2_id AS user1_id, user1_id AS user2_id FROM Friendship) Q1 JOIN 
(SELECT user1_id, user2_id FROM Friendship UNION
SELECT user2_id AS user1_id, user1_id AS user2_id FROM Friendship) Q2 
ON Q1.user2_id = Q2.user2_id AND Q1.user1_id < Q2.user1_id
GROUP BY Q1.user1_id, Q2.user1_id)
WHERE common_friend>=3;

DROP TABLE Friendship PURGE;