-- Create the mynumbers table
Create table MyNumbers (num int);
    
-- Populate the mynumbers table
Truncate table MyNumbers;
insert into MyNumbers (num) values (8);
insert into MyNumbers (num) values (8);
insert into MyNumbers (num) values (3);
insert into MyNumbers (num) values (3);
insert into MyNumbers (num) values (1);
insert into MyNumbers (num) values (4);
insert into MyNumbers (num) values (5);
insert into MyNumbers (num) values (6);

-- A single number is a number that appeared only once in the MYNUMBERS table.
-- Find the largest single number. If there is no single number, report null.
SELECT 
    MAX(t.num) num 
FROM (SELECT 
          num, 
          COUNT(num) num_count 
      FROM MyNumbers 
      GROUP BY num) t
WHERE t.num_count = 1;

-- Drop tables
DROP TABLE MyNumbers;
