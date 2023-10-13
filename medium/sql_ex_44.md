# 1440. Evaluate Boolean Expression

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table** `VARIABLES`:

| Column Name | Type    |
|-------------|---------|
| name        | varchar |
| value       | int     |

In `SQL`, `name` is the primary key for this table.

This table contains the stored variables and their values.

**Table** `EXPRESSIONS`:

| Column Name   | Type    |
|---------------|---------|
| left_operand  | varchar |
| operator      | enum    |
| right_operand | varchar |

In `SQL`, `(left_operand, operator, right_operand)` is the primary key for this table.

This table contains a boolean expression that should be evaluated.

`operator` is an `enum` that takes one of the values `('<', '>', '=')`

The values of `left_operand` and `right_operand` are guaranteed to be in the Variables table.

## Task

Evaluate the boolean expressions in `EXPRESSIONS` table.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
VARIABLES table:

| name | value |
|------|-------|
| x    | 66    |
| y    | 77    |

EXPRESSIONS table:

| left_operand | operator | right_operand  |
|--------------|----------|----------------|
| x            | >        | y              |
| x            | <        | y              |
| x            | =        | y              |
| y            | >        | x              |
| y            | <        | x              |
| x            | =        | x              |

Output: 

| left_operand | operator | right_operand | value |
|--------------|----------|---------------|-------|
| x            | >        | y             | false |
| x            | <        | y             | true  |
| x            | =        | y             | false |
| y            | >        | x             | true  |
| y            | <        | x             | false |
| x            | =        | x             | true  |

## Explanation ##

As shown, you need to find the value of each boolean expression in the table using the `VARIABLES` table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create Table If Not Exists Variables (name varchar(3), value int)
Create Table If Not Exists Expressions (left_operand varchar(3), operator ENUM('>', '<', '='), right_operand varchar(3))

-- Populate the variables table    
Truncate table Variables
insert into Variables (name, value) values ('x', '66')
insert into Variables (name, value) values ('y', '77')

-- Populate the expressions table    
Truncate table Expressions
insert into Expressions (left_operand, operator, right_operand) values ('x', '>', 'y')
insert into Expressions (left_operand, operator, right_operand) values ('x', '<', 'y')
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'y')
insert into Expressions (left_operand, operator, right_operand) values ('y', '>', 'x')
insert into Expressions (left_operand, operator, right_operand) values ('y', '<', 'x')
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'x')
```

### Pandas Code

```python
# variables data
data = [['x', 66], ['y', 77]]

# variables dataframe
variables = pd.DataFrame(data,
                         columns=['name', 'value']) \
                        .astype({'name':'object', 'value':'Int64'})

# expressions data
data = [['x', '>', 'y'], ['x', '<', 'y'], ['x', '=', 'y'], ['y', '>', 'x'], ['y', '<', 'x'], ['x', '=', 'x']]

# expressions dataframe
expressions = pd.DataFrame(data, 
                           columns=['left_operand', 'operator', 'right_operand']) \
                          .astype({'left_operand':'object', 'operator':'object', 'right_operand':'object'})
```