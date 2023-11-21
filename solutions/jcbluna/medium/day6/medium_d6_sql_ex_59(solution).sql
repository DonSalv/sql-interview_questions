-- Create the tables
CREATE TABLE Players (player_id int, player_name varchar(20));
CREATE TABLE Championships (year int, Wimbledon int, Fr_open int, US_open int, Au_open int);

-- Populate the players table
TRUNCATE TABLE Players;
INSERT INTO Players (player_id, player_name) VALUES ('1', 'Nadal');
INSERT INTO Players (player_id, player_name) VALUES ('2', 'Federer');
INSERT INTO Players (player_id, player_name) VALUES ('3', 'Novak');
    
-- Populate the championships table
TRUNCATE TABLE Championships;
INSERT INTO Championships (year, Wimbledon, Fr_open, US_open, Au_open) VALUES ('2018', '1', '1', '1', '1');
INSERT INTO Championships (year, Wimbledon, Fr_open, US_open, Au_open) VALUES ('2019', '1', '1', '2', '2');
INSERT INTO Championships (year, Wimbledon, Fr_open, US_open, Au_open) VALUES ('2020', '2', '1', '2', '2');

-- Solve the exercise
SELECT c.player_id, player_name, COUNT(c.player_id) AS grand_slams_count
FROM Championships
UNPIVOT(
player_id
FOR championship
IN (
Wimbledon AS 'Wimbledon',
Fr_open AS 'Fr_open',
US_open AS 'US_open',
Au_open AS 'Au_open')
) c JOIN Players p
ON(c.player_id=p.player_id)
GROUP BY c.player_id, player_name;

-- Drop unused tables
DROP TABLE Players;
DROP TABLE Championships;