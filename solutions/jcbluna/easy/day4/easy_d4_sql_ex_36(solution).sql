-- Create the submissions table
CREATE TABLE Submissions (sub_id int, parent_id int);
    
-- Populate the submissions table
TRUNCATE TABLE Submissions;
INSERT INTO Submissions (sub_id, parent_id) VALUES ('1', NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES ('2', NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES ('1', NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES ('12', NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES ('3', '1');
INSERT INTO Submissions (sub_id, parent_id) VALUES ('5', '2');
INSERT INTO Submissions (sub_id, parent_id) VALUES ('3', '1');
INSERT INTO Submissions (sub_id, parent_id) VALUES ('4', '1');
INSERT INTO Submissions (sub_id, parent_id) VALUES ('9', '1');
INSERT INTO Submissions (sub_id, parent_id) VALUES ('10', '2');
INSERT INTO Submissions (sub_id, parent_id) VALUES ('6', '7');

-- Solve the exercise

SELECT p.sub_id AS post_id, COUNT(DISTINCT s.sub_id) AS number_of_comments
FROM (SELECT DISTINCT sub_id FROM Submissions WHERE parent_id IS NULL) p LEFT OUTER JOIN Submissions s
ON(p.sub_id=s.parent_id)
GROUP BY p.sub_id
ORDER BY p.sub_id;

-- Drop unused table

DROP TABLE Submissions;