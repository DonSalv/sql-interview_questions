Create table Experiments (experiment_id int, platform VARCHAR2(10), experiment_name VARCHAR2(15), CONSTRAINT Experiments_pk PRIMARY KEY (experiment_id),
CONSTRAINT platform_check CHECK (platform IN ('Android', 'IOS', 'Web')), CONSTRAINT experiment_name_check CHECK (experiment_name IN ('Reading', 'Sports', 'Programming')));

insert into Experiments (experiment_id, platform, experiment_name) values ('4', 'IOS', 'Programming');
insert into Experiments (experiment_id, platform, experiment_name) values ('13', 'IOS', 'Sports');
insert into Experiments (experiment_id, platform, experiment_name) values ('14', 'Android', 'Reading');
insert into Experiments (experiment_id, platform, experiment_name) values ('8', 'Web', 'Reading');
insert into Experiments (experiment_id, platform, experiment_name) values ('12', 'Web', 'Reading');
insert into Experiments (experiment_id, platform, experiment_name) values ('18', 'Web', 'Programming');

SELECT Q1.platform, Q1.experiment_name, COUNT(e.experiment_id) AS num_experiments FROM
(SELECT * FROM (SELECT DISTINCT platform FROM Experiments)
CROSS JOIN (SELECT DISTINCT experiment_name FROM Experiments)) Q1
LEFT JOIN Experiments e
ON e.platform=Q1.platform AND e.experiment_name=Q1.experiment_name
GROUP BY Q1.platform, Q1.experiment_name
ORDER BY Q1.platform, Q1.experiment_name;

DROP TABLE Experiments PURGE;