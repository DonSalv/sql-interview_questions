# New Users Daily Count

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TRAFFIC`

| Column Name   | Type |
|---------------|------|
| user_id       | int  |
| activity      | enum |
| activity_date | date |

This table may have duplicate rows.

The activity column is an `ENUM` (category) type of `('login', 'logout', 'jobs', 'groups', 'homepage')`.

## Task

Write a solution to reports for every date within at most `90` days from today, the number of users that logged 
in for the first time on that date. Assume today is `2019-06-30`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TRAFFIC table:

| user_id | activity | activity_date |
|---------|----------|---------------|
| 1       | login    | 2019-05-01    |
| 1       | homepage | 2019-05-01    |
| 1       | logout   | 2019-05-01    |
| 2       | login    | 2019-06-21    |
| 2       | logout   | 2019-06-21    |
| 3       | login    | 2019-01-01    |
| 3       | jobs     | 2019-01-01    |
| 3       | logout   | 2019-01-01    |
| 4       | login    | 2019-06-21    |
| 4       | groups   | 2019-06-21    |
| 4       | logout   | 2019-06-21    |
| 5       | login    | 2019-03-01    |
| 5       | logout   | 2019-03-01    |
| 5       | login    | 2019-06-21    |
| 5       | logout   | 2019-06-21    |

Output: 

| login_date | user_count |
|------------|------------|
| 2019-05-01 | 1          |
| 2019-06-21 | 2          |

## Explanation ##

Note that we only care about dates with non zero user count.

The user with `id 5` first logged in on `2019-03-01` so he's not counted on `2019-06-21`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Crreate the traffic table
Create table If Not Exists Traffic (user_id int, activity ENUM('login', 'logout', 'jobs', 'groups', 'homepage'), activity_date date)

-- Populate the traffic table    
Truncate table Traffic
insert into Traffic (user_id, activity, activity_date) values ('1', 'login', '2019-05-01')
insert into Traffic (user_id, activity, activity_date) values ('1', 'homepage', '2019-05-01')
insert into Traffic (user_id, activity, activity_date) values ('1', 'logout', '2019-05-01')
insert into Traffic (user_id, activity, activity_date) values ('2', 'login', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('2', 'logout', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('3', 'login', '2019-01-01')
insert into Traffic (user_id, activity, activity_date) values ('3', 'jobs', '2019-01-01')
insert into Traffic (user_id, activity, activity_date) values ('3', 'logout', '2019-01-01')
insert into Traffic (user_id, activity, activity_date) values ('4', 'login', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('4', 'groups', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('4', 'logout', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('5', 'login', '2019-03-01')
insert into Traffic (user_id, activity, activity_date) values ('5', 'logout', '2019-03-01')
insert into Traffic (user_id, activity, activity_date) values ('5', 'login', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('5', 'logout', '2019-06-21')
```

### Pandas Code

```python
# traffic data
data = [[1, 'login', '2019-05-01'], [1, 'homepage', '2019-05-01'], [1, 'logout', '2019-05-01'], 
        [2, 'login', '2019-06-21'], [2, 'logout', '2019-06-21'], [3, 'login', '2019-01-01'], 
        [3, 'jobs', '2019-01-01'], [3, 'logout', '2019-01-01'], [4, 'login', '2019-06-21'],
        [4, 'groups', '2019-06-21'], [4, 'logout', '2019-06-21'], [5, 'login', '2019-03-01'], 
        [5, 'logout', '2019-03-01'], [5, 'login', '2019-06-21'], [5, 'logout', '2019-06-21']]

# traffic dataframe
traffic = pd.DataFrame(data, 
                       columns=['user_id', 'activity', 'activity_date']) \
                      .astype({'user_id':'Int64', 'activity':'object', 'activity_date':'datetime64[ns]'})
```