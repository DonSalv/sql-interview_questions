Create table SurveyLog (id int, action varchar(255), question_id int, answer_id int, q_num int, timestamp int);

insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '285', NULL, '1', '123');
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'answer', '285', '124124', '1', '124');
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '369', NULL, '2', '125');
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'skip', '369', NULL, '2', '126');

SELECT question_id AS survey_log FROM
(SELECT question_id,
COUNT(CASE WHEN action = 'answer' THEN id END) /
COUNT(CASE WHEN action = 'show' THEN id END) AS answer_rate
FROM SurveyLog GROUP BY question_id
ORDER BY answer_rate DESC, question_id)
FETCH FIRST 1 ROWS ONLY;

DROP TABLE SurveyLog PURGE;