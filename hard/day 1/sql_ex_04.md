# Find Median Given Frequency of Numbers

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `NUMBERS`

| Column Name | Type |
|-------------|------|
| num         | int  |
| frequency   | int  |

`num` is the primary key (column with unique values) for this table.

Each row of this table shows the frequency of a number in the database.

## Task

The **median** is the value separating the higher half from the lower half of a data sample.

Write a solution to report the **median** of all the numbers in the database after decompressing the Numbers table. 
Round the median to **one decimal point**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
NUMBERS table:

| num | frequency |
|-----|-----------|
| 0   | 7         |
| 1   | 1         |
| 2   | 3         |
| 3   | 1         |

Output: 

| median |
|--------|
| 0.0    |

## Explanation ##

If we decompress the Numbers table, we will get `[0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3]`, so the median is 
`(0 + 0) / 2 = 0`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the numbers table
Create table If Not Exists Numbers (num int, frequency int)

-- Populate the numbers table    
Truncate table Numbers
insert into Numbers (num, frequency) values ('0', '7')
insert into Numbers (num, frequency) values ('1', '1')
insert into Numbers (num, frequency) values ('2', '3')
insert into Numbers (num, frequency) values ('3', '1')
```

### Pandas Code

```python
# numbers data
data = [[0, 7], [1, 1], [2, 3], [3, 1]]

# numbers dataframe
numbers = pd.DataFrame(data, 
                       columns=['num', 'frequency']) \
                      .astype({'num':'Int64', 'frequency':'Int64'})
```