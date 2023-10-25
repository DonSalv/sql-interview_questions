# The Number of Passengers in Each Bus II

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
| capacity     | int  |

`bus_id` contains unique values.

Each row of this table contains information about the arrival time of a bus at the LeetCode station and its 
capacity (the number of empty seats it has).

No two buses will arrive at the same time and all bus capacities will be positive integers.

**Table**: `PASSENGERS`

| Column Name  | Type |
|--------------|------|
| passenger_id | int  |
| arrival_time | int  |

`passenger_id` contains unique values.

Each row of this table contains information about the arrival time of a passenger at the LeetCode station.

## Task

Buses and passengers arrive at the LeetCode station. If a bus arrives at the station at a time `t_bus` and a 
passenger arrived at a time `t_passenger` where `t_passenger <= t_bus` and the passenger did not catch any bus, the 
passenger will use that bus. In addition, each bus has a capacity. If at the moment the bus arrives at the 
station there are more passengers waiting than its capacity `capacity`, only `capacity` passengers will use the bus.

Write a solution to report the number of users that used each bus.

**Return** the result table ordered by `bus_id` in ascending order.

## Description of the Solution ##

Example 1:

Input: 
BUSES table:

| bus_id | arrival_time | capacity |
|--------|--------------|----------|
| 1      | 2            | 1        |
| 2      | 4            | 10       |
| 3      | 7            | 2        |

PASSENGERS table:

| passenger_id | arrival_time |
|--------------|--------------|
| 11           | 1            |
| 12           | 1            |
| 13           | 5            |
| 14           | 6            |
| 15           | 7            |

Output: 

| bus_id | passengers_cnt |
|--------|----------------|
| 1      | 1              |
| 2      | 1              |
| 3      | 2              |

## Explanation ##

- Passenger `11` arrives at `time 1`.
- Passenger `12` arrives at `time 1`.
- `Bus 1` arrives at `time 2` and collects passenger `11` as it has one empty seat.

- `Bus 2` arrives at `time 4` and collects passenger `12` as it has ten empty seats.

- Passenger `12` arrives at `time 5`.
- Passenger `13` arrives at `time 6`.
- Passenger `14` arrives at `time 7`.
- `Bus 3` arrives at `time 7` and collects passengers `12` and `13` as it has two empty seats.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Buses (bus_id int, arrival_time int, capacity int)
Create table If Not Exists Passengers (passenger_id int, arrival_time int)

-- Populate the buses    
Truncate table Buses
insert into Buses (bus_id, arrival_time, capacity) values ('1', '2', '1')
insert into Buses (bus_id, arrival_time, capacity) values ('2', '4', '10')
insert into Buses (bus_id, arrival_time, capacity) values ('3', '7', '2')

-- Populate the passengers    
Truncate table Passengers
insert into Passengers (passenger_id, arrival_time) values ('11', '1')
insert into Passengers (passenger_id, arrival_time) values ('12', '1')
insert into Passengers (passenger_id, arrival_time) values ('13', '5')
insert into Passengers (passenger_id, arrival_time) values ('14', '6')
insert into Passengers (passenger_id, arrival_time) values ('15', '7')
```

### Pandas Code

```python
# buses data
data = [[1, 2, 1], [2, 4, 10], [3, 7, 2]]

# buses dataframe
buses = pd.DataFrame(data, 
                     columns=['bus_id', 'arrival_time', 'capacity']) \
                    .astype({'bus_id':'Int64', 'arrival_time':'Int64', 'capacity':'Int64'})

# passengers data
data = [[11, 1], [12, 1], [13, 5], [14, 6], [15, 7]]

# passengers dataframe
passengers = pd.DataFrame(data, 
                          columns=['passenger_id', 'arrival_time']) \
                         .astype({'passenger_id':'Int64', 'arrival_time':'Int64'})
```