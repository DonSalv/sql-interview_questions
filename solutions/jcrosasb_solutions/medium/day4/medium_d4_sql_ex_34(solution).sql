-- Create the tables
Create table Friendship (user1_id int, user2_id int);
Create table Likes (user_id int, page_id int);

-- Populate the friendship table    
Truncate table Friendship;
insert into Friendship (user1_id, user2_id) values (1, 2);
insert into Friendship (user1_id, user2_id) values (1, 3);
insert into Friendship (user1_id, user2_id) values (1, 4);
insert into Friendship (user1_id, user2_id) values (2, 3);
insert into Friendship (user1_id, user2_id) values (2, 4);
insert into Friendship (user1_id, user2_id) values (2, 5);
insert into Friendship (user1_id, user2_id) values (6, 1);
    
-- Populate the likes table
Truncate table Likes;
insert into Likes (user_id, page_id) values (1, 88);
insert into Likes (user_id, page_id) values (2, 23);
insert into Likes (user_id, page_id) values (3, 24);
insert into Likes (user_id, page_id) values (4, 56);
insert into Likes (user_id, page_id) values (5, 11);
insert into Likes (user_id, page_id) values (6, 33);
insert into Likes (user_id, page_id) values (2, 77);
insert into Likes (user_id, page_id) values (3, 77);
insert into Likes (user_id, page_id) values (6, 88);

-- Write a solution to recommend pages to the user with user_id = 1 using the pages that your friends liked.
-- It should not recommend pages you already liked.
-- Return result table in any order without duplicates
SELECT 
    DISTINCT page_id
FROM 
    Likes
WHERE
    user_id IN (SELECT 
                    CASE WHEN USER1_ID = 1 THEN USER2_ID
                         WHEN USER2_ID = 1 THEN USER1_ID
                    END 
                FROM
                    Friendship) AND
    page_id NOT IN (SELECT 
                        page_id 
                    FROM 
                        Likes 
                    WHERE 
                        user_id = 1);

-- Drop tables
DROP TABLE Friendship;
DROP TABLE Likes;
