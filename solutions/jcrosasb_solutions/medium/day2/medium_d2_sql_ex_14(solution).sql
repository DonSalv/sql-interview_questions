-- Create the follow table
Create table Follow (followee varchar(25), follower varchar(25));
    
-- Populate the follow table
Truncate table Follow;
insert into Follow (followee, follower) values ('Alice', 'Bob');
insert into Follow (followee, follower) values ('Bob', 'Cena');
insert into Follow (followee, follower) values ('Bob', 'Donald');
insert into Follow (followee, follower) values ('Donald', 'Edward');

-- A second-degree follower is a user who:
--      * follows at least one user, and
--      * is followed by at least one user.
-- Write a solution to report the second-degree users and the number of their followers.
-- Return the result table ordered by follower in alphabetical order
SELECT 
    followee AS follower, 
    COUNT(followee) AS num 
FROM 
    Follow 
WHERE 
    followee IN (SELECT 
                     follower
                     FROM 
                         Follow
                     INTERSECT
                     SELECT 
                         followee
                     FROM 
                         Follow)
GROUP BY 
    followee
ORDER BY
    followee;

-- Drop tables
DROP TABLE Follow;
