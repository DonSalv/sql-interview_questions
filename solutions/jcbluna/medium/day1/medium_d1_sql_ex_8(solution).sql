-- Create the suveylog table
CREATE TABLE SurveyLog (id int, action varchar(255), question_id int, answer_id int, q_num int, timestamp int);

-- Populate the surveylog table    
TRUNCATE TABLE SurveyLog;
INSERT INTO SurveyLog (id, action, question_id, answer_id, q_num, timestamp) VALUES ('5', 'show', '285', NULL, '1', '123');
INSERT INTO SurveyLog (id, action, question_id, answer_id, q_num, timestamp) VALUES ('5', 'answer', '285', '124124', '1', '124');
INSERT INTO SurveyLog (id, action, question_id, answer_id, q_num, timestamp) VALUES ('5', 'show', '369', NULL, '2', '125');
INSERT INTO SurveyLog (id, action, question_id, answer_id, q_num, timestamp) VALUES ('5', 'skip', '369', NULL, '2', '126');

-- Solve the exercise
SELECT survey_log
FROM(SELECT question_id AS survey_log
FROM SurveyLog
GROUP BY question_id
ORDER BY COUNT(CASE action WHEN 'answer' THEN 1
                ELSE 0 END)*COUNT(CASE action WHEN 'show' THEN 1
                ELSE 0 END) DESC, question_id ASC)
-- Write the query without the FETCH NEXT clause
WHERE ROWNUM=1;

-- Drop unused table
DROP TABLE SurveyLog;