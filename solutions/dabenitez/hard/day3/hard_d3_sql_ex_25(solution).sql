Create table Listens (user_id int, song_id int, day date);
Create table Friendship (user1_id int, user2_id int);

ALTER TABLE Friendship ADD PRIMARY KEY (user1_id, user2_id) DISABLE;

insert into Listens (user_id, song_id, day) values ('1', '10', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('1', '11', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('1', '12', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('2', '10', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('2', '11', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('2', '12', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('3', '10', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('3', '11', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('3', '12', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('4', '10', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('4', '11', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('4', '13', TO_DATE('2021-03-15','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('5', '10', TO_DATE('2021-03-16','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('5', '11', TO_DATE('2021-03-16','YYYY-MM-DD'));
insert into Listens (user_id, song_id, day) values ('5', '12', TO_DATE('2021-03-16','YYYY-MM-DD'));

insert into Friendship (user1_id, user2_id) values ('1', '2');
insert into Friendship (user1_id, user2_id) values ('2', '4');
insert into Friendship (user1_id, user2_id) values ('2', '5');

SELECT f.user1_id, f.user2_id FROM 
(SELECT user1_id, user2_id FROM
(SELECT l1.user_id AS user1_id, l2.user_id AS user2_id, l1.song_id, l1.day FROM Listens l1
JOIN Listens l2 ON l2.song_id = l1.song_id AND l1.day=l2.day
WHERE l1.user_id!=l2.user_id)
GROUP BY user1_id, user2_id, day
HAVING COUNT(song_id)>=3) Q1
JOIN Friendship f ON Q1.user1_id=f.user1_id AND Q1.user2_id=f.user2_id;

DROP TABLE Friendship PURGE;
DROP TABLE Listens PURGE;