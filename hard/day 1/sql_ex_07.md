# Average Salary: Departments VS Company

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SALARY`

| Column Name | Type |
|-------------|------|
| id          | int  |
| employee_id | int  |
| amount      | int  |
| pay_date    | date |

In `SQL`, id is the primary key column for this table.

Each row of this table indicates the `salary` of an employee in one month.

`employee_id` is a foreign key (reference column) from the `EMPLOYEE` table.

**Table**: `EMPLOYEE`

| Column Name   | Type |
|---------------|------|
| employee_id   | int  |
| department_id | int  |

In `SQL`, `employee_id` is the primary key column for this table.

Each row of this table indicates the department of an employee.

## Task

Find the comparison result (**higher/lower/same**) of the average salary of employees in a department to the company's 
average salary.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SALARY table:

| id  | employee_id | amount | pay_date   |
|-----|-------------|--------|------------|
| 1   | 1           | 9000   | 2017/03/31 |
| 2   | 2           | 6000   | 2017/03/31 |
| 3   | 3           | 10000  | 2017/03/31 |
| 4   | 1           | 7000   | 2017/02/28 |
| 5   | 2           | 6000   | 2017/02/28 |
| 6   | 3           | 8000   | 2017/02/28 |

EMPLOYEE table:

| employee_id | department_id |
|-------------|---------------|
| 1           | 1             |
| 2           | 2             |
| 3           | 2             |

Output: 

| pay_month | department_id | comparison |
|-----------|---------------|------------|
| 2017-02   | 1             | same       |
| 2017-03   | 1             | higher     |
| 2017-02   | 2             | same       |
| 2017-03   | 2             | lower      |

## Explanation ##

In March, the company's average salary is (9000+6000+10000)/3 = 8333.33...
- The average salary for department `'1'` is `9000`, which is the salary of `employee_id '1'` since there is only one 
employee in this department. So the comparison result is `higher` since `9000 > 8333.33` obviously.
- The average salary of department `'2'` is (6000 + 10000)/2 = 8000, which is the average of `employee_id` `'2'` and `'3'`. 
So the comparison result is 'lower' since `8000 < 8333.33`.

With he same formula for the average salary comparison in February, the result is `'same'` since both the 
department `'1'` and `'2'` have the same average salary with the company, which is `7000`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Salary (id int, employee_id int, amount int, pay_date date)
Create table If Not Exists Employee (employee_id int, department_id int)
    
-- Populate the salary table
Truncate table Salary
insert into Salary (id, employee_id, amount, pay_date) values ('1', '1', '9000', '2017/03/31')
insert into Salary (id, employee_id, amount, pay_date) values ('2', '2', '6000', '2017/03/31')
insert into Salary (id, employee_id, amount, pay_date) values ('3', '3', '10000', '2017/03/31')
insert into Salary (id, employee_id, amount, pay_date) values ('4', '1', '7000', '2017/02/28')
insert into Salary (id, employee_id, amount, pay_date) values ('5', '2', '6000', '2017/02/28')
insert into Salary (id, employee_id, amount, pay_date) values ('6', '3', '8000', '2017/02/28')
    
-- Populate the employee table
Truncate table Employee
insert into Employee (employee_id, department_id) values ('1', '1')
insert into Employee (employee_id, department_id) values ('2', '2')
insert into Employee (employee_id, department_id) values ('3', '2')
```

### Pandas Code

```python
# salary data
data = [[1, 1, 9000, '2017/03/31'], [2, 2, 6000, '2017/03/31'], [3, 3, 10000, '2017/03/31'], 
        [4, 1, 7000, '2017/02/28'], [5, 2, 6000, '2017/02/28'], [6, 3, 8000, '2017/02/28']]

# salary dataframe
salary = pd.DataFrame(data, 
                      columns=['id', 'employee_id', 'amount', 'pay_date']) \
                     .astype({'id':'Int64', 'employee_id':'Int64', 'amount':'Int64', 'pay_date':'datetime64[ns]'})

# employee data
data = [[1, 1], [2, 2], [3, 2]]

# employee dataframe
employee = pd.DataFrame(data, 
                        columns=['employee_id', 'department_id']) \
                       .astype({'employee_id':'Int64', 'department_id':'Int64'})
```