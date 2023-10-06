# Ad-Free Sessions

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables

**Table**: `PLAYBACK`

| Column Name | Type |
|-------------|------|
| session_id  | int  |
| customer_id | int  |
| start_time  | int  |
| end_time    | int  |

`session_id` is the column with unique values for this table.

`customer_id` is the ID of the customer watching this session.

The session runs during the inclusive interval between `start_time` and `end_time`.
It is guaranteed that start_time <= end_time and that two sessions for the same customer do not intersect.

**Table**: `ADS`

| Column Name | Type |
|-------------|------|
| ad_id       | int  |
| customer_id | int  |
| timestamp   | int  |

`ad_id` is the column with unique values for this table.

`customer_id` is the ID of the customer viewing this ad.

`timestamp` is the moment of time at which the ad was shown.

## Task

Write a solution to report all the sessions that did not get shown any ads.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PLAYBACK table:

| session_id | customer_id | start_time | end_time |
|------------|-------------|------------|----------|
| 1          | 1           | 1          | 5        |
| 2          | 1           | 15         | 23       |
| 3          | 2           | 10         | 12       |
| 4          | 2           | 17         | 28       |
| 5          | 2           | 2          | 8        |

ADS table:

| ad_id | customer_id | timestamp |
|-------|-------------|-----------|
| 1     | 1           | 5         |
| 2     | 2           | 17        |
| 3     | 2           | 20        |

Output: 

| session_id |
|------------|
| 2          |
| 3          |
| 5          |

## Explanation ##

- The ad with `ID 1` was shown to` user 1` at time `5` while they were in `session 1`.
- The ad with `ID 2` was shown to `user 2` at time `17` while they were in `session 4`.
- The ad with `ID 3` was shown to `user 2` at time `20` while they were in `session 4`.
- We can see that `sessions 1` and `4` had at least one ad. Sessions `2`, `3,` and `5` did not have any ads, 
so we return them.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Playback(session_id int,customer_id int,start_time int,end_time int)
Create table If Not Exists Ads (ad_id int, customer_id int, timestamp int)

-- Populate the playback table    
Truncate table Playback
insert into Playback (session_id, customer_id, start_time, end_time) values ('1', '1', '1', '5')
insert into Playback (session_id, customer_id, start_time, end_time) values ('2', '1', '15', '23')
insert into Playback (session_id, customer_id, start_time, end_time) values ('3', '2', '10', '12')
insert into Playback (session_id, customer_id, start_time, end_time) values ('4', '2', '17', '28')
insert into Playback (session_id, customer_id, start_time, end_time) values ('5', '2', '2', '8')

-- Populate the ads table    
Truncate table Ads
insert into Ads (ad_id, customer_id, timestamp) values ('1', '1', '5')
insert into Ads (ad_id, customer_id, timestamp) values ('2', '2', '17')
insert into Ads (ad_id, customer_id, timestamp) values ('3', '2', '20')
```

### Pandas Code

```python
# playback data
data = [[1, 1, 1, 5], [2, 1, 15, 23], [3, 2, 10, 12], [4, 2, 17, 28], [5, 2, 2, 8]]

# playback dataframe
playback = pd.DataFrame(data, 
                        columns=['session_id', 'customer_id', 'start_time', 'end_time']) \
                       .astype({'session_id':'Int64', 'customer_id':'Int64', 
                                'start_time':'Int64', 'end_time':'Int64'})

# ads data
data = [[1, 1, 5], [2, 2, 17], [3, 2, 20]]

# ads dataframe
ads = pd.DataFrame(data, 
                   columns=['ad_id', 'customer_id', 'timestamp']) \
                  .astype({'ad_id':'Int64', 'customer_id':'Int64', 'timestamp':'Int64'})
```