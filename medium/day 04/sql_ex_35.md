# All People Report to the Given Manager

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: EMPLOYEES

| Column Name   | Type    |
|---------------|---------|
| employee_id   | int     |
| employee_name | varchar |
| manager_id    | int     |

`employee_id` is the column of unique values for this table.

Each row of this table indicates that the employee with ID `employee_id` and name `employee_name` reports his 
work to his/her direct manager with `manager_id`

The head of the company is the employee with `employee_id = 1`.

## Task

Write a solution to find `employee_id` of all employees that directly or indirectly report their work to 
the head of the company.

The indirect relation between managers **will not exceed three managers** as the company is small.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
EMPLOYEES table:

| employee_id | employee_name | manager_id |
|-------------|---------------|------------|
| 1           | Boss          | 1          |
| 3           | Alice         | 3          |
| 2           | Bob           | 1          |
| 4           | Daniel        | 2          |
| 7           | Luis          | 4          |
| 8           | Jhon          | 3          |
| 9           | Angela        | 8          |
| 77          | Robert        | 1          |

Output: 

| employee_id |
|-------------|
| 2           |
| 77          |
| 4           |
| 7           |

## Explanation ##

- The head of the company is the employee with `employee_id 1`.
- The employees with `employee_id` `2` and `77` report their work directly to the head of the company.
- The employee with `employee_id` `4` reports their work indirectly to the head of the company `4 --> 2 --> 1`. 
- The employee with `employee_id` `7` reports their work indirectly to the head of the company` 7 --> 4 --> 2 --> 1`.
- The employees with `employee_id` `3`, `8`, and `9` do not report their work to the head of the company directly or 
indirectly. 

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the employees table
Create table If Not Exists Employees (employee_id int, employee_name varchar(30), manager_id int)

-- Populate the employees table
Truncate table Employees
insert into Employees (employee_id, employee_name, manager_id) values ('1', 'Boss', '1')
insert into Employees (employee_id, employee_name, manager_id) values ('3', 'Alice', '3')
insert into Employees (employee_id, employee_name, manager_id) values ('2', 'Bob', '1')
insert into Employees (employee_id, employee_name, manager_id) values ('4', 'Daniel', '2')
insert into Employees (employee_id, employee_name, manager_id) values ('7', 'Luis', '4')
insert into Employees (employee_id, employee_name, manager_id) values ('8', 'John', '3')
insert into Employees (employee_id, employee_name, manager_id) values ('9', 'Angela', '8')
insert into Employees (employee_id, employee_name, manager_id) values ('77', 'Robert', '1')
```

### Pandas Code

```python
# employees data
data = [[1, 'Boss', 1], [3, 'Alice', 3], [2, 'Bob', 1], [4, 'Daniel', 2], 
        [7, 'Luis', 4], [8, 'John', 3], [9, 'Angela', 8], [77, 'Robert', 1]]

# employees dataframe
employees = pd.DataFrame(data, 
                         columns=['employee_id', 'employee_name', 'manager_id']) \
                        .astype({'employee_id':'Int64', 'employee_name':'object', 'manager_id':'Int64'})
```