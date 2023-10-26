# Project Employees III

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PROJECT`

| Column Name | Type |
|-------------|------|
| project_id  | int  |
| employee_id | int  |

`(project_id, employee_id)` is the primary key (combination of columns with unique values) of this table.

`employee_id` is a foreign key (reference column) to `EMPLOYEE` table.

Each row of this table indicates that the employee with `employee_id` is working on the project with `project_id`.

**Table**: `EMPLOYEE`

| Column Name      | Type    |
|------------------|---------|
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |

`employee_id` is the primary key (column with unique values) of this table.

Each row of this table contains information about one employee.

## Task

Write a solution to report the **most experienced** employees in each project. In case of a tie, report all 
employees with the maximum number of experience years.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PROJECT table:

| project_id | employee_id |
|------------|-------------|
| 1          | 1           |
| 1          | 2           |
| 1          | 3           |
| 2          | 1           |
| 2          | 4           |

EMPLOYEE table:

| employee_id | name   | experience_years |
|-------------|--------|------------------|
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 3                |
| 4           | Doe    | 2                |

Output: 

| project_id | employee_id |
|------------|-------------|
| 1          | 1           |
| 1          | 3           |
| 2          | 1           |

## Explanation ##

Both employees with id `1` and `3` have the most experience among the employees of the first project. 
For the second project, the employee with id `1` has the most experience.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Project (project_id int, employee_id int)
Create table If Not Exists Employee (employee_id int, name varchar(10), experience_years int)

-- Populate the project table    
Truncate table Project
insert into Project (project_id, employee_id) values ('1', '1')
insert into Project (project_id, employee_id) values ('1', '2')
insert into Project (project_id, employee_id) values ('1', '3')
insert into Project (project_id, employee_id) values ('2', '1')
insert into Project (project_id, employee_id) values ('2', '4')
    
-- Populate the employee table
Truncate table Employee
insert into Employee (employee_id, name, experience_years) values ('1', 'Khaled', '3')
insert into Employee (employee_id, name, experience_years) values ('2', 'Ali', '2')
insert into Employee (employee_id, name, experience_years) values ('3', 'John', '3')
insert into Employee (employee_id, name, experience_years) values ('4', 'Doe', '2')
```

### Pandas Code

```python
# project data
data = [[1, 1], [1, 2], [1, 3], [2, 1], [2, 4]]

# project dataframe
project = pd.DataFrame(data, 
                       columns=['project_id', 'employee_id']) \
                      .astype({'project_id':'Int64', 'employee_id':'Int64'})

# employee data
data = [[1, 'Khaled', 3], [2, 'Ali', 2], [3, 'John', 3], [4, 'Doe', 2]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['employee_id', 'name', 'experience_years']) \
                       .astype({'employee_id':'Int64', 'name':'object', 'experience_years':'Int64'})
```