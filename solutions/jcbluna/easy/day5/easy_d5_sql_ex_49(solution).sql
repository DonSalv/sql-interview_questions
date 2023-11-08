-- Create the tables
CREATE TABLE TVProgram (program_date date, content_id int, channel varchar(30));
CREATE TABLE Content (content_id varchar(30), title varchar(30), Kids_content char(1) CHECK(Kids_content IN ('Y', 'N')), content_type varchar(30));

-- Populate the tvprogram table
TRUNCATE TABLE TVProgram;
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_DATE('2020-06-10 08:00','%YYYY-%MM-%DD %HH24:%MI'), '1', 'LC-Channel');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_DATE('2020-05-11 12:00','%YYYY-%MM-%DD %HH24:%MI'), '2', 'LC-Channel');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_DATE('2020-05-12 12:00','%YYYY-%MM-%DD %HH24:%MI'), '3', 'LC-Channel');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_DATE('2020-05-13 14:00','%YYYY-%MM-%DD %HH24:%MI'), '4', 'Disney Ch');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_DATE('2020-06-18 14:00','%YYYY-%MM-%DD %HH24:%MI'), '4', 'Disney Ch');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_DATE('2020-07-15 16:00','%YYYY-%MM-%DD %HH24:%MI'), '5', 'Disney Ch');

-- Populate the content table
TRUNCATE TABLE Content;
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES ('1', 'Leetcode Movie', 'N', 'Movies');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES ('2', 'Alg. for Kids', 'Y', 'Series');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES ('3', 'Database Sols', 'N', 'Series');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES ('4', 'Aladdin', 'Y', 'Movies');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES ('5', 'Cinderella', 'Y', 'Movies');

-- Solve the exercise
SELECT title
FROM TVProgram t JOIN Content c
USING(content_id)
WHERE Kids_content='Y'
AND content_type='Movies'
AND EXTRACT(YEAR FROM program_date)=2020
AND EXTRACT(MONTH FROM program_date)=6;

-- Drop unused tables
DROP TABLE TVProgram;
DROP TABLE Content;