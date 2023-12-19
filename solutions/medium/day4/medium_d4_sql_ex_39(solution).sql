Create table Movies (movie_id int, title varchar(30), CONSTRAINT Movies_pk PRIMARY KEY (movie_id));
Create table Users (user_id int, name varchar(30), CONSTRAINT Users_pk PRIMARY KEY (user_id));
Create table MovieRating (movie_id int, user_id int, rating int, created_at date,
CONSTRAINT fk_movies FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES Users(user_id));

ALTER TABLE MovieRating ADD PRIMARY KEY (movie_id, user_id) DISABLE;

insert into Movies (movie_id, title) values ('1', 'Avengers');
insert into Movies (movie_id, title) values ('2', 'Frozen 2');
insert into Movies (movie_id, title) values ('3', 'Joker');

insert into Users (user_id, name) values ('1', 'Daniel');
insert into Users (user_id, name) values ('2', 'Monica');
insert into Users (user_id, name) values ('3', 'Maria');
insert into Users (user_id, name) values ('4', 'James');

insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '1', '3', TO_DATE('2020-01-12','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '2', '4', TO_DATE('2020-02-11','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '3', '2', TO_DATE('2020-02-12','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '4', '1', TO_DATE('2020-01-01','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('2', '1', '5', TO_DATE('2020-02-17','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('2', '2', '2', TO_DATE('2020-02-01','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('2', '3', '2', TO_DATE('2020-03-01','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('3', '1', '3', TO_DATE('2020-02-22','YYYY-MM-DD'));
insert into MovieRating (movie_id, user_id, rating, created_at) values ('3', '2', '4', TO_DATE('2020-02-25','YYYY-MM-DD'));

(SELECT u.name AS results FROM Users u JOIN
(SELECT user_id, COUNT(user_id) AS num FROM MovieRating
GROUP BY user_id) Q1
ON u.user_id=Q1.user_id
ORDER BY Q1.num DESC, u.name
FETCH FIRST 1 ROWS ONLY)
UNION
(SELECT m.title AS results FROM Movies m JOIN
(SELECT movie_id, AVG(rating) AS rating FROM MovieRating
WHERE EXTRACT(MONTH FROM created_at)=2 AND EXTRACT(YEAR FROM created_at)=2020
GROUP BY movie_id) Q1
ON m.movie_id=q1.movie_id
ORDER BY Q1.rating DESC, m.title
FETCH FIRST 1 ROWS ONLY);

DROP TABLE MovieRating PURGE;
DROP TABLE Users PURGE;
DROP TABLE Movies PURGE;