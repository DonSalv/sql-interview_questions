-- Create the tables
Create table TeamPoints (team_id int, name varchar(20), points int);
Create table PointsChange (team_id int, points_change int);

-- Populate the teampoints    
Truncate table TeamPoints;
insert into TeamPoints (team_id, name, points) values ('3', 'Algeria', '1431');
insert into TeamPoints (team_id, name, points) values ('1', 'Senegal', '2132');
insert into TeamPoints (team_id, name, points) values ('2', 'New Zealand', '1402');
insert into TeamPoints (team_id, name, points) values ('4', 'Croatia', '1817');

-- Populate the pointschange    
Truncate table PointsChange;
insert into PointsChange (team_id, points_change) values ('3', '399');
insert into PointsChange (team_id, points_change) values ('2', '0');
insert into PointsChange (team_id, points_change) values ('4', '13');
insert into PointsChange (team_id, points_change) values ('1', '-22');

-- The global ranking of a national team is its rank after sorting all the teams by their points in descending order. 
-- If two teams have the same points, we break the tie by sorting them by their name in lexicographical order.
-- The points of each national team should be updated based on its corresponding points_change value.
-- Write a solution to calculate the change in the global rankings after updating each team's points
SELECT
    t.team_id,
    t.name,
    (ROW_NUMBER() OVER (ORDER BY t.points DESC)) - (ROW_NUMBER() OVER (ORDER BY NVL(t.points + p.points_change, t.points) DESC)) AS rank_diff
FROM
    TeamPoints t
LEFT JOIN
    PointsChange p
ON
    p.team_id = t.team_id
ORDER BY
    Points DESC,
    Name;

-- Drop tables
DROP TABLE TeamPoints;
DROP TABLE PointsChange;
