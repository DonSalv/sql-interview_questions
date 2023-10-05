# Biggest Single Number

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `MYNUMBERS`

| Column Name | Type |
|-------------|------|
| num         | int  |

This table may contain duplicates (In other words, there is no primary key for this table in `SQL`).
Each row of this table contains an integer.

## Task

A **single number** is a number that appeared only once in the `MYNUMBERS` table.

Find the largest **single number**. If there is no **single number**, report `null`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
MYNUMBERS table:

| num |
|-----|
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |

Output: 

| num |
|-----|
| 6   |

Example 2:

Input: 
MyNumbers table:

| num |
|-----|
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |

Output: 

| num  |
|------|
| null |

## Explanation ##

**Example 1**:
The single numbers are `1`, `4`, `5`, and `6`.
Since `6` is the largest single number, we return it.

**Example 2**:
There are no single numbers in the input table so we return `null`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the mynumbers table
Create table If Not Exists MyNumbers (num int)
    
-- Populate the mynumbers table
Truncate table MyNumbers
insert into MyNumbers (num) values ('8')
insert into MyNumbers (num) values ('8')
insert into MyNumbers (num) values ('3')
insert into MyNumbers (num) values ('3')
insert into MyNumbers (num) values ('1')
insert into MyNumbers (num) values ('4')
insert into MyNumbers (num) values ('5')
insert into MyNumbers (num) values ('6')
```

### Pandas Code

```python
# my_numbers data
data = [[8], [8], [3], [3], [1], [4], [5], [6]]

# my_numbers dataframe
my_numbers = pd.DataFrame(data, columns=['num']).astype({'num':'Int64'})
```