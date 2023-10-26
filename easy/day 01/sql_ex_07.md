# Employee Bonus

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EMPLOYEE`

| Column Name | Type    |
|-------------|---------|
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |

`empId` is the column with unique values for this table.
Each row of this table indicates the `name` and the `ID` of an employee in addition to their `salary` and the id of 
their `manager`.

**Table**: `BONUS`

| Column Name | Type |
|-------------|------|
| empId       | int  |
| bonus       | int  |

`empId` is the column of unique values for this table.
`empId` is a foreign key (reference column) to `empId` from the `EMPLOYEE` table.
Each row of this table contains the id of an employee and their respective `bonus`.

## Task

Write a solution to report the name and bonus amount of each employee with a bonus less than `1000`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Employee table:

| empId | name   | supervisor | salary |
|-------|--------|------------|--------|
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |

Bonus table:

| empId | bonus |
|-------|-------|
| 2     | 500   |
| 4     | 2000  |

Output: 

| name | bonus |
|------|-------|
| Brad | null  |
| John | null  |
| Dan  | 500   |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Employee (empId int, name varchar(255), supervisor int, salary int)
Create table If Not Exists Bonus (empId int, bonus int)

-- Populate the employee table
Truncate table Employee
insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', 'None', '4000')
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000')
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000')
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000')

-- Populate the bouns table
Truncate table Bonus
insert into Bonus (empId, bonus) values ('2', '500')
insert into Bonus (empId, bonus) values ('4', '2000')
```

### Pandas Code

```python
# employee data
data = [[3, 'Brad', None, 4000], 
        [1, 'John', 3, 1000], 
        [2, 'Dan', 3, 2000], 
        [4, 'Thomas', 3, 4000]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['empId', 'name', 'supervisor', 'salary']) \
                        .astype({'empId':'Int64', 
                                 'name':'object', 
                                 'supervisor':'Int64', 
                                 'salary':'Int64'})

# bouns data
data = [[2, 500], [4, 2000]]

# bonus dataframe
bonus = pd.DataFrame(data, 
                     columns=['empId', 'bonus']) \
                     .astype({'empId':'Int64', 
                              'bonus':'Int64'})
```
