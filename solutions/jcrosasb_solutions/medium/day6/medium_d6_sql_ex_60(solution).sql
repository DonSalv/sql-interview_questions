-- Create the tables
Create table Contests (contest_id int, gold_medal int, silver_medal int, bronze_medal int);
Create table Users (user_id int, mail varchar(50), name varchar(30));

-- Populate the contests table    
Truncate table Contests;
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values (190, 1, 5, 2);
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values (191, 2, 3, 5);
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values (192, 5, 2, 3);
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values (193, 1, 3, 5);
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values (194, 4, 5, 2);
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values (195, 4, 2, 1);
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values (196, 1, 5, 2);

-- Populate the users table    
Truncate table Users;
insert into Users (user_id, mail, name) values (1, 'sarah@leetcode.com', 'Sarah');
insert into Users (user_id, mail, name) values (2, 'bob@leetcode.com', 'Bob');
insert into Users (user_id, mail, name) values (3, 'alice@leetcode.com', 'Alice');
insert into Users (user_id, mail, name) values (4, 'hercy@leetcode.com', 'Hercy');
insert into Users (user_id, mail, name) values (5, 'quarz@leetcode.com', 'Quarz');

-- Write a solution to report the name and the mail of all interview candidates. A user is an interview candidate if at least one of these two conditions is true:
--   * The user won any medal in three or more consecutive contests.
--   * The user won the gold medal in three or more different contests (not necessarily consecutive)
WITH all_medals AS (
    SELECT
        contest_id,
        gold_medal AS player_id
    FROM
        Contests
    UNION ALL
    SELECT
        contest_id,
        silver_medal AS player_id
    FROM
        Contests
    UNION ALL
    SELECT
        contest_id,
        bronze_medal AS player_id
    FROM
        Contests),
    three_golds AS (
    SELECT 
        u.name,
        COUNT(c.gold_medal) AS count_gold
    FROM
        Contests c
    INNER JOIN
        Users u
    ON
        u.user_id = c.gold_medal
    GROUP BY
        u.name
    HAVING 
        COUNT(c.gold_medal) >= 3)
SELECT
    name,
    mail
FROM
    (SELECT
        DISTINCT name
    FROM
        (SELECT
             a.contest_id,
             u.name,
             ROW_NUMBER() OVER (PARTITION BY u.name ORDER BY a.contest_id) - contest_id AS grp
         FROM
             all_medals a
         LEFT JOIN
             Users u
         ON
            a.player_id = u.user_id)
    GROUP BY
        name,
        grp
    HAVING
        COUNT(grp) >= 3
    UNION 
    SELECT name FROM three_golds) t
LEFT JOIN
    Users
USING
    (name);
    
-- Drop tables
DROP TABLE Contests;
DROP TABLE Users;
