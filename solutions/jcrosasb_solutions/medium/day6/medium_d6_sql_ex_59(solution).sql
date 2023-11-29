-- Create the tables
Create table Players (player_id int, player_name varchar(20));
Create table Championships (year int, Wimbledon int, Fr_open int, US_open int, Au_open int);

-- Populate the players table
Truncate table Players;
insert into Players (player_id, player_name) values (1, 'Nadal');
insert into Players (player_id, player_name) values (2, 'Federer');
insert into Players (player_id, player_name) values (3, 'Novak');
    
-- Populate the championships table
Truncate table Championships;
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values (2018, 1, 1, 1, 1);
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values (2019, 1, 1, 2, 2);
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values (2020, 2, 1, 2, 2);

-- Write a solution to report the number of grand slam tournaments won by each player.
-- Do not include the players who did not win any tournament
SELECT
    t.player_id,
    p.player_name,
    COUNT(t.player_id) AS grand_slams_count
FROM
    (SELECT Wimbledon AS player_id FROM Championships
     UNION ALL
     SELECT Fr_open FROM Championships
     UNION ALL
     SELECT US_open FROM Championships
     UNION ALL
     SELECT Au_open FROM Championships) t
INNER JOIN
    Players p
ON
    p.player_id = t.player_id
GROUP BY
    t.player_id,
    p.player_name;
 
-- Drop tables
DROP TABLE Players;
DROP TABLE Championships;
