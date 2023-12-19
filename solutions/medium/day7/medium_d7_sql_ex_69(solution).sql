Create table Relations (user_id int, follower_id int);

ALTER TABLE Relations ADD PRIMARY KEY (user_id, follower_id) DISABLE;

insert into Relations (user_id, follower_id) values ('1', '3');
insert into Relations (user_id, follower_id) values ('2', '3');
insert into Relations (user_id, follower_id) values ('7', '3');
insert into Relations (user_id, follower_id) values ('1', '4');
insert into Relations (user_id, follower_id) values ('2', '4');
insert into Relations (user_id, follower_id) values ('7', '4');
insert into Relations (user_id, follower_id) values ('1', '5');
insert into Relations (user_id, follower_id) values ('2', '6');
insert into Relations (user_id, follower_id) values ('7', '5');

SELECT user1_id, user2_id FROM
(SELECT r1.user_id AS user1_id, r2.user_id AS user2_id,
COUNT(r1.follower_id) AS common,
RANK() OVER (ORDER BY COUNT(r1.follower_id) DESC) as ranking
FROM Relations r1 JOIN Relations r2 
ON r1.follower_id = r2.follower_id AND r1.user_id < r2.user_id
GROUP BY r1.user_id, r2.user_id)
WHERE ranking=1;

DROP TABLE Relations PURGE;