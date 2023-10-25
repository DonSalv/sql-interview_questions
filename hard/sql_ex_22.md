# Find the Subtasks That Did Not Execute

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TASKS`

| Column Name    | Type |
|----------------|------|
| task_id        | int  |
| subtasks_count | int  |

`task_id` is the column with unique values for this table.

Each row in this table indicates that `task_id` was divided into `subtasks_count` subtasks labeled 
from 1 to `subtasks_count`.

It is guaranteed that `2 <= subtasks_count <= 20`.

**Table**: `EXECUTED`

| Column Name | Type |
|-------------|------|
| task_id     | int  |
| subtask_id  | int  |

`(task_id, subtask_id)` is the combination of columns with unique values for this table.

Each row in this table indicates that for the task `task_id`, the subtask with ID 
`subtask_id` was executed successfully.

It is guaranteed that `subtask_id <= subtasks_count` for each `task_id`.

## Task

Write a solution to report the IDs of the missing subtasks for each `task_id`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TASKS table:

| task_id | subtasks_count |
|---------|----------------|
| 1       | 3              |
| 2       | 2              |
| 3       | 4              |

EXECUTED table:

| task_id | subtask_id |
|---------|------------|
| 1       | 2          |
| 3       | 1          |
| 3       | 2          |
| 3       | 3          |
| 3       | 4          |

Output: 

| task_id | subtask_id |
|---------|------------|
| 1       | 1          |
| 1       | 3          |
| 2       | 1          |
| 2       | 2          |


## Explanation ##

- `Task 1` was divided into `3` subtasks (`1`, `2`, `3`). Only subtask `2` was executed successfully, 
so we include (`1`, `1`) and (`1`, `3`) in the answer.
- `Task 2` was divided into `2` subtasks (`1`, `2`). No subtask was executed successfully, 
so we include (`2`, `1`) and (`2`, `2`) in the answer.
- `Task 3` was divided into `4` subtasks (`1`, `2`, `3`, `4`). All of the subtasks were executed successfully.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Tasks (task_id int, subtasks_count int)
Create table If Not Exists Executed (task_id int, subtask_id int)

-- Populate the tasks table    
Truncate table Tasks
insert into Tasks (task_id, subtasks_count) values ('1', '3')
insert into Tasks (task_id, subtasks_count) values ('2', '2')
insert into Tasks (task_id, subtasks_count) values ('3', '4')
    
-- Populate the executed table
Truncate table Executed
insert into Executed (task_id, subtask_id) values ('1', '2')
insert into Executed (task_id, subtask_id) values ('3', '1')
insert into Executed (task_id, subtask_id) values ('3', '2')
insert into Executed (task_id, subtask_id) values ('3', '3')
insert into Executed (task_id, subtask_id) values ('3', '4')
```

### Pandas Code

```python
# tasks data
data = [[1, 3], [2, 2], [3, 4]]

# tasks dataframe
tasks = pd.DataFrame(data, 
                     columns=['task_id', 'subtasks_count']) \
                    .astype({'task_id':'Int64', 'subtasks_count':'Int64'})

# executed data
data = [[1, 2], [3, 1], [3, 2], [3, 3], [3, 4]]

# executed dataframe
executed = pd.DataFrame(data, 
                        columns=['task_id', 'subtask_id']) \
                       .astype({'task_id':'Int64', 'subtask_id':'Int64'})
```