# Rising Temperature

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `WEATHER`

| Column Name | Type |
|-------------|------|
| id          | int  |
| recordDate  | date |
| temperature | int  |

`id` is the column with unique values for this table.
This table contains information about the temperature on a certain day.

## Task

Write a solution to find all dates `Id` with higher temperatures compared to its previous dates (yesterday).

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Weather table:

| id   | recordDate | temperature |
|------|------------|-------------|
| 1    | 2015-01-01 | 10          |
| 2    | 2015-01-02 | 25          |
| 3    | 2015-01-03 | 20          |
| 4    | 2015-01-04 | 30          |

Output: 

| id   |
|------|
| 2    |
| 4    |

## Explanation ##

- In `2015-01-02`, the temperature was higher than the previous day (`10 -> 25`).
- In `2015-01-04`, the temperature was higher than the previous day (`20 -> 30`).

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the weahter table
Create table If Not Exists Weather (id int, recordDate date, temperature int)

-- Populate the weather table
Truncate table Weather
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')
```

### Pandas Code

```python
# weather data
data = [[1, '2015-01-01', 10], 
        [2, '2015-01-02', 25], 
        [3, '2015-01-03', 20], 
        [4, '2015-01-04', 30]]

# weather dataframe
weather = pd.DataFrame(data, 
                       columns=['id', 'recordDate', 'temperature']) \
                       .astype({'id':'Int64', 
                                'recordDate':'datetime64[ns]',
                                'temperature':'Int64'})
```