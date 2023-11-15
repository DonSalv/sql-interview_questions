# Employees Whose Manager Left the Company

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
| manager_id  | int     |
| salary      | int     |

In `SQL`, `employee_id` is the primary key for this table.

This table contains information about the `employees`, their `salary`, and the ID of their `manager`. 
Some employees do not have a manager (`manager_id` is `null`). 

## Task

Find the IDs of the employees whose salary is strictly less than `$30000` and whose manager left the company.
When a manager leaves the company, their information is deleted from the `EMPLOYEES` table, 
but the reports still have their `manager_id` set to the manager that left.

**Return** the result table ordered by `employee_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input:  
EMPLOYEES table:

| employee_id | name      | manager_id | salary |
|-------------|-----------|------------|--------|
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |

Output: 

| employee_id |
|-------------|
| 11          |


## Explanation ##

- The employees with a salary less than `$30000` are `1` (`Kalel`) and `11` (`Joziah`).
- `Kalel`'s manager is employee `11`, who is still in the company (`Joziah`).
- `Joziah`'s manager is employee `6`, who left the company because there is no row for employee `6` as it was deleted.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the employees table
Create table If Not Exists Employees (employee_id int, name varchar(20), manager_id int, salary int)

-- Populate the employees table
Truncate table Employees
insert into Employees (employee_id, name, manager_id, salary) values ('3', 'Mila', '9', '60301')
insert into Employees (employee_id, name, manager_id, salary) values ('12', 'Antonella', 'None', '31000')
insert into Employees (employee_id, name, manager_id, salary) values ('13', 'Emery', 'None', '67084')
insert into Employees (employee_id, name, manager_id, salary) values ('1', 'Kalel', '11', '21241')
insert into Employees (employee_id, name, manager_id, salary) values ('9', 'Mikaela', 'None', '50937')
insert into Employees (employee_id, name, manager_id, salary) values ('11', 'Joziah', '6', '28485')
```

### Pandas Code

```python
# employees data
data = [[3, 'Mila', 9, 60301], [12, 'Antonella', None, 31000], [13, 'Emery', None, 67084], 
        [1, 'Kalel', 11, 21241], [9, 'Mikaela', None, 50937], [11, 'Joziah', 6, 28485]]

# employees dataframe
employees = pd.DataFrame(data, 
                         columns=['employee_id', 'name', 'manager_id', 'salary']) \
                        .astype({'employee_id':'Int64', 'name':'object', 
                                 'manager_id':'Int64', 'salary':'Int64'})
```