Create table Players (player_id int, player_name varchar(20), CONSTRAINT Players_pk PRIMARY KEY (player_id));
Create table Championships (year int, Wimbledon int, Fr_open int, US_open int, Au_open int, CONSTRAINT Championships_pk PRIMARY KEY (year),
CONSTRAINT fk_Wimbledon FOREIGN KEY (Wimbledon) REFERENCES Players(player_id),
CONSTRAINT fk_Fr FOREIGN KEY (Fr_open) REFERENCES Players(player_id),
CONSTRAINT fk_US FOREIGN KEY (US_open) REFERENCES Players(player_id),
CONSTRAINT fk_Au FOREIGN KEY (Au_open) REFERENCES Players(player_id));

insert into Players (player_id, player_name) values ('1', 'Nadal');
insert into Players (player_id, player_name) values ('2', 'Federer');
insert into Players (player_id, player_name) values ('3', 'Novak');

insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values ('2018', '1', '1', '1', '1');
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values ('2019', '1', '1', '2', '2');
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values ('2020', '2', '1', '2', '2');

SELECT p.player_id, p.player_name, Q1.grand_slams_count FROM Players p JOIN
(SELECT player_id, SUM(titles) AS grand_slams_count FROM
(SELECT Wimbledon AS player_id, count(*) AS titles FROM Championships GROUP BY Wimbledon
UNION ALL
SELECT Fr_open AS player_id, count(*) AS titles FROM Championships GROUP BY Fr_open
UNION ALL
SELECT US_open AS player_id, count(*) AS titles FROM Championships GROUP BY US_open
UNION ALL
SELECT AU_open AS player_id, count(*) AS titles FROM Championships GROUP BY Au_open)
GROUP BY player_id) Q1
ON p.player_id=Q1.player_id;

DROP TABLE Championships PURGE;
DROP TABLE Players PURGE;