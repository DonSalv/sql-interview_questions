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
WITH ExperimentTypes AS
(-- New logic to consider all different platforms and experiments
SELECT *
FROM(SELECT 'Android' AS platform FROM dual UNION ALL
SELECT 'IOS' AS platform FROM dual UNION ALL
SELECT 'Web' AS platform FROM dual) CROSS JOIN
(SELECT 'Reading' AS experiment_name FROM dual UNION ALL
SELECT 'Sports' AS experiment_name FROM dual UNION ALL
SELECT 'Programming' AS experiment_name FROM dual))
SELECT et.platform, et.experiment_name, NVL(COUNT(e.experiment_id),0) AS num_experiments
FROM ExperimentTypes et LEFT OUTER JOIN Experiments e
ON(et.platform=e.platform
AND et.experiment_name=e.experiment_name)
GROUP BY et.platform, et.experiment_name;

-- Drop unused table
DROP TABLE Experiments;