-- Create the friendship table
Create table Friendship (user1_id int, user2_id int);

-- Populate the friendship table    
Truncate table Friendship;
insert into Friendship (user1_id, user2_id) values (1, 2);
insert into Friendship (user1_id, user2_id) values (1, 3);
insert into Friendship (user1_id, user2_id) values (2, 3);
insert into Friendship (user1_id, user2_id) values (1, 4);
insert into Friendship (user1_id, user2_id) values (2, 4);
insert into Friendship (user1_id, user2_id) values (1, 5);
insert into Friendship (user1_id, user2_id) values (2, 5);
insert into Friendship (user1_id, user2_id) values (1, 7);
insert into Friendship (user1_id, user2_id) values (3, 7);
insert into Friendship (user1_id, user2_id) values (1, 6);
insert into Friendship (user1_id, user2_id) values (3, 6);
insert into Friendship (user1_id, user2_id) values (2, 6);

-- A friendship between a pair of friends x and y is strong if x and y have at least three common friends.
-- Write a solution to find all the strong friendships.
-- Note that the result table should not contain duplicates with user1_id < user2_id
WITH all_friends AS (
    SELECT * FROM Friendship
    UNION ALL
    SELECT user2_id, user1_id FROM Friendship)
SELECT 
    DISTINCT * 
FROM
    (SELECT 
         a1.user1_id, 
         a2.user1_id AS user2_id, 
         COUNT(a2.user1_id) AS common_friend
     FROM 
        all_friends a1 
     INNER JOIN all_friends a2 
     ON 
        a1.user1_id != a2.user1_id AND 
        a1.user2_id = a2.user2_id
     GROUP BY 
        a1.user1_id, 
        a2.user1_id
     HAVING 
        COUNT(a2.user1_id) >= 3) 
WHERE 
    (user1_id, user2_id) IN (SELECT * FROM Friendship);

-- Drop table
DROP TABLE Friendship;
