Create table Keywords (topic_id int, word varchar(25));
Create table Posts (post_id int, content varchar(100), CONSTRAINT Posts_pk PRIMARY KEY (post_id));

ALTER TABLE Keywords ADD PRIMARY KEY (topic_id, word) DISABLE;

insert into Keywords (topic_id, word) values ('1', 'handball');
insert into Keywords (topic_id, word) values ('1', 'football');
insert into Keywords (topic_id, word) values ('3', 'WAR');
insert into Keywords (topic_id, word) values ('2', 'Vaccine');

insert into Posts (post_id, content) values ('1', 'We call it soccer They call it football hahaha');
insert into Posts (post_id, content) values ('2', 'Americans prefer basketball while Europeans love handball and football');
insert into Posts (post_id, content) values ('3', 'stop the war and play handball');
insert into Posts (post_id, content) values ('4', 'warning I planted some flowers this morning and then got vaccinated');

SELECT post_id, 
COALESCE(LISTAGG(topic_id,',') WITHIN GROUP(ORDER BY topic_id),'Ambiguous!') 
AS topic FROM 
(SELECT DISTINCT post_id, topic_id
FROM Posts p LEFT JOIN Keywords k
ON(LOWER(content) LIKE '% ' || LOWER(word) || ' %'
OR LOWER(content) LIKE '% ' || LOWER(word) 
OR LOWER(content) LIKE LOWER(word) || ' %' ))
GROUP BY post_id;

DROP TABLE Posts PURGE;
DROP TABLE Keywords PURGE;