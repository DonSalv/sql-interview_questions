-- Create the experiments table
CREATE TABLE Experiments (experiment_id int, platform varchar(7) CHECK(platform IN ('Android', 'IOS', 'Web')), experiment_name varchar(11) CHECK(experiment_name IN ('Reading', 'Sports', 'Programming')));

-- Populate the experiments table
TRUNCATE TABLE Experiments;
INSERT INTO Experiments (experiment_id, platform, experiment_name) VALUES ('4', 'IOS', 'Programming');
INSERT INTO Experiments (experiment_id, platform, experiment_name) VALUES ('13', 'IOS', 'Sports');
INSERT INTO Experiments (experiment_id, platform, experiment_name) VALUES ('14', 'Android', 'Reading');
INSERT INTO Experiments (experiment_id, platform, experiment_name) VALUES ('8', 'Web', 'Reading');
INSERT INTO Experiments (experiment_id, platform, experiment_name) VALUES ('12', 'Web', 'Reading');
INSERT INTO Experiments (experiment_id, platform, experiment_name) VALUES ('18', 'Web', 'Programming');

-- Solve the exercise
SELECT t.platform, t.experiment_name, NVL(COUNT(experiment_id),0) AS num_experiments
FROM (SELECT DISTINCT e1.platform, e2.experiment_name
FROM Experiments e1 CROSS JOIN Experiments e2) t
LEFT OUTER JOIN Experiments e
ON(t.platform=e.platform AND t.experiment_name=e.experiment_name)
GROUP BY t.platform, t.experiment_name;

-- Drop unused table
DROP TABLE Experiments;