-- Create the tables
CREATE TABLE Movies (movie_id int, title varchar(30));
CREATE TABLE Users (user_id int, name varchar(30));
CREATE TABLE MovieRating (movie_id int, user_id int, rating int, created_at date);

-- Populate the movies table
TRUNCATE TABLE Movies;
INSERT INTO Movies (movie_id, title) VALUES ('1', 'Avengers');
INSERT INTO Movies (movie_id, title) VALUES ('2', 'Frozen 2');
INSERT INTO Movies (movie_id, title) VALUES ('3', 'Joker');
    
-- Populate the users table
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, name) VALUES ('1', 'Daniel');
INSERT INTO Users (user_id, name) VALUES ('2', 'Monica');
INSERT INTO Users (user_id, name) VALUES ('3', 'Maria');
INSERT INTO Users (user_id, name) VALUES ('4', 'James');
    
-- Populate the movierating
TRUNCATE TABLE MovieRating;
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('1', '1', '3', TO_DATE('2020-01-12','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('1', '2', '4', TO_DATE('2020-02-11','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('1', '3', '2', TO_DATE('2020-02-12','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('1', '4', '1', TO_DATE('2020-01-01','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('2', '1', '5', TO_DATE('2020-02-17','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('2', '2', '2', TO_DATE('2020-02-01','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('2', '3', '2', TO_DATE('2020-03-01','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('3', '1', '3', TO_DATE('2020-02-22','%YYYY-%MM-%DD'));
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES ('3', '2', '4', TO_DATE('2020-02-25','%YYYY-%MM-%DD'));

-- Solve the exercise
WITH top_rater AS(
-- 1. Get the name of users ordered by the number of rates
-- they did
SELECT name AS results
FROM MovieRating JOIN Users
USING(user_id)
GROUP BY name
ORDER BY COUNT(rating) DESC, name ASC),
top_movie AS (
-- 2. Get the title of movies ordered by their average rating
-- in February 2020.
SELECT title AS results
FROM MovieRating JOIN Movies
USING(movie_id)
WHERE EXTRACT(MONTH FROM created_at)=2
AND EXTRACT(YEAR FROM created_at)=2020
GROUP BY title
ORDER BY AVG(rating) DESC, title ASC)
-- 3. Get the first row of both tables and union them
SELECT results FROM top_rater WHERE ROWNUM=1
UNION ALL
SELECT results FROM top_movie WHERE ROWNUM=1;

-- Drop unused tables
DROP TABLE Movies;
DROP TABLE Users;
DROP TABLE MovieRating;