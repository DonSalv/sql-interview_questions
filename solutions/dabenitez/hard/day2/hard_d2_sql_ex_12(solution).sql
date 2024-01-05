Create table Players (player_id int, group_id int, CONSTRAINT Players_pk PRIMARY KEY (player_id));
Create table Matches (match_id int, first_player int, second_player int, first_score int, second_score int, CONSTRAINT Matches_pk PRIMARY KEY (match_id),
CONSTRAINT fk_first FOREIGN KEY (first_player) REFERENCES Players(player_id),
CONSTRAINT fk_second FOREIGN KEY (second_player) REFERENCES Players(player_id));

insert into Players (player_id, group_id) values ('10', '2');
insert into Players (player_id, group_id) values ('15', '1');
insert into Players (player_id, group_id) values ('20', '3');
insert into Players (player_id, group_id) values ('25', '1');
insert into Players (player_id, group_id) values ('30', '1');
insert into Players (player_id, group_id) values ('35', '2');
insert into Players (player_id, group_id) values ('40', '3');
insert into Players (player_id, group_id) values ('45', '1');
insert into Players (player_id, group_id) values ('50', '2');

insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('1', '15', '45', '3', '0');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('2', '30', '25', '1', '2');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('3', '30', '15', '2', '0');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('4', '40', '20', '5', '2');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('5', '35', '50', '1', '1');

SELECT group_id, player_id FROM
(SELECT p.group_id, p.player_id, SUM(score) AS score,
RANK() OVER (PARTITION BY p.group_id ORDER BY SUM(score) DESC, p.player_id) AS ranking
FROM Players p LEFT JOIN 
(SELECT first_player AS player_id, first_score AS score
FROM Matches UNION ALL
SELECT second_player AS player_id, second_score AS score
FROM Matches) Q1
ON p.player_id=Q1.player_id
WHERE score IS NOT NULL
GROUP BY p.player_id, p.group_id)
WHERE ranking=1;

DROP TABLE Matches PURGE;
DROP TABLE Players PURGE;