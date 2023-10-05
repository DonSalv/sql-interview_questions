# Reported Posts

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ACTIONS`

| Column Name | Type    |
|-------------|---------|
| user_id     | int     |
| post_id     | int     |
| action_date | date    | 
| action      | enum    |
| extra       | varchar |

This table may have duplicate rows.
The `action` column is an `ENUM` (category) type of `('view', 'like', 'reaction', 'comment', 'report', 'share')`.
The `extra` column has optional information about the action, such as a reason for the report or a type of reaction.
`extra` is never NULL.

## Task

Write a solution to report the number of posts reported yesterday for each report reason. 
Assume today is `2019-07-05`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
actions table:

| user_id | post_id | action_date | action | extra  |
|---------|---------|-------------|--------|--------|
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 4       | 2019-07-04  | view   | null   |
| 2       | 4       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-04  | view   | null   |
| 5       | 2       | 2019-07-04  | report | racism |
| 5       | 5       | 2019-07-04  | view   | null   |
| 5       | 5       | 2019-07-04  | report | racism |

Output: 

| report_reason | report_count |
|---------------|--------------|
| spam          | 1            |
| racism        | 2            |

## Explanation ##

Note that we only care about report reasons with non-zero number of reports.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the actions table
Create table If Not Exists Actions (user_id int, post_id int, action_date date, action ENUM('view', 'like', 'reaction', 'comment', 'report', 'share'), extra varchar(10))

-- Populate the actions table
Truncate table Actions
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'like', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'share', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '4', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '4', '2019-07-04', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', '2019-07-04', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', '2019-07-02', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', '2019-07-02', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', '2019-07-04', 'report', 'racism')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', '2019-07-04', 'report', 'racism')
```

### Pandas Code

```python
# actions data
data = [[1, 1, '2019-07-01', 'view', None], 
        [1, 1, '2019-07-01', 'like', None], 
        [1, 1, '2019-07-01', 'share', None], 
        [2, 4, '2019-07-04', 'view', None], 
        [2, 4, '2019-07-04', 'report', 'spam'], 
        [3, 4, '2019-07-04', 'view', None], 
        [3, 4, '2019-07-04', 'report', 'spam'], 
        [4, 3, '2019-07-02', 'view', None], 
        [4, 3, '2019-07-02', 'report', 'spam'], 
        [5, 2, '2019-07-04', 'view', None], 
        [5, 2, '2019-07-04', 'report', 'racism'], 
        [5, 5, '2019-07-04', 'view', None], 
        [5, 5, '2019-07-04', 'report', 'racism']]

# actions dataframe
actions = pd.DataFrame(data, 
                       columns=['user_id', 'post_id', 'action_date', 'action', 'extra']) \
                       .astype({'user_id':'Int64', 
                                'post_id':'Int64', 
                                'action_date':'datetime64[ns]', 
                                'action':'object', 
                                'extra':'object'})
```