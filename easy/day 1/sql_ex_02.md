# Employees Earning More Than Their Managers

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
| salary      | int     |
| managerId   | int     |

`id` is the primary key (column with unique values) for this table.
Each row of this table indicates the `ID` of an employee, their `name`, `salary`, and the `ID` of their manager.

## Task

Write a solution to find the employees who earn more than their managers.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Employee table:

| id   | name  | salary | managerId |
|------|-------|--------|-----------|
| 1    | Joe   | 70000  | 3         |
| 2    | Henry | 80000  | 4         |
| 3    | Sam   | 60000  | Null      |
| 4    | Max   | 90000  | Null      |

Output: 

| Employee |
|----------|
| Joe      |

## Explanation ##

Joe is the only employee who earns more than his manager.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int)

-- Populate the employee table
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', 'None')
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', 'None')
```

### Pandas Code

```python
# employee data
data = [[1, 'Joe', 70000, 3], 
        [2, 'Henry', 80000, 4], 
        [3, 'Sam', 60000, None], 
        [4, 'Max', 90000, None]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['id', 'name', 'salary', 'managerId']) \
                        .astype({'id':'Int64', 
                                 'name':'object', 
                                 'salary':'Int64', 
                                 'managerId':'Int64'})

```