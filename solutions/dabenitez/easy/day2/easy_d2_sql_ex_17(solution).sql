Create table cinema (id int, movie varchar(255), description varchar(255), rating number(3, 1), CONSTRAINT cinema_pk PRIMARY KEY (id));

insert into cinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into cinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into cinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into cinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

SELECT id, movie, description, rating FROM cinema
WHERE description <> 'boring' and MOD(id,2)=1
ORDER BY rating DESC;

DROP TABLE cinema PURGE;