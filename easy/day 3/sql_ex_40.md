# Find the Team Size

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EMPLOYEE`

| Column Name | Type |
|-------------|------|
| employee_id | int  |
| team_id     | int  |

`employee_id` is the primary key (column with unique values) for this table.
Each row of this table contains the ID of each `employee` and their respective `team`.

## Task

Write a solution to find the team size of each of the employees.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Employee Table:

| employee_id | team_id |
|-------------|---------|
| 1           | 8       |
| 2           | 8       |
| 3           | 8       |
| 4           | 7       |
| 5           | 9       |
| 6           | 9       |

Output: 

| employee_id | team_size |
|-------------|-----------|
| 1           | 3         |
| 2           | 3         |
| 3           | 3         |
| 4           | 1         |
| 5           | 2         |
| 6           | 2         |

## Explanation ##

- Employees with `Id` `1,2,3` are part of a team with `team_id = 8`.
- Employee with `Id` `4` is part of a team with `team_id = 7`.
- Employees with `Id` `5, 6` are part of a team with `team_id = 9`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the employee table
Create table If Not Exists Employee (employee_id int, team_id int)
    
-- Populate the employee table
Truncate table Employee
insert into Employee (employee_id, team_id) values ('1', '8')
insert into Employee (employee_id, team_id) values ('2', '8')
insert into Employee (employee_id, team_id) values ('3', '8')
insert into Employee (employee_id, team_id) values ('4', '7')
insert into Employee (employee_id, team_id) values ('5', '9')
insert into Employee (employee_id, team_id) values ('6', '9')
```

### Pandas Code

```python
# employee data
data = [[1, 8], [2, 8], [3, 8], [4, 7], [5, 9], [6, 9]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['employee_id', 'team_id']) \
                        .astype({'employee_id':'Int64', 
                                 'team_id':'Int64'})
```