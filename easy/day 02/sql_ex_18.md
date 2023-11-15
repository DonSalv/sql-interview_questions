# Swap Salary

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SALARY`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| sex         | ENUM    |
| salary      | int     |

`id` is the primary key (column with unique values) for this table.
The `sex` column is `ENUM` (category) value of type `('m', 'f')`.
The table contains information about an employee.

## Task

Write a solution to swap all `'f'` and `'m'` values (i.e., change all `'f'` values to 
`'m'` and vice versa) with a **single update statement** and no intermediate temporary tables.

Note that you must write a single update statement, **do not** write any select statement for this problem.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SALARY table:

| id  | name | sex | salary |
|-----|------|-----|--------|
| 1   | A    | m   | 2500   |
| 2   | B    | f   | 1500   |
| 3   | C    | m   | 5500   |
| 4   | D    | f   | 500    |

Output: 

| id  | name | sex | salary |
|-----|------|-----|--------|
| 1   | A    | f   | 2500   |
| 2   | B    | m   | 1500   |
| 3   | C    | f   | 5500   |
| 4   | D    | m   | 500    |

## Explanation ##
- `(1, A)` and `(3, C)` were changed from `'m'` to `'f'`.
- `(2, B)` and `(4, D)` were changed from `'f'` to `'m'`.
## Schemas & scripts

### SQL Schema

```genericsql
-- Create the salary table
Create table If Not Exists Salary (id int, name varchar(100), sex char(1), salary int)

-- Populate the salary table
Truncate table Salary
insert into Salary (id, name, sex, salary) values ('1', 'A', 'm', '2500')
insert into Salary (id, name, sex, salary) values ('2', 'B', 'f', '1500')
insert into Salary (id, name, sex, salary) values ('3', 'C', 'm', '5500')
insert into Salary (id, name, sex, salary) values ('4', 'D', 'f', '500')
```