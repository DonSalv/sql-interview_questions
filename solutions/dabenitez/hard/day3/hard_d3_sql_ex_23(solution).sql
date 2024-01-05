Create table Friendship (user1_id int, user2_id int);
Create table Likes (user_id int, page_id int);

ALTER TABLE Friendship ADD PRIMARY KEY (user1_id, user2_id) DISABLE;
ALTER TABLE Likes ADD PRIMARY KEY (user_id, page_id) DISABLE;

insert into Friendship (user1_id, user2_id) values ('1', '2');
insert into Friendship (user1_id, user2_id) values ('1', '3');
insert into Friendship (user1_id, user2_id) values ('1', '4');
insert into Friendship (user1_id, user2_id) values ('2', '3');
insert into Friendship (user1_id, user2_id) values ('2', '4');
insert into Friendship (user1_id, user2_id) values ('2', '5');
insert into Friendship (user1_id, user2_id) values ('6', '1');

insert into Likes (user_id, page_id) values ('1', '88');
insert into Likes (user_id, page_id) values ('2', '23');
insert into Likes (user_id, page_id) values ('3', '24');
insert into Likes (user_id, page_id) values ('4', '56');
insert into Likes (user_id, page_id) values ('5', '11');
insert into Likes (user_id, page_id) values ('6', '33');
insert into Likes (user_id, page_id) values ('2', '77');
insert into Likes (user_id, page_id) values ('3', '77');
insert into Likes (user_id, page_id) values ('6', '88');

SELECT user1_id AS user_id, page2 AS page_id, COUNT(user2_id) AS friends_likes FROM
(SELECT DISTINCT Q2.user1_id, q2.user2_id, q2.page2 FROM
(SELECT q1.user1_id, l2.page_id AS page1, q1.user2_id, l1.page_id AS page2 FROM
(SELECT user1_id, user2_id FROM Friendship UNION ALL
SELECT user2_id AS user1_id, user1_id AS user2_id FROM Friendship) Q1
JOIN Likes l1 ON Q1.user2_id=l1.user_id 
JOIN Likes l2 ON q1.user1_id=l2.user_id
WHERE l2.page_id != l1.page_id) Q2
LEFT JOIN Likes l ON Q2.user1_id=l.user_id AND Q2.page2=l.page_id
WHERE l.user_id IS NULL)
GROUP BY user1_id, page2 ORDER BY user1_id;

DROP TABLE Likes PURGE;
DROP TABLE Friendship PURGE;