-- Create the suveylog table
Create table SurveyLog (id int, action varchar(10), question_id int, answer_id int, q_num int, timestamp int);

-- Populate the surveylog table    
Truncate table SurveyLog;
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values (5, 'show', 285, NULL, 1, 123);
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values (5, 'answer', 285, 124124, 1, 124);
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values (5, 'show', 369, NULL, 2, 125);
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values (5, 'skip', 369, NULL, 2, 126);

-- The answer rate for a question is the number of times a user answered the question by the number of times a user showed the question.
-- Write a solution to report the question that has the highest answer rate. If multiple questions have the same maximum answer rate, report the question with the smallest question_id
WITH answer_rates AS (
    SELECT
        question_id,
        COUNT(CASE WHEN action = 'answer' THEN 1 END) / COUNT(CASE WHEN action = 'show' THEN 1 END) AS answer_rate
    FROM
        SurveyLog
    WHERE
        action IN ('show', 'answer')
    GROUP BY
        question_id
)  
SELECT 
    MIN(question_id) AS survey_log 
FROM 
    answer_rates 
WHERE 
    answer_rate = (SELECT 
                       MAX(answer_rate) 
                   FROM 
                       answer_rates);
    
-- Drop tables
DROP TABLE SurveyLog;
