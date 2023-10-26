-- Crete the Person table
Create table Person (Id int, Email varchar(255));

-- Populate the Person table
Truncate table Person;
insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');

-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
DELETE FROM Person 
    WHERE email IN (SELECT email 
                    FROM person 
                    GROUP BY email 
                    HAVING COUNT(email) > 1) 
    AND id NOT IN (SELECT MIN(id) 
                   FROM person 
                   WHERE email IN (SELECT email 
                                   FROM person 
                                   GROUP BY email 
                                   HAVING COUNT(email) > 1));

-- After running your script, the answer shown is the PERSON table. 
-- The driver will first compile and run your piece of code and then show the PERSON table. The final order of the PERSON table does not matter.
SELECT * FROM Person;
