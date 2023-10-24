# Median Employee Salary

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EMPLOYEE`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| company     | varchar |
| salary      | int     |

`id` is the primary key (column with unique values) for this table.

Each row of this table indicates the `company` and the `salary` of one employee.

## Task

Write a solution to find the rows that contain the median salary of each company. While calculating the median, 
when you sort the salaries of the company, break the ties by `id`.

**Return** the result table in any order.

**Follow up**: Could you solve it without using any built-in or window functions?

## Description of the Solution ##

The result format is in the following example.
-
Example 1:

Input: 
EMPLOYEE table:

| id  | company | salary |
|-----|---------|--------|
| 1   | A       | 2341   |
| 2   | A       | 341    |
| 3   | A       | 15     |
| 4   | A       | 15314  |
| 5   | A       | 451    |
| 6   | A       | 513    |
| 7   | B       | 15     |
| 8   | B       | 13     |
| 9   | B       | 1154   |
| 10  | B       | 1345   |
| 11  | B       | 1221   |
| 12  | B       | 234    |
| 13  | C       | 2345   |
| 14  | C       | 2645   |
| 15  | C       | 2645   |
| 16  | C       | 2652   |
| 17  | C       | 65     |

Output: 

| id  | company | salary |
|-----|---------|--------|
| 5   | A       | 451    |
| 6   | A       | 513    |
| 12  | B       | 234    |
| 9   | B       | 1154   |
| 14  | C       | 2645   |

## Explanation ##

For company A, the rows sorted are as follows:

| id  | company | salary |            |
|-----|---------|--------|------------|
| 3   | A       | 15     |            |
| 2   | A       | 341    |            |
| 5   | A       | 451    | <-- median |
| 6   | A       | 513    | <-- median |
| 1   | A       | 2341   |            |
| 4   | A       | 15314  |            |

For company B, the rows sorted are as follows:

| id  | company | salary |            |
|-----|---------|--------|------------|
| 8   | B       | 13     |            |
| 7   | B       | 15     |            |
| 12  | B       | 234    | <-- median |
| 11  | B       | 1221   | <-- median |
| 9   | B       | 1154   |            |
| 10  | B       | 1345   |            |

For company C, the rows sorted are as follows:

| id  | company | salary |            |
|-----|---------|--------|------------|
| 17  | C       | 65     |            |
| 13  | C       | 2345   |            |
| 14  | C       | 2645   | <-- median |
| 15  | C       | 2645   |            |
| 16  | C       | 2652   |            |

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the employee table
Create table If Not Exists Employee (id int, company varchar(255), salary int)

-- Populate the employee table    
Truncate table Employee
insert into Employee (id, company, salary) values ('1', 'A', '2341')
insert into Employee (id, company, salary) values ('2', 'A', '341')
insert into Employee (id, company, salary) values ('3', 'A', '15')
insert into Employee (id, company, salary) values ('4', 'A', '15314')
insert into Employee (id, company, salary) values ('5', 'A', '451')
insert into Employee (id, company, salary) values ('6', 'A', '513')
insert into Employee (id, company, salary) values ('7', 'B', '15')
insert into Employee (id, company, salary) values ('8', 'B', '13')
insert into Employee (id, company, salary) values ('9', 'B', '1154')
insert into Employee (id, company, salary) values ('10', 'B', '1345')
insert into Employee (id, company, salary) values ('11', 'B', '1221')
insert into Employee (id, company, salary) values ('12', 'B', '234')
insert into Employee (id, company, salary) values ('13', 'C', '2345')
insert into Employee (id, company, salary) values ('14', 'C', '2645')
insert into Employee (id, company, salary) values ('15', 'C', '2645')
insert into Employee (id, company, salary) values ('16', 'C', '2652')
insert into Employee (id, company, salary) values ('17', 'C', '65')
```

### Pandas Code

```python
# employee data
data = [[1, 'A', 2341], [2, 'A', 341], [3, 'A', 15], [4, 'A', 15314], [5, 'A', 451],
        [6, 'A', 513], [7, 'B', 15], [8, 'B', 13], [9, 'B', 1154], [10, 'B', 1345], 
        [11, 'B', 1221], [12, 'B', 234], [13, 'C', 2345], [14, 'C', 2645], [15, 'C', 2645], 
        [16, 'C', 2652], [17, 'C', 65]]

# employee dataframe
employee = pd.DataFrame(data, columns=['id', 'company', 'salary']).astype({'id':'Int64', 'company':'object', 'salary':'Int64'})
```