-- Create the genders table
Create table Genders (user_id int, gender varchar(10) CONSTRAINT check_enum_values CHECK (gender IN ('female', 'other', 'male')));

-- Populate the genders table    
Truncate table Genders;
insert into Genders (user_id, gender) values ('4', 'male');
insert into Genders (user_id, gender) values ('7', 'female');
insert into Genders (user_id, gender) values ('2', 'other');
insert into Genders (user_id, gender) values ('5', 'male');
insert into Genders (user_id, gender) values ('3', 'female');
insert into Genders (user_id, gender) values ('8', 'male');
insert into Genders (user_id, gender) values ('6', 'other');
insert into Genders (user_id, gender) values ('1', 'other');
insert into Genders (user_id, gender) values ('9', 'female');

-- Write a solution to rearrange the GENDERS table such that the rows alternate between 
-- 'female', 'other', and 'male' in order. 
-- The table should be rearranged such that the IDs of each gender are sorted in ascending order.
-- Return the result table in the mentioned order
SELECT
    user_id,
    gender
FROM 
    (SELECT
        user_id, 
        gender,
        CASE WHEN gender = 'male' THEN 2
             WHEN gender = 'female' THEN 0
             ELSE 1
        END AS gender_rank,
        DENSE_RANK() OVER (PARTITION BY gender ORDER BY user_id) AS user_rank
    FROM
        Genders)
ORDER BY 
    user_rank,
    gender_rank;
        
-- Drop table
DROP TABLE Genders;
