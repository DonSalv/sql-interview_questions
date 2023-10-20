# The First Day of the Maximum Recorded Degree in Each City

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `WEATHER`

| Column Name | Type |
|-------------|------|
| city_id     | int  |
| day         | date |
| degree      | int  |

`(city_id, day)` is the primary key (combination of columns with unique values) for this table.

Each row in this table contains the `degree` of the weather of a `city` on a certain `day`.

All the degrees are recorded in the year 2022.

## Task

Write a solution to report the day that has the maximum recorded degree in each city. If the maximum degree was recorded for the same city multiple times, return the earliest day among them.

**Return** the result table ordered by `city_id` in ascending order.

## Description of the Solution ##

The result format is shown in the following example.

Example 1:

Input: 
WEATHER table:

| city_id | day        | degree |

| 1       | 2022-01-07 | -12    |
| 1       | 2022-03-07 | 5      |
| 1       | 2022-07-07 | 24     |
| 2       | 2022-08-07 | 37     |
| 2       | 2022-08-17 | 37     |
| 3       | 2022-02-07 | -7     |
| 3       | 2022-12-07 | -6     |

Output: 

| city_id | day        | degree |

| 1       | 2022-07-07 | 24     |
| 2       | 2022-08-07 | 37     |
| 3       | 2022-12-07 | -6     |

## Explanation ##

- For city `1`, the maximum degree was recorded on `2022-07-07` with `24` degrees.
- For city `1`, the maximum degree was recorded on `2022-08-07` and `2022-08-17` with `37` degrees. 
We choose the earlier date (`2022-08-07`).
- For city `3`, the maximum degree was recorded on `2022-12-07` with `-6` degrees.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the weather table
Create table If Not Exists Weather (city_id int, day date, degree int)

-- Populate the wather table    
Truncate table Weather
insert into Weather (city_id, day, degree) values ('1', '2022-01-07', '-12')
insert into Weather (city_id, day, degree) values ('1', '2022-03-07', '5')
insert into Weather (city_id, day, degree) values ('1', '2022-07-07', '24')
insert into Weather (city_id, day, degree) values ('2', '2022-08-07', '37')
insert into Weather (city_id, day, degree) values ('2', '2022-08-17', '37')
insert into Weather (city_id, day, degree) values ('3', '2022-02-07', '-7')
insert into Weather (city_id, day, degree) values ('3', '2022-12-07', '-6')
```

### Pandas Code

```python
# weather data
data = [[1, '2022-01-07', -12], [1, '2022-03-07', 5], [1, '2022-07-07', 24], 
        [2, '2022-08-07', 37], [2, '2022-08-17', 37], [3, '2022-02-07', -7], [3, '2022-12-07', -6]]

# weather dataframe
weather = pd.DataFrame(data, 
                       columns=['city_id', 'day', 'degree']) \
                      .astype({'city_id':'Int64', 'day':'datetime64[ns]', 'degree':'Int64'})
```