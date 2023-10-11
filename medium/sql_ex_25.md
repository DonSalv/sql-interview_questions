# Reported Posts II

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables

**Table**: `ACTIONS`

| Column Name | Type     |
|-------------|----------|
| user_id     | int      |
| post_id     | int      |
| action_date | date     | 
| action      | enum     |
| extra       | varchar  |

This table may have duplicate rows.

The action column is an `ENUM` (category) type of `('view', 'like', 'reaction', 'comment', 'report', 'share')`.

The extra column has optional information about the action, such as a reason for the report or a type of reaction.

**Table**: `REMOVALS`

| Column Name | Type |
|-------------|------|
| post_id     | int  |
| remove_date | date | 

`post_id` is the primary key (column with unique values) of this table.

Each row in this table indicates that some post was removed due to being reported or as a result of an admin review.

## Task

Write a solution to find the average daily percentage of posts that got removed after being reported as spam, 
**rounded to 2 decimal places**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ACTIONS table:

| user_id | post_id | action_date | action | extra  |
|---------|---------|-------------|--------|--------|
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 2       | 2019-07-04  | view   | null   |
| 2       | 2       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-03  | view   | null   |
| 5       | 2       | 2019-07-03  | report | racism |
| 5       | 5       | 2019-07-03  | view   | null   |
| 5       | 5       | 2019-07-03  | report | racism |

REMOVALS table:

| post_id | remove_date |
|---------|-------------|
| 2       | 2019-07-20  |
| 3       | 2019-07-18  |

Output: 

| average_daily_percent |
|-----------------------|
| 75.00                 |

## Explanation ##

- The `percentage` for `2019-07-04` is `50%` because only one post of two spam reported posts were removed.
- The `percentage` for `2019-07-02` is `100%` because one post was reported as spam and it was removed.
- The other days had no spam reports so the average is `(50 + 100) / 2 = 75%`

Note that the output is only one number and that we do not care about the remove dates.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Actions (user_id int, post_id int, action_date date, action ENUM('view', 'like', 'reaction', 'comment', 'report', 'share'), extra varchar(10))
create table if not exists Removals (post_id int, remove_date date)

-- Populate the actions table
Truncate table Actions
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'like', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'share', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '2', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '2', '2019-07-04', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', '2019-07-04', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', '2019-07-02', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', '2019-07-02', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', '2019-07-03', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', '2019-07-03', 'report', 'racism')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', '2019-07-03', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', '2019-07-03', 'report', 'racism')

-- Populate the removals table
Truncate table Removals
insert into Removals (post_id, remove_date) values ('2', '2019-07-20')
insert into Removals (post_id, remove_date) values ('3', '2019-07-18')
```

### Pandas Code

```python
# actions data
data = [[1, 1, '2019-07-01', 'view', None], [1, 1, '2019-07-01', 'like', None], 
        [1, 1, '2019-07-01', 'share', None], [2, 2, '2019-07-04', 'view', None], 
        [2, 2, '2019-07-04', 'report', 'spam'], [3, 4, '2019-07-04', 'view', None], 
        [3, 4, '2019-07-04', 'report', 'spam'], [4, 3, '2019-07-02', 'view', None], 
        [4, 3, '2019-07-02', 'report', 'spam'], [5, 2, '2019-07-03', 'view', None], 
        [5, 2, '2019-07-03', 'report', 'racism'], [5, 5, '2019-07-03', 'view', None], 
        [5, 5, '2019-07-03', 'report', 'racism']]

# actions dataframe
actions = pd.DataFrame(data, 
                       columns=['user_id', 'post_id', 'action_date', 'action', 'extra']) \
                      .astype({'user_id':'Int64', 'post_id':'Int64', 'action_date':'datetime64[ns]', 
                               'action':'object', 'extra':'object'})

# removals data
data = [[2, '2019-07-20'], [3, '2019-07-18']]

# removals dataframe
removals = pd.DataFrame(data, 
                        columns=['post_id', 'remove_date']) \
                       .astype({'post_id':'Int64', 'remove_date':'datetime64[ns]'})
```