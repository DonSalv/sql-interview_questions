-- Create the tree table
Create table Tree (id int, p_id int);

-- Populate the tree table    
Truncate table Tree;
insert into Tree (id, p_id) values (1, NULL);
insert into Tree (id, p_id) values (2, 1);
insert into Tree (id, p_id) values (3, 1);
insert into Tree (id, p_id) values (4, 2);
insert into Tree (id, p_id) values (5, 2);

-- Each node in the tree can be one of three types:
--      * "Leaf": if the node is a leaf node.
--      * "Root": if the node is the root of the tree.
--      * "Inner": If the node is neither a leaf node nor a root node.
-- Write a solution to report the type of each node in the tree.
SELECT
    id,
    CASE 
        WHEN p_id IS NULL THEN 'Root' 
        WHEN id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;

-- Drop tables
DROP TABLE Tree;
