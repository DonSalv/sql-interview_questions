# Apples & Oranges

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SALES`

| Column Name | Type |
|-------------|------|
| sale_date   | date |
| fruit       | enum | 
| sold_num    | int  | 

`(sale_date, fruit)` is the primary key (combination of columns with unique values) of this table.

This table contains the sales of `"apples"` and `"oranges"` sold each day.

## Task

Write a solution to report the difference between the number of **apples** and **oranges** sold each day.

**Return** the result table ordered by `sale_date`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SALES table:

| sale_date  | fruit   | sold_num |
|------------|---------|----------|
| 2020-05-01 | apples  | 10       |
| 2020-05-01 | oranges | 8        |
| 2020-05-02 | apples  | 15       |
| 2020-05-02 | oranges | 15       |
| 2020-05-03 | apples  | 20       |
| 2020-05-03 | oranges | 0        |
| 2020-05-04 | apples  | 15       |
| 2020-05-04 | oranges | 16       |

Output: 

| sale_date  | diff |
|------------|------|
| 2020-05-01 | 2    |
| 2020-05-02 | 0    |
| 2020-05-03 | 20   |
| 2020-05-04 | -1   |

## Explanation ##

- Day `2020-05-01`, `10` apples and 8 oranges were sold (`Difference  10 - 8 = 2`).
- Day `2020-05-02`, `15` apples and 15 oranges were sold (`Difference 15 - 15 = 0`).
- Day `2020-05-03`, `20` apples and 0 oranges were sold (`Difference 20 - 0 = 20`).
- Day `2020-05-04`, `15` apples and 16 oranges were sold (`Difference 15 - 16 = -1`).

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the sales table
Create table If Not Exists Sales (sale_date date, fruit ENUM('apples', 'oranges'), sold_num int)

-- Populate the sales table    
Truncate table Sales
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-01', 'apples', '10')
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-01', 'oranges', '8')
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-02', 'apples', '15')
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-02', 'oranges', '15')
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-03', 'apples', '20')
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-03', 'oranges', '0')
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-04', 'apples', '15')
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-04', 'oranges', '16')
```

### Pandas Code

```python
# sales data
data = [['2020-05-01', 'apples', 10], ['2020-05-01', 'oranges', 8], 
        ['2020-05-02', 'apples', 15], ['2020-05-02', 'oranges', 15],
        ['2020-05-03', 'apples', 20], ['2020-05-03', 'oranges', 0],
        ['2020-05-04', 'apples', 15], ['2020-05-04', 'oranges', 16]]

# sales dataframe
sales = pd.DataFrame(data, 
                     columns=['sale_date', 'fruit', 'sold_num']) \
                    .astype({'sale_date':'datetime64[ns]', 'fruit':'object', 'sold_num':'Int64'})
```