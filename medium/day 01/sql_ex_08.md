# Get Highest Answer Rate Question

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SURVEYLOG`

| Column Name | Type |
|-------------|------|
| id          | int  |
| action      | ENUM |
| question_id | int  |
| answer_id   | int  |
| q_num       | int  |
| timestamp   | int  |

This table may contain duplicate rows.

`action` is an `ENUM` (category) of the type: `"show"`, `"answer"`, or `"skip"`.

Each row of this table indicates the user with `ID = id` has taken an action with the question 
`question_id` at time `timestamp`.

If the action taken by the user is `"answer"`, `answer_id` will contain the id of that answer, otherwise, it will 
be `null`.

`q_num` is the numeral order of the question in the current session.

## Task

The **answer rate** for a question is the number of times a user answered the question by the number of times a 
user showed the question.

Write a solution to report the question that has the highest **answer rate**. If multiple questions have the same 
maximum **answer rate**, report the question with the smallest `question_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SURVEYLOG table:

| id  | action | question_id | answer_id | q_num | timestamp |
|-----|--------|-------------|-----------|-------|-----------|
| 5   | show   | 285         | null      | 1     | 123       |
| 5   | answer | 285         | 124124    | 1     | 124       |
| 5   | show   | 369         | null      | 2     | 125       |
| 5   | skip   | 369         | null      | 2     | 126       |

Output: 

| survey_log |
|------------|
| 285        |

## Explanation ##

- Question `285` was showed `1` time and answered 1 time. The **answer rate** of question `285` is `1.0`
- Question `369` was showed `1` time and was not answered. The **answer rate** of question `369` is `0.0`
- Question `285` has the highest **answer rate**.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the suveylog table
Create table If Not Exists SurveyLog (id int, action varchar(255), question_id int, answer_id int, q_num int, timestamp int)

-- Populate the surveylog table    
Truncate table SurveyLog
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '285', 'None', '1', '123')
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'answer', '285', '124124', '1', '124')
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '369', 'None', '2', '125')
insert into SurveyLog (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'skip', '369', 'None', '2', '126')
```

### Pandas Code

```python
# survey_log data
data = [[5, 'show', 285, None, 1, 123], 
        [5, 'answer', 285, 124124, 1, 124], 
        [5, 'show', 369, None, 2, 125], 
        [5, 'skip', 369, None, 2, 126]]

# survey_log dataframe
survey_log = pd.DataFrame(data, 
                          columns=['id', 'action', 'question_id', 'answer_id', 'q_num', 'timestamp']) \
                         .astype({'id':'Int64', 'action':'object', 'question_id':'Int64', 
                                  'answer_id':'Int64', 'q_num':'Int64', 'timestamp':'Int64'})
```