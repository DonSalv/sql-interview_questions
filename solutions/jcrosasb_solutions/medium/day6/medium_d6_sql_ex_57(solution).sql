-- Create the tables
Create table Boxes (box_id int, chest_id int, apple_count int, orange_count int);
Create table Chests (chest_id int, apple_count int, orange_count int);

-- Populate the boxes table    
Truncate table Boxes;
insert into Boxes (box_id, chest_id, apple_count, orange_count) values (2, NULL, 6, 15);
insert into Boxes (box_id, chest_id, apple_count, orange_count) values (18, 14, 4, 15);
insert into Boxes (box_id, chest_id, apple_count, orange_count) values (19, 3, 8, 4);
insert into Boxes (box_id, chest_id, apple_count, orange_count) values (12, 2, 19, 20);
insert into Boxes (box_id, chest_id, apple_count, orange_count) values (20, 6, 12, 9);
insert into Boxes (box_id, chest_id, apple_count, orange_count) values (8, 6, 9, 9);
insert into Boxes (box_id, chest_id, apple_count, orange_count) values (3, 14, 16, 7);

-- Populate the chests table
Truncate table Chests;
insert into Chests (chest_id, apple_count, orange_count) values (6, 5, 6);
insert into Chests (chest_id, apple_count, orange_count) values (14, 20, 10);
insert into Chests (chest_id, apple_count, orange_count) values (2, 8, 8);
insert into Chests (chest_id, apple_count, orange_count) values (3, 19, 4);
insert into Chests (chest_id, apple_count, orange_count) values (16, 19, 19);

-- Write a solution to count the number of apples and oranges in all the boxes.
-- If a box contains a chest, you should also include the number of apples and oranges it has.
SELECT
    SUM(b.apple_count + (CASE WHEN b.chest_id IS NULL THEN 0 ELSE c.apple_count END)) AS apple_count,
    SUM(b.orange_count + (CASE WHEN b.chest_id IS NULL THEN 0 ELSE c.orange_count END)) AS orange_count
FROM
    Boxes b
LEFT JOIN
    Chests c
ON
    b.chest_id = c.chest_id;

-- Drop tables
DROP TABLE Boxes;
DROP TABLE Chests;
