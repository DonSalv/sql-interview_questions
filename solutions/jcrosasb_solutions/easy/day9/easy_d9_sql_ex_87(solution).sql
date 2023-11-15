-- Create the teams table
Create table Teams (team_name varchar(50));
    
-- Populate the teams table
Truncate table Teams;
insert into Teams (team_name) values ('Leetcode FC');
insert into Teams (team_name) values ('Ahly SC');
insert into Teams (team_name) values ('Real Madrid');

-- Write a solution to report all the possible matches of the league. 
-- Note that every two teams play two matches with each other, with one team being the home_team once and the other time being the away_team
SELECT 
    t1.team_name home_team, 
    t2.team_name away_team 
FROM Teams t1 
CROSS JOIN Teams t2
WHERE t1.team_name <> t2.team_name;

-- Drop tables
DROP TABLE Teams;
