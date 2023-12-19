Create table Chests (chest_id int, apple_count int, orange_count int, CONSTRAINT Chests_pk PRIMARY KEY (chest_id));
Create table Boxes (box_id int, chest_id int, apple_count int, orange_count int, CONSTRAINT Boxes_pk PRIMARY KEY (box_id),
CONSTRAINT fk_Boxes FOREIGN KEY (chest_id) REFERENCES Chests(chest_id));

insert into Chests (chest_id, apple_count, orange_count) values ('6', '5', '6');
insert into Chests (chest_id, apple_count, orange_count) values ('14', '20', '10');
insert into Chests (chest_id, apple_count, orange_count) values ('2', '8', '8');
insert into Chests (chest_id, apple_count, orange_count) values ('3', '19', '4');
insert into Chests (chest_id, apple_count, orange_count) values ('16', '19', '19');

insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('2', NULL, '6', '15');
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('18', '14', '4', '15');
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('19', '3', '8', '4');
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('12', '2', '19', '20');
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('20', '6', '12', '9');
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('8', '6', '9', '9');
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('3', '14', '16', '7');

SELECT SUM(apple_count) AS apple_count, SUM(orange_count) AS orange_count FROM
(SELECT b.box_id, b.apple_count+COALESCE(c.apple_count,0) AS apple_count, 
b.orange_count+COALESCE(c.orange_count,0) AS orange_count FROM Boxes b
LEFT JOIN Chests c ON C.chest_id = b.chest_id);

DROP TABLE Boxes PURGE;
DROP TABLE Chests PURGE;