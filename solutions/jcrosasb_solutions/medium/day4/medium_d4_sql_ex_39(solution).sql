-- Create the tables
Create table Movies (movie_id int, title varchar(30));
Create table Users (user_id int, name varchar(30));
Create table MovieRating (movie_id int, user_id int, rating int, created_at date);

-- Populate the movies table
Truncate table Movies;
insert into Movies (movie_id, title) values (1, 'Avengers');
insert into Movies (movie_id, title) values (2, 'Frozen 2');
insert into Movies (movie_id, title) values (3, 'Joker');
    
-- Populate the users table
Truncate table Users;
insert into Users (user_id, name) values (1, 'Daniel');
insert into Users (user_id, name) values (2, 'Monica');
insert into Users (user_id, name) values (3, 'Maria');
insert into Users (user_id, name) values (4, 'James');
    
-- Populate the movierating
Truncate table MovieRating;
insert into MovieRating (movie_id, user_id, rating, created_at) values (1, 1, 3, DATE '2020-01-12');
insert into MovieRating (movie_id, user_id, rating, created_at) values (1, 2, 4, DATE '2020-02-11');
insert into MovieRating (movie_id, user_id, rating, created_at) values (1, 3, 2, DATE '2020-02-12');
insert into MovieRating (movie_id, user_id, rating, created_at) values (1, 4, 1, DATE '2020-01-01');
insert into MovieRating (movie_id, user_id, rating, created_at) values (2, 1, 5, DATE '2020-02-17');
insert into MovieRating (movie_id, user_id, rating, created_at) values (2, 2, 2, DATE '2020-02-01');
insert into MovieRating (movie_id, user_id, rating, created_at) values (2, 3, 2, DATE '2020-03-01');
insert into MovieRating (movie_id, user_id, rating, created_at) values (3, 1, 3, DATE '2020-02-22');
insert into MovieRating (movie_id, user_id, rating, created_at) values (3, 2, 4, DATE '2020-02-25');

-- Write a solution to:
--      * Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
--      * Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
(SELECT 
      name AS results
 FROM 
      MovieRating
 INNER JOIN 
      Users 
 USING 
      (user_id)
 GROUP BY 
      name
 ORDER BY 
      COUNT(rating) DESC, 
      name
 FETCH FIRST 1 ROW ONLY)
UNION
(SELECT 
      title AS results
 FROM
      Movies
 INNER JOIN
      MovieRating
 USING
      (movie_id)
 WHERE
      TO_CHAR(created_at, 'YYYY-MM') = '2020-02'
 GROUP BY
      title
 ORDER BY
      AVG(rating) DESC,
      title
 FETCH FIRST 1 ROW ONLY);

-- Drop tables
DROP TABLE Movies;
DROP TABLE Users;
DROP TABLE MovieRating;
