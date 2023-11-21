-- Create the tables
CREATE TABLE Boxes (box_id int, chest_id int, apple_count int, orange_count int);
CREATE TABLE Chests (chest_id int, apple_count int, orange_count int);

-- Populate the boxes table    
TRUNCATE TABLE Boxes;
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES ('2', NULL, '6', '15');
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES ('18', '14', '4', '15');
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES ('19', '3', '8', '4');
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES ('12', '2', '19', '20');
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES ('20', '6', '12', '9');
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES ('8', '6', '9', '9');
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES ('3', '14', '16', '7');

-- Populate the chests table
TRUNCATE TABLE Chests;
INSERT INTO Chests (chest_id, apple_count, orange_count) VALUES ('6', '5', '6');
INSERT INTO Chests (chest_id, apple_count, orange_count) VALUES ('14', '20', '10');
INSERT INTO Chests (chest_id, apple_count, orange_count) VALUES ('2', '8', '8');
INSERT INTO Chests (chest_id, apple_count, orange_count) VALUES ('3', '19', '4');
INSERT INTO Chests (chest_id, apple_count, orange_count) VALUES ('16', '19', '19');

-- Solve the exercise
SELECT SUM(apples) AS apple_count, SUM(oranges) AS orange_count
FROM(SELECT NVL(b.apple_count,0)+NVL(c.apple_count,0) AS apples, NVL(b.orange_count,0)+NVL(c.orange_count,0) AS oranges
FROM Boxes b LEFT OUTER JOIN Chests c
ON(c.chest_id=b.chest_id));

-- Drop unused tables
DROP TABLE Boxes;
DROP TABLE Chests;