# Students With Invalid Departments

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `DEPARTMENTS`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

In `SQL`, `id` is the primary key of this table.
The table has information about the id of each department of a university.

**Table**: `STUDENTS`

| Column Name   | Type    |
|---------------|---------|
| id            | int     |
| name          | varchar |
| department_id | int     |

In `SQL`, `id` is the primary key of this table.
The table has information about the id of each student at a university and the id of the department he/she studies at.

## Task

Find the id and the name of all students who are enrolled in departments that no longer exist.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
DEPARTMENTS table:

| id  | name                     |
|-----|--------------------------|
| 1   | Electrical Engineering   |
| 7   | Computer Engineering     |
| 13  | Bussiness Administration |

STUDENTS table:

| id  | name     | department_id |
|-----|----------|---------------|
| 23  | Alice    | 1             |
| 1   | Bob      | 7             |
| 5   | Jennifer | 13            |
| 2   | John     | 14            |
| 4   | Jasmine  | 77            |
| 3   | Steve    | 74            |
| 6   | Luis     | 1             |
| 8   | Jonathan | 7             |
| 7   | Daiana   | 33            |
| 11  | Madelynn | 1             |

Output: 

| id  | name    |
|-----|---------|
| 2   | John    |
| 7   | Daiana  |
| 4   | Jasmine |
| 3   | Steve   |

## Explanation ##

- `John`, `Daiana`, `Steve`, and `Jasmine` are enrolled in departments `14`, `33`, `74`, and `77` respectively. 
- `Department` `14`, `33`, `74`, and `77` do not exist in the Departments table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Departments (id int, name varchar(30))
Create table If Not Exists Students (id int, name varchar(30), department_id int)
    
-- Populate the departments table
Truncate table Departments
insert into Departments (id, name) values ('1', 'Electrical Engineering')
insert into Departments (id, name) values ('7', 'Computer Engineering')
insert into Departments (id, name) values ('13', 'Bussiness Administration')
    
-- Populate the students table
Truncate table Students
insert into Students (id, name, department_id) values ('23', 'Alice', '1')
insert into Students (id, name, department_id) values ('1', 'Bob', '7')
insert into Students (id, name, department_id) values ('5', 'Jennifer', '13')
insert into Students (id, name, department_id) values ('2', 'John', '14')
insert into Students (id, name, department_id) values ('4', 'Jasmine', '77')
insert into Students (id, name, department_id) values ('3', 'Steve', '74')
insert into Students (id, name, department_id) values ('6', 'Luis', '1')
insert into Students (id, name, department_id) values ('8', 'Jonathan', '7')
insert into Students (id, name, department_id) values ('7', 'Daiana', '33')
insert into Students (id, name, department_id) values ('11', 'Madelynn', '1')
```

### Pandas Code

```python
# departments data
data = [[1, 'Electrical Engineering'], [7, 'Computer Engineering'], 
        [13, 'Bussiness Administration']]

# departments dataframe
departments = pd.DataFrame(data, columns=['id', 'name']).astype({'id':'Int64', 'name':'object'})

# students data
data = [[23, 'Alice', 1], [1, 'Bob', 7], [5, 'Jennifer', 13], 
        [2, 'John', 14], [4, 'Jasmine', 77], [3, 'Steve', 74], 
        [6, 'Luis', 1], [8, 'Jonathan', 7], [7, 'Daiana', 33], 
        [11, 'Madelynn', 1]]

# students dataframe
students = pd.DataFrame(data, 
                        columns=['id', 'name', 'department_id']) \
                        .astype({'id':'Int64', 
                                 'name':'object', 
                                 'department_id':'Int64'})
```