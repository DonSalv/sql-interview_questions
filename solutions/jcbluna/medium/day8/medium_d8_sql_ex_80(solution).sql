-- Create the tables
CREATE TABLE TeamPoints (team_id int, name varchar(100), points int);
CREATE TABLE PointsChange (team_id int, points_change int);

-- Populate the teampoints    
TRUNCATE TABLE TeamPoints;
INSERT INTO TeamPoints (team_id, name, points) VALUES ('3', 'Algeria', '1431');
INSERT INTO TeamPoints (team_id, name, points) VALUES ('1', 'Senegal', '2132');
INSERT INTO TeamPoints (team_id, name, points) VALUES ('2', 'New Zealand', '1402');
INSERT INTO TeamPoints (team_id, name, points) VALUES ('4', 'Croatia', '1817');

-- Populate the pointschange    
TRUNCATE TABLE PointsChange;
INSERT INTO PointsChange (team_id, points_change) VALUES ('3', '399');
INSERT INTO PointsChange (team_id, points_change) VALUES ('2', '0');
INSERT INTO PointsChange (team_id, points_change) VALUES ('4', '13');
INSERT INTO PointsChange (team_id, points_change) VALUES ('1', '-22');

-- Solve the exercise
SELECT team_id, name, -(next_rank-prev_rank) AS rank_diff
FROM(SELECT t.team_id, name, points, DENSE_RANK() OVER(ORDER BY points DESC, name) AS prev_rank, points+NVL(points_change,0),
DENSE_RANK() OVER(ORDER BY points+NVL(points_change,0) DESC, name) AS next_rank
FROM TeamPoints t JOIN PointsChange c
ON(t.team_id=c.team_id));

-- Drop unused tables
DROP TABLE TeamPoints;
DROP TABLE PointsChange;