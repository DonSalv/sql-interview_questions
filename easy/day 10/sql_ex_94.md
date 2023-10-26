# Bikes Last Time Used

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `BIKES`
 
| Column Name | Type     | 
|-------------|----------|
| ride_id     | int      | 
| bike_number | int      | 
| start_time  | datetime |
| end_time    | datetime |

`ride_id` column contains unique values.

Each row contains a ride information that includes `ride_id`, `bike number`, `start` and `end` time of the ride.

## Task

Write a solution to find the **last time** when each bike was used.

**Return** the result table ordered by the bikes that were **most recently used**. 

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input:
Bikes table:
 
| ride_id | bike_number | start_time          | end_time            |  
|---------|-------------|---------------------|---------------------|
| 1       | W00576      | 2012-03-25 11:30:00 | 2012-03-25 12:40:00 |
| 2       | W00300      | 2012-03-25 10:30:00 | 2012-03-25 10:50:00 |
| 3       | W00455      | 2012-03-26 14:30:00 | 2012-03-26 17:40:00 |
| 4       | W00455      | 2012-03-25 12:30:00 | 2012-03-25 13:40:00 |
| 5       | W00576      | 2012-03-25 08:10:00 | 2012-03-25 09:10:00 |
| 6       | W00576      | 2012-03-28 02:30:00 | 2012-03-28 02:50:00 | 

Output:
 
| bike_number | end_time            |  
|-------------|---------------------|
| W00576      | 2012-03-28 02:50:00 |
| W00455      | 2012-03-26 17:40:00 |
| W00300      | 2012-03-25 10:50:00 |

## Explanation ##

- bike with number `W00576` has three rides, out of that, most recent ride is with `ride_id` `6` which ended on 
`2012-03-28 02:50:00`.
- bike with number `W00300` has only `1` ride so we will include end_time in output directly. 
- bike with number `W00455` has two rides, out of that, most recent ride is with `ride_id` `3` which ended on 
`2012-03-26 17:40:00`. 
Returning output in order by the bike that were most recently used.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the bikes table
Create table If Not Exists Bikes (ride_id int,bike_number varchar(100), start_time datetime,end_time datetime)
    
-- Populate the bikes table
Truncate table Bikes
insert into Bikes (ride_id, bike_number, start_time, end_time) values ('1', 'W00576', '2012-03-25 11:30:00', '2012-03-25 12:40:00')
insert into Bikes (ride_id, bike_number, start_time, end_time) values ('2', 'W00300', '2012-03-25 10:30:00', '2012-03-25 10:50:00')
insert into Bikes (ride_id, bike_number, start_time, end_time) values ('3', 'W00455', '2012-03-26 14:30:00', '2012-03-26 17:40:00')
insert into Bikes (ride_id, bike_number, start_time, end_time) values ('4', 'W00455', '2012-03-25 12:30:00', '2012-03-25 13:40:00')
insert into Bikes (ride_id, bike_number, start_time, end_time) values ('5', 'W00576', '2012-03-25 08:10:00', '2012-03-25 09:10:00')
insert into Bikes (ride_id, bike_number, start_time, end_time) values ('6', 'W00576', '2012-03-28 02:30:00', '2012-03-28 02:50:00')
```

### Pandas Code

```python
# bikes data
data = [[1, 'W00576', '2012-03-25 11:30:00', '2012-03-25 12:40:00'], 
        [2, 'W00300', '2012-03-25 10:30:00', '2012-03-25 10:50:00'], 
        [3, 'W00455', '2012-03-26 14:30:00', '2012-03-26 17:40:00'], 
        [4, 'W00455', '2012-03-25 12:30:00', '2012-03-25 13:40:00'], 
        [5, 'W00576', '2012-03-25 08:10:00', '2012-03-25 09:10:00'], 
        [6, 'W00576', '2012-03-28 02:30:00', '2012-03-28 02:50:00']]

# bikes dataframe
bikes = pd.DataFrame(data, 
                     columns=['ride_id', 'bike_number', 'start_time', 'end_time']) \
                    .astype({'ride_id':'Int64', 'bike_number':'object', 
                             'start_time':'datetime64[ns]', 'end_time':'datetime64[ns]'})
```