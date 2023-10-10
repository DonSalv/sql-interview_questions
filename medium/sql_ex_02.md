# Nth Highest Salary

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EMPLOYEE`

| Column Name | Type |
|-------------|------|
| id          | int  |
| salary      | int  |

`id` is the primary key (column with unique values) for this table.

Each row of this table contains information about the `salary` of an `employee`.

## Task

Write a solution to find the `nth` highest salary from the `EMPLOYEE` table. 
If there is no `nth` highest salary, return `null`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
EMPLOYEE table:

| id  | salary |
|-----|--------|
| 1   | 100    |
| 2   | 200    |
| 3   | 300    |

`n = 2`
Output: 

| getNthHighestSalary(2) |
|------------------------|
| 200                    |

Example 2:

Input: 
EMPLOYEE table:

| id  | salary |
|-----|--------|
| 1   | 100    |

`n = 2`
Output: 

| getNthHighestSalary(2) |
|------------------------|
| null                   |

## Explanation ##

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the employee table
Create table If Not Exists Employee (id int, salary int)

-- Populate the employee table    
Truncate table Employee
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')
```

### Pandas Code

```python
# employee data
data = [[1, 100], [2, 200], [3, 300]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['id', 'salary']) \
                       .astype({'id':'int64', 'salary':'int64'})
```