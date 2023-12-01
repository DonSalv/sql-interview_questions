-- Create the experiments table
Create table Experiments (experiment_id int, platform varchar(10) CONSTRAINT check_enum_values CHECK (platform IN ('Android', 'IOS', 'Web')), experiment_name varchar(11) CONSTRAINT check_enum_values2 CHECK (experiment_name IN ('Reading', 'Sports', 'Programming')));

-- Populate the experiments table
Truncate table Experiments;
insert into Experiments (experiment_id, platform, experiment_name) values (4, 'IOS', 'Programming');
insert into Experiments (experiment_id, platform, experiment_name) values (13, 'IOS', 'Sports');
insert into Experiments (experiment_id, platform, experiment_name) values (14, 'Android', 'Reading');
insert into Experiments (experiment_id, platform, experiment_name) values (8, 'Web', 'Reading');
insert into Experiments (experiment_id, platform, experiment_name) values (12, 'Web', 'Reading');
insert into Experiments (experiment_id, platform, experiment_name) values (18, 'Web', 'Programming');

-- Write a solution to report the number of experiments done on each of the three platforms for each of the three given experiments. 
-- Notice that all the pairs of (platform, experiment) should be included in the output including the pairs with zero experiments.
WITH Platform_exps AS (
    SELECT 
        * 
    FROM    
        (SELECT 'Android' AS platform FROM DUAL
             UNION ALL
             SELECT 'IOS' AS platform FROM DUAL
             UNION ALL
             SELECT 'Web' AS platform FROM DUAL) 
    CROSS JOIN 
        (SELECT 'Reading' AS experiment_name FROM DUAL
             UNION ALL
             SELECT 'Sports' AS experiment_name FROM DUAL
             UNION ALL
             SELECT 'Programming' AS experiment_name FROM DUAL))  
SELECT
    p.platform,
    p.experiment_name,
    NVL(COUNT(e.experiment_name), 0) AS num_experiments
FROM
    Platform_exps p
LEFT JOIN
    Experiments e
ON
    p.platform = e.platform AND 
    p.experiment_name = e.experiment_name
GROUP BY
    p.platform,
    p.experiment_name
ORDER BY
    p.platform;

-- Drop tables
DROP TABLE Experiments;
