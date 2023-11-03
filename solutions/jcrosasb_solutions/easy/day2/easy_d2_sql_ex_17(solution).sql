-- Create the cinema table
Create table cinema (id int, movie varchar(255), description varchar(255), rating float);
    
-- Populate the cinema table
Truncate table cinema;
insert into cinema (id, movie, description, rating) values (1, 'War', 'great 3D', 8.9);
insert into cinema (id, movie, description, rating) values (2, 'Science', 'fiction', 8.5);
insert into cinema (id, movie, description, rating) values (3, 'irish', 'boring', 6.2);
insert into cinema (id, movie, description, rating) values (4, 'Ice song', 'Fantacy', 8.6);
insert into cinema (id, movie, description, rating) values (5, 'House card', 'Interesting', 9.1);

-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
-- Return the result table ordered by rating in descending order.
SELECT 
    * 
FROM cinema 
WHERE MOD(id, 2) != 0 AND description != 'boring' 
ORDER BY id DESC;

-- Drop tables
DROP TABLE cinema;
