-- Create the stadium table
CREATE TABLE Stadium (id int, visit_date DATE NULL, people int);

-- Populate the stadium table    
TRUNCATE TABLE Stadium;
INSERT INTO Stadium (id, visit_date, people) VALUES ('1', TO_DATE('2017-01-01','%YYYY-%MM-%DD'), '10');
INSERT INTO Stadium (id, visit_date, people) VALUES ('2', TO_DATE('2017-01-02','%YYYY-%MM-%DD'), '109');
INSERT INTO Stadium (id, visit_date, people) VALUES ('3', TO_DATE('2017-01-03','%YYYY-%MM-%DD'), '150');
INSERT INTO Stadium (id, visit_date, people) VALUES ('4', TO_DATE('2017-01-04','%YYYY-%MM-%DD'), '99');
INSERT INTO Stadium (id, visit_date, people) VALUES ('5', TO_DATE('2017-01-05','%YYYY-%MM-%DD'), '145');
INSERT INTO Stadium (id, visit_date, people) VALUES ('6', TO_DATE('2017-01-06','%YYYY-%MM-%DD'), '1455');
INSERT INTO Stadium (id, visit_date, people) VALUES ('7', TO_DATE('2017-01-07','%YYYY-%MM-%DD'), '199');
INSERT INTO Stadium (id, visit_date, people) VALUES ('8', TO_DATE('2017-01-09','%YYYY-%MM-%DD'), '188');

-- Solve the exercise
SELECT id, visit_date, people
FROM(SELECT id, visit_date, people, grp_date, COUNT(id) OVER(PARTITION BY grp_date) AS count_group
FROM((SELECT id, visit_date, people, SUM(CASE WHEN valid=prev_valid THEN 0 ELSE 1 END) OVER(ORDER BY visit_date) AS grp_date
FROM(SELECT id, visit_date, people, valid, LAG(valid,1) OVER(ORDER BY visit_date) AS prev_valid
FROM(SELECT id, visit_date, people, 
(CASE WHEN id=NVL(LEAD(id,1) OVER(ORDER BY visit_date)-1,id) AND people>=100 THEN 1 ELSE 0 END) AS valid
FROM Stadium
ORDER BY visit_date)))))

-- Drop unused table
DROP TABLE Stadium;