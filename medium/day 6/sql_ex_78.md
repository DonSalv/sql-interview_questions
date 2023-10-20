# The Number of Passengers in Each Bus I

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `BUSES`

| Column Name  | Type |
|--------------|------|
| bus_id       | int  |
| arrival_time | int  |

`bus_id` is the column with unique values for this table.

Each row of this table contains information about the `arrival time` of a bus at the LeetCode station.

No two buses will arrive at the same time.

**Table**: `PASSENGERS`

| Column Name  | Type |
|--------------|------|
| passenger_id | int  |
| arrival_time | int  |

`passenger_id` is the column with unique values for this table.

Each row of this table contains information about the` arrival time` of a `passenger` at the LeetCode station.

## Task

Buses and passengers arrive at the LeetCode station. If a bus arrives at the station at time `t_bus` and a 
passenger arrived at time `t_passenger` where `t_passenger <= t_bus` and the passenger did not catch any bus, 
the passenger will use that bus.

Write a solution to report the number of users that used each bus.

**Return** the result table ordered by `bus_id` in ascending order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
BUSES table:

| bus_id | arrival_time |
|--------|--------------|
| 1      | 2            |
| 2      | 4            |
| 3      | 7            |

PASSENGERS table:

| passenger_id | arrival_time |
|--------------|--------------|
| 11           | 1            |
| 12           | 5            |
| 13           | 6            |
| 14           | 7            |

Output: 

| bus_id | passengers_cnt |
|--------|----------------|
| 1      | 1              |
| 2      | 0              |
| 3      | 3              |

## Explanation ##

- Passenger `11` arrives at time `1`.
- Bus `1` arrives at time `2` and collects passenger `11`.
- Bus `2` arrives at time `4` and does not collect any passengers.

- Passenger `12` arrives at time `5`.
- Passenger `13` arrives at time `6`.
- Passenger `14` arrives at time `7`.

- Bus `3` arrives at time `7` and collects passengers `12`, `13`, and `14`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Buses (bus_id int, arrival_time int)
Create table If Not Exists Passengers (passenger_id int, arrival_time int)

-- Populate the buses table    
Truncate table Buses
insert into Buses (bus_id, arrival_time) values ('1', '2')
insert into Buses (bus_id, arrival_time) values ('2', '4')
insert into Buses (bus_id, arrival_time) values ('3', '7')

-- Populate the passengers table    
Truncate table Passengers
insert into Passengers (passenger_id, arrival_time) values ('11', '1')
insert into Passengers (passenger_id, arrival_time) values ('12', '5')
insert into Passengers (passenger_id, arrival_time) values ('13', '6')
insert into Passengers (passenger_id, arrival_time) values ('14', '7')
```
