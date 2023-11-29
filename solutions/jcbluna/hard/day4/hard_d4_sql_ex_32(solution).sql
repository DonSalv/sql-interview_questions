-- Create the tables
CREATE TABLE Keywords (topic_id int, word varchar(25));
CREATE TABLE Posts (post_id int, content varchar(100));

-- Populate the keywords table    
TRUNCATE TABLE Keywords;
INSERT INTO Keywords (topic_id, word) VALUES ('1', 'handball');
INSERT INTO Keywords (topic_id, word) VALUES ('1', 'football');
INSERT INTO Keywords (topic_id, word) VALUES ('3', 'WAR');
INSERT INTO Keywords (topic_id, word) VALUES ('2', 'Vaccine');
    
-- Populate the posts table
TRUNCATE TABLE Posts;
INSERT INTO Posts (post_id, content) VALUES ('1', 'We call it soccer They call it football hahaha');
INSERT INTO Posts (post_id, content) VALUES ('2', 'Americans prefer basketball while Europeans love handball and football');
INSERT INTO Posts (post_id, content) VALUES ('3', 'stop the war and play handball');
INSERT INTO Posts (post_id, content) VALUES ('4', 'warning I planted some flowers this morning and then got vaccinated');

-- Solve the exercise
SELECT post_id, NVL(LISTAGG(topic_id,',') WITHIN GROUP(ORDER BY topic_id),'Ambiguous!') AS topic
FROM(SELECT DISTINCT post_id, topic_id
FROM Posts p LEFT OUTER JOIN Keywords k
ON(LOWER(content) LIKE '% ' || LOWER(word) || ' %'
OR LOWER(content) LIKE '% ' || LOWER(word) 
OR LOWER(content) LIKE LOWER(word) || ' %' ))
GROUP BY post_id;

-- Drop unused tables
DROP TABLE Keywords;
DROP TABLE Posts;