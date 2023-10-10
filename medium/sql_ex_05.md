# Department Highest Salary

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EMPLOYEE`

| Column Name  | Type    |
|--------------|---------|
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |

`id` is the primary key (column with unique values) for this table.

`departmentId` is a foreign key (reference columns) of the ID from the `DEPARTMENT` table.

Each row of this table indicates the `ID`, `name`, and `salary` of an employee. It also contains the ID of their 
department.

**Table**: `DEPARTMENT`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the primary key (column with unique values) for this table. It is guaranteed that department name is not `NULL`.

Each row of this table indicates the `ID` of a department and its `name`.

## Task

Write a solution to find employees who have the highest salary in each of the departments.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
`EMPLOYEE` table:

| id  | name  | salary | departmentId |
|-----|-------|--------|--------------|
| 1   | Joe   | 70000  | 1            |
| 2   | Jim   | 90000  | 1            |
| 3   | Henry | 80000  | 2            |
| 4   | Sam   | 60000  | 2            |
| 5   | Max   | 90000  | 1            |

`DEPARTMENT` table:

| id  | name  |
|-----|-------|
| 1   | IT    |
| 2   | Sales |

Output: 

| Department | Employee | Salary |
|------------|----------|--------|
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |

## Explanation ##

`Max` and `Jim` both have the highest salary in the `IT` department and Henry has the highest salary in the `Sales`
department.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int)
Create table If Not Exists Department (id int, name varchar(255))

-- Populate the employee table    
Truncate table Employee
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1')
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1')
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2')
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2')
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1')

-- Populate the department table
Truncate table Department
insert into Department (id, name) values ('1', 'IT')
insert into Department (id, name) values ('2', 'Sales')
```

### Pandas Code

```python
# employee data
data = [[1, 'Joe', 70000, 1], [2, 'Jim', 90000, 1], [3, 'Henry', 80000, 2], 
        [4, 'Sam', 60000, 2], [5, 'Max', 90000, 1]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['id', 'name', 'salary', 'departmentId']) \
                       .astype({'id':'Int64', 'name':'object', 'salary':'Int64', 'departmentId':'Int64'})

# department data
data = [[1, 'IT'], [2, 'Sales']]

# department dataframe
department = pd.DataFrame(data, 
                          columns=['id', 'name']) \
                         .astype({'id':'Int64', 'name':'object'})
```