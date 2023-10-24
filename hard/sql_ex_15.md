# Get the Second Most Recent Activity

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `USERACTIVITY`

| Column Name | Type    |
|-------------|---------|
| username    | varchar |
| activity    | varchar |
| startDate   | Date    |
| endDate     | Date    |

This table may contain duplicates rows.

This table contains information about the activity performed by each user in a period of time.

A person with `username` performed an `activity` from `startDate` to `endDate`.

## Task

Write a solution to show the **second most recent activity** of each user.

If the user only has one activity, return that one. A user cannot perform more than one activity at 
the same time.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
USERACTIVITY table:

| username | activity | startDate  | endDate    |
|----------|----------|------------|------------|
| Alice    | Travel   | 2020-02-12 | 2020-02-20 |
| Alice    | Dancing  | 2020-02-21 | 2020-02-23 |
| Alice    | Travel   | 2020-02-24 | 2020-02-28 |
| Bob      | Travel   | 2020-02-11 | 2020-02-18 |

Output: 

| username | activity | startDate  | endDate    |
|----------|----------|------------|------------|
| Alice    | Dancing  | 2020-02-21 | 2020-02-23 |
| Bob      | Travel   | 2020-02-11 | 2020-02-18 |


## Explanation ##

The most recent activity of `Alice` is `Travel` from `2020-02-24` to `2020-02-28`, before that she was 
dancing from `2020-02-21` to `2020-02-23`.
`Bob` only has one record, we just take that one.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the useractivity table
Create table If Not Exists UserActivity (username varchar(30), activity varchar(30), startDate date, endDate date)

-- Populate the useractivity table    
Truncate table UserActivity
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-12', '2020-02-20')
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Dancing', '2020-02-21', '2020-02-23')
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-24', '2020-02-28')
insert into UserActivity (username, activity, startDate, endDate) values ('Bob', 'Travel', '2020-02-11', '2020-02-18')
```

### Pandas Code

```python
# user_activity data
data = [['Alice', 'Travel', '2020-02-12', '2020-02-20'], 
        ['Alice', 'Dancing', '2020-02-21', '2020-02-23'], 
        ['Alice', 'Travel', '2020-02-24', '2020-02-28'],
        ['Bob', 'Travel', '2020-02-11', '2020-02-18']]

# user_activity dataframe
user_activity = pd.DataFrame(data, columns=['username', 'activity', 'startDate', 'endDate']).astype({'username':'object', 'activity':'object', 'startDate':'datetime64[ns]', 'endDate':'datetime64[ns]'})

```