-- Create the salary table
Create table Salary (id int, name varchar(100), sex char(1), salary int);

-- Populate the salary table
Truncate table Salary;
insert into Salary (id, name, sex, salary) values (1, 'A', 'm', 2500);
insert into Salary (id, name, sex, salary) values (2, 'B', 'f', 1500);
insert into Salary (id, name, sex, salary) values (3, 'C', 'm', 5500);
insert into Salary (id, name, sex, salary) values (4, 'D', 'f', 500);

-- Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.
-- Note that you must write a single update statement, do not write any select statement for this problem.
UPDATE
    salary
SET
    sex = CASE
            WHEN sex = 'm' THEN 'f'
            WHEN sex = 'f' THEN 'm'
          END
WHERE sex in ('m', 'f');

-- Drop table
DROP TABLE salary;
