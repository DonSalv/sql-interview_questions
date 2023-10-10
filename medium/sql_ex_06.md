# Managers with at Least 5 Direct Reports

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EMPLOYEE`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |

`id` is the primary key (column with unique values) for this table.

Each row of this table indicates the `name` of an employee, their `department`, and the id of their `manager`.

If `managerId` is `null`, then the employee does not have a manager.

No employee will be the manager of themself.

## Task

Write a solution to find managers with at least **five direct reports**.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
EMPLOYEE table:

| id  | name  | department | managerId |
|-----|-------|------------|-----------|
| 101 | John  | A          | None      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |

Output: 

| name |
|------|
| John |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the employee table
Create table If Not Exists Employee (id int, name varchar(255), department varchar(255), managerId int)
    
-- Populate the employee table
Truncate table Employee
insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', 'None')
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101')
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101')
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101')
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101')
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101')
```

### Pandas Code

```python
# employee data
data = [[101, 'John', 'A', None], [102, 'Dan', 'A', 101], 
        [103, 'James', 'A', 101], [104, 'Amy', 'A', 101], 
        [105, 'Anne', 'A', 101], [106, 'Ron', 'B', 101]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['id', 'name', 'department', 'managerId']) \
                       .astype({'id':'Int64', 'name':'object', 'department':'object', 'managerId':'Int64'})
```