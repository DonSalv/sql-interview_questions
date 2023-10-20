# Tasks Count in the Weekend

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: TASKS

| Column Name | Type |
|-------------|------|
| task_id     | int  |
| assignee_id | int  |
| submit_date | date |

`task_id` is the primary key (column with unique values) for this table.

Each row in this table contains the ID of a `task`, the id of the `assignee`, and the submission `date`.

## Task

Write a solution to report:
- the number of tasks that were submitted during the weekend (Saturday, Sunday) as `weekend_cnt`, and
- the number of tasks that were submitted during the working days as `working_cnt`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is shown in the following example.

Example 1:

Input: 
TASKS table:

| task_id | assignee_id | submit_date |
|---------|-------------|-------------|
| 1       | 1           | 2022-06-13  |
| 2       | 6           | 2022-06-14  |
| 3       | 6           | 2022-06-15  |
| 4       | 3           | 2022-06-18  |
| 5       | 5           | 2022-06-19  |
| 6       | 7           | 2022-06-19  |

Output: 

| weekend_cnt | working_cnt |
|-------------|-------------|
| 3           | 3           |

## Explanation ##

- Task `1` was submitted on `Monday`.
- Task `2` was submitted on `Tuesday`.
- Task `3` was submitted on `Wednesday`.
- Task `4` was submitted on `Saturday`.
- Task `5` was submitted on `Sunday`.
- Task `6` was submitted on `Sunday`.

`3` tasks were submitted during the weekend. `3` tasks were submitted during the working days.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tasks table
Create table If Not Exists Tasks (task_id int, assignee_id int, submit_date date)

-- Populate the tasks table    
Truncate table Tasks
insert into Tasks (task_id, assignee_id, submit_date) values ('1', '1', '2022-06-13')
insert into Tasks (task_id, assignee_id, submit_date) values ('2', '6', '2022-06-14')
insert into Tasks (task_id, assignee_id, submit_date) values ('3', '6', '2022-06-15')
insert into Tasks (task_id, assignee_id, submit_date) values ('4', '3', '2022-06-18')
insert into Tasks (task_id, assignee_id, submit_date) values ('5', '5', '2022-06-19')
insert into Tasks (task_id, assignee_id, submit_date) values ('6', '7', '2022-06-19')
```

### Pandas Code

```python
# tasks data
data = [[1, 1, '2022-06-13'], [2, 6, '2022-06-14'], [3, 6, '2022-06-15'], 
        [4, 3, '2022-06-18'], [5, 5, '2022-06-19'], [6, 7, '2022-06-19']]

# tasks dataframe
tasks = pd.DataFrame(data, 
                     columns=['task_id', 'assignee_id', 'submit_date']) \
                    .astype({'task_id':'Int64', 'assignee_id':'Int64', 'submit_date':'datetime64[ns]'})
```