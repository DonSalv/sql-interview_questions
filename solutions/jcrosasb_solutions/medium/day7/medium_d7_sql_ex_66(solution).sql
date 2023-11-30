-- Create the accounts table
Create table Accounts (account_id int, income int);

-- Populate the accounts table    
Truncate table Accounts;
insert into Accounts (account_id, income) values (3, 108939);
insert into Accounts (account_id, income) values (2, 12747);
insert into Accounts (account_id, income) values (8, 87709);
insert into Accounts (account_id, income) values (6, 91796);

-- Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:
--      * "Low Salary": All the salaries strictly less than $20000.
--      * "Average Salary": All the salaries in the inclusive range [$20000, $50000].
--      * "High Salary": All the salaries strictly greater than $50000.
-- The result table must contain all three categories. If there are no accounts in a category, return 0
SELECT
    t1.category,
    NVL(COUNT(t2.category), 0) AS accounts_count
FROM 
    (SELECT 'Low Salary' AS category FROM DUAL
     UNION
     SELECT 'Average Salary' FROM DUAL
     UNION
     SELECT 'High Salary' FROM DUAL) t1
LEFT JOIN
    (SELECT
         CASE WHEN income < 20000 THEN 'Low Salary'
              WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
              ELSE 'High Salary' END AS category
     FROM
         Accounts) t2
ON
    t1.category = t2.category
GROUP BY
    t1.category
ORDER BY
  CASE CATEGORY
    WHEN 'Low Salary' THEN 1
    WHEN 'Average Salary' THEN 2
    WHEN 'High Salary' THEN 3
  END;
    
-- Drop tables
DROP TABLE Accounts;
