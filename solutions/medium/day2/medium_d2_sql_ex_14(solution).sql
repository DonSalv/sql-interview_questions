Create table Follow (followee varchar(255), follower varchar(255));

ALTER TABLE Follow ADD PRIMARY KEY (followee, follower) DISABLE;

insert into Follow (followee, follower) values ('Alice', 'Bob');
insert into Follow (followee, follower) values ('Bob', 'Cena');
insert into Follow (followee, follower) values ('Bob', 'Donald');
insert into Follow (followee, follower) values ('Donald', 'Edward');

SELECT follower, COUNT(*) AS num FROM
(SELECT f1.follower AS follower_1, f1.followee AS follower, f2.followee 
FROM Follow f1 JOIN Follow f2
ON f1.followee= f2.follower)
GROUP BY follower
ORDER BY follower;

DROP TABLE Follow PURGE;