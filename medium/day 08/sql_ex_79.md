# Order Two Columns Independently

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `DATA`

| Column Name | Type |
|-------------|------|
| first_col   | int  |
| second_col  | int  |

This table may contain duplicate rows.

## Task

Write a solution to independently:

- order `first_col` in ascending order.
- order `second_col` in descending order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
DATA table:

| first_col | second_col |
|-----------|------------|
| 4         | 2          |
| 2         | 3          |
| 3         | 1          |
| 1         | 4          |

Output: 

| first_col | second_col |
|-----------|------------|
| 1         | 4          |
| 2         | 3          |
| 3         | 2          |
| 4         | 1          |

## Explanation ##

No explanation provided

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the data table
Create table If Not Exists Data (first_col int, second_col int)

-- Populate the data table    
Truncate table Data
insert into Data (first_col, second_col) values ('4', '2')
insert into Data (first_col, second_col) values ('2', '3')
insert into Data (first_col, second_col) values ('3', '1')
insert into Data (first_col, second_col) values ('1', '4')
```

### Pandas Code

```python
# data data
data = [[4, 2], [2, 3], [3, 1], [1, 4]]

# data dataframe
data = pd.DataFrame(data, 
                    columns=['first_col', 'second_col']) \
                   .astype({'first_col':'Int64', 'second_col':'Int64'})
```