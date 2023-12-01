Create table Users (user_id int, name varchar(40), CONSTRAINT Users_pk PRIMARY KEY (user_id));

insert into Users (user_id, name) values ('1', 'aLice');
insert into Users (user_id, name) values ('2', 'bOB');

SELECT user_id, INITCAP(name) AS name
FROM Users ORDER BY user_id;

DROP TABLE Users PURGE;