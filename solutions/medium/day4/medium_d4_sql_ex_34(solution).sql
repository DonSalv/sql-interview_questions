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

SELECT DISTINCT page_id AS recommended_page FROM 
((SELECT l.user_id, l.page_id FROM Friendship f
JOIN Likes l ON f.user2_id = l.user_id
WHERE f.user1_id = 1 AND l.page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1))
UNION
(SELECT l.user_id, l.page_id FROM Friendship f
JOIN Likes l ON f.user1_id = l.user_id
WHERE f.user2_id = 1 AND l.page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1)));

DROP TABLE Likes PURGE;
DROP TABLE Friendship PURGE;