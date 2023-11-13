-- Create the tree table
CREATE TABLE Tree (id int, p_id int);

-- Example 1
-- Populate the tree table    
TRUNCATE TABLE Tree;
INSERT INTO Tree (id, p_id) VALUES ('1', NULL);
INSERT INTO Tree (id, p_id) VALUES ('2', '1');
INSERT INTO Tree (id, p_id) VALUES ('3', '1');
INSERT INTO Tree (id, p_id) VALUES ('4', '2');
INSERT INTO Tree (id, p_id) VALUES ('5', '2');

-- Example 2
-- Populate the tree table    
TRUNCATE TABLE Tree;
INSERT INTO Tree (id, p_id) VALUES ('1', NULL);

-- Solve the exercise
SELECT id, (CASE WHEN (SELECT p_id FROM Tree WHERE id=t.id) IS NULL THEN 'Root'
            WHEN NOT EXISTS (SELECT p_id FROM Tree WHERE p_id=t.id) THEN 'Leaf'
            ELSE 'Inner' END) AS type
FROM Tree t
ORDER BY id;

-- Drop unused table
DROP TABLE Tree;