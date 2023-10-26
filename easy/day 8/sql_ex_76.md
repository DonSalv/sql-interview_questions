# Calculate Special Bonus

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EMPLOYEES`

| Column Name | Type    |
|-------------|---------|
| employee_id | int     |
| name        | varchar |
| salary      | int     |

`employee_id` is the primary key (column with unique values) for this table.

Each row of this table indicates the `employee` ID, employee `name`, and `salary`.

## Task

Write a solution to calculate the bonus of each employee. 
The bonus of an employee is `100%` of their salary if the ID of the employee is an **odd number** 
and the **employee's name does not start with the character** `'M'`. The bonus of an employee is 0 otherwise.

**Return** the result table ordered by `employee_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
EMPLOYEES table:

| employee_id | name    | salary |
|-------------|---------|--------|
| 2           | Meir    | 3000   |
| 3           | Michael | 3800   |
| 7           | Addilyn | 7400   |
| 8           | Juan    | 6100   |
| 9           | Kannon  | 7700   |

Output: 

| employee_id | bonus |
|-------------|-------|
| 2           | 0     |
| 3           | 0     |
| 7           | 7400  |
| 8           | 0     |
| 9           | 7700  |

## Explanation ##

- The employees with IDs `2` and `8` get `0` bonus because they have an even `employee_id`.
- The employee with ID `3` gets `0` bonus because their name starts with `'M'`.
- The rest of the employees get a `100%` bonus.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create teh employees table
Create table If Not Exists Employees (employee_id int, name varchar(30), salary int)

-- Populate the employees table    
Truncate table Employees
insert into Employees (employee_id, name, salary) values ('2', 'Meir', '3000')
insert into Employees (employee_id, name, salary) values ('3', 'Michael', '3800')
insert into Employees (employee_id, name, salary) values ('7', 'Addilyn', '7400')
insert into Employees (employee_id, name, salary) values ('8', 'Juan', '6100')
insert into Employees (employee_id, name, salary) values ('9', 'Kannon', '7700')
```

### Pandas Code

```python
# employees data
data = [[2, 'Meir', 3000], [3, 'Michael', 3800], [7, 'Addilyn', 7400], 
        [8, 'Juan', 6100], [9, 'Kannon', 7700]]

# employees dataframe
employees = pd.DataFrame(data, 
                         columns=['employee_id', 'name', 'salary']) \
                        .astype({'employee_id':'int64', 'name':'object', 'salary':'int64'})
```