-- Create the department table
CREATE TABLE Department (id int, revenue int, month varchar(5));
    
-- Populate the department table
TRUNCATE TABLE Department;
INSERT INTO Department (id, revenue, month) VALUES ('1', '8000', 'Jan');
INSERT INTO Department (id, revenue, month) VALUES ('2', '9000', 'Jan');
INSERT INTO Department (id, revenue, month) VALUES ('3', '10000', 'Feb');
INSERT INTO Department (id, revenue, month) VALUES ('1', '7000', 'Feb');
INSERT INTO Department (id, revenue, month) VALUES ('1', '6000', 'Mar');

-- Solve the exercise

SELECT * FROM
(
  SELECT id, revenue, month
  FROM Department
)
PIVOT
(
  SUM(revenue)
  FOR month IN 
  ('Jan' AS Jan_Revenue,'Feb' AS Feb_Revenue,'Mar' AS Mar_Revenue,
  'Apr' AS Apr_Revenue, 'May' AS May_Revenue,'Jun' AS Jun_Revenue,
  'Jul' AS Jul_Revenue,'Aug' AS Aug_Revenue,'Sep' AS Sep_Revenue,
  'Oct' AS Oct_Revenue,'Nov' AS Nov_Revenue,'Dec' AS Dec_Revenue)
)
ORDER BY id;

-- Drop unused table

DROP TABLE Department;