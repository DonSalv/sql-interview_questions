# Report Contiguous Dates

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `FAILED`

| Column Name | Type |
|-------------|------|
| fail_date   | date |

`fail_date` is the primary key (column with unique values) for this table.

This table contains the days of failed tasks.

**Table**: `SUCCEEDED`

| Column Name  | Type |
|--------------|------|
| success_date | date |

`success_date` is the primary key (column with unique values) for this table.

This table contains the days of succeeded tasks.

## Task

A system is running one task **every day**. Every task is independent of the previous tasks. 
The tasks can fail or succeed.

Write a solution to report the `period_state` for each continuous interval of days in the period from 
`2019-01-01` to `2019-12-31`.

`period_state` is `'failed'` if tasks in this interval failed or 'succeeded' if tasks in this interval `succeeded`. 
Interval of days are retrieved as `start_date` and `end_date`.

**Return** the result table ordered by `start_date`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
FAILED table:

| fail_date  |
|------------|
| 2018-12-28 |
| 2018-12-29 |
| 2019-01-04 |
| 2019-01-05 |

SUCCEEDED table:

| success_date |
|--------------|
| 2018-12-30   |
| 2018-12-31   |
| 2019-01-01   |
| 2019-01-02   |
| 2019-01-03   |
| 2019-01-06   |

Output: 

| period_state | start_date | end_date   |
|--------------|------------|------------|
| succeeded    | 2019-01-01 | 2019-01-03 |
| failed       | 2019-01-04 | 2019-01-05 |
| succeeded    | 2019-01-06 | 2019-01-06 |

## Explanation ##

The report ignored the system state in 2018 as we care about the system in the period `2019-01-01` to `2019-12-31`.
- From `2019-01-01` to `2019-01-03` all tasks succeeded and the system state was `"succeeded"`.
- From `2019-01-04` to `2019-01-05` all tasks failed and the system state was `"failed"`.
- From `2019-01-06` to `2019-01-06` all tasks succeeded and the system state was `"succeeded"`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Failed (fail_date date)
Create table If Not Exists Succeeded (success_date date)
    
-- Populate the failed table
Truncate table Failed
insert into Failed (fail_date) values ('2018-12-28')
insert into Failed (fail_date) values ('2018-12-29')
insert into Failed (fail_date) values ('2019-01-04')
insert into Failed (fail_date) values ('2019-01-05')
    
-- Populate the succeeded table
Truncate table Succeeded
insert into Succeeded (success_date) values ('2018-12-30')
insert into Succeeded (success_date) values ('2018-12-31')
insert into Succeeded (success_date) values ('2019-01-01')
insert into Succeeded (success_date) values ('2019-01-02')
insert into Succeeded (success_date) values ('2019-01-03')
insert into Succeeded (success_date) values ('2019-01-06')
```

### Pandas Code

```python
# failed data
data = [['2018-12-28'], ['2018-12-29'], ['2019-01-04'], ['2019-01-05']]

# failed dataframe
failed = pd.DataFrame(data, 
                      columns=['fail_date']) \
                     .astype({'fail_date':'datetime64[ns]'})

# succeeded data
data = [['2018-12-30'], ['2018-12-31'], ['2019-01-01'], ['2019-01-02'], ['2019-01-03'], ['2019-01-06']]

# succeeded dataframe
succeeded = pd.DataFrame(data, 
                         columns=['success_date']) \
                        .astype({'success_date':'datetime64[ns]'})
```