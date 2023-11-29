Create table Content (content_id varchar(30), title varchar(30), Kids_content VARCHAR2(15), content_type varchar(30), CONSTRAINT Content_pk PRIMARY KEY (content_id), CONSTRAINT Kids_content_check CHECK (Kids_content IN ('Y', 'N')));
Create table TVProgram (program_date date, content_id int, channel varchar(30));

ALTER TABLE TVProgram 
    ADD PRIMARY KEY (program_date, content_id) DISABLE;

insert into Content (content_id, title, Kids_content, content_type) values ('1', 'Leetcode Movie', 'N', 'Movies');
insert into Content (content_id, title, Kids_content, content_type) values ('2', 'Alg. for Kids', 'Y', 'Series');
insert into Content (content_id, title, Kids_content, content_type) values ('3', 'Database Sols', 'N', 'Series');
insert into Content (content_id, title, Kids_content, content_type) values ('4', 'Aladdin', 'Y', 'Movies');
insert into Content (content_id, title, Kids_content, content_type) values ('5', 'Cinderella', 'Y', 'Movies');

insert into TVProgram (program_date, content_id, channel) values (TO_DATE('2020-06-10 08:00','YYYY-MM-DD HH24:MI'), '1', 'LC-Channel');
insert into TVProgram (program_date, content_id, channel) values (TO_DATE('2020-05-11 12:00','YYYY-MM-DD HH24:MI'), '2', 'LC-Channel');
insert into TVProgram (program_date, content_id, channel) values (TO_DATE('2020-05-12 12:00','YYYY-MM-DD HH24:MI'), '3', 'LC-Channel');
insert into TVProgram (program_date, content_id, channel) values (TO_DATE('2020-05-13 14:00','YYYY-MM-DD HH24:MI'), '4', 'Disney Ch');
insert into TVProgram (program_date, content_id, channel) values (TO_DATE('2020-06-18 14:00','YYYY-MM-DD HH24:MI'), '4', 'Disney Ch');
insert into TVProgram (program_date, content_id, channel) values (TO_DATE('2020-07-15 16:00','YYYY-MM-DD HH24:MI'), '5', 'Disney Ch');

SELECT c.title FROM TVPROGRAM t
JOIN CONTENT c
ON t.content_id=c.content_id
WHERE EXTRACT(MONTH FROM program_date) = 06 AND EXTRACT(YEAR FROM program_date) = 2020 
AND c.kids_content='Y' AND c.content_type='Movies';

DROP TABLE TVPROGRAM PURGE;
DROP TABLE CONTENT PURGE;