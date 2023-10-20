# Flight Occupancy and Waitlist Analysis

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `FLIGHTS`

| Column Name | Type |
|-------------|------|
| flight_id   | int  |
| capacity    | int  |

`flight_id` is the column with unique values for this table.

Each row of this table contains flight id and its capacity.

**Table**: `PASSENGERS`

| Column Name  | Type |
|--------------|------|
| passenger_id | int  |
| flight_id    | int  |

`passenger_id` is the column with unique values for this table.

Each row of this table contains `passenger` id and `flight` id.

## Task

Passengers book tickets for flights in advance. If a passenger books a ticket for a flight and there are still 
empty seats available on the flight, the passenger ticket will be **confirmed**. However, the passenger will be on 
a **waitlist** if the flight is already at full capacity.

Write a solution to report the number of passengers who successfully booked a flight (got a seat) and the number of 
passengers who are on the waitlist for each flight.

**Return** the result table ordered by `flight_id` in ascending order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
FLIGHTS table:

| flight_id | capacity |
|-----------|----------|
| 1         | 2        |
| 2         | 2        |
| 3         | 1        |

PASSENGERS table:

| passenger_id | flight_id |
|--------------|-----------|
| 101          | 1         |
| 102          | 1         |
| 103          | 1         |
| 104          | 2         |
| 105          | 2         |
| 106          | 3         |
| 107          | 3         |

Output: 

| flight_id | booked_cnt | waitlist_cnt |
|-----------|------------|--------------|
| 1         | 2          | 1            |
| 2         | 2          | 0            |
| 3         | 1          | 1            |

## Explanation ##

- Flight `1` has a capacity of `2`. As there are `3` passengers who have booked tickets, only `2` passengers can get a 
seat. Therefore, `2` passengers are successfully booked, and `1` passenger is on the waitlist.
- Flight `2` has a capacity of `2`. Since there are exactly `2` passengers who booked tickets, everyone can secure a 
seat. As a result, `2` passengers successfully booked their seats and there are no passengers on the waitlist.
- Flight `3` has a capacity of `1`. As there are `2` passengers who have booked tickets, only `1` passenger can get a 
seat. Therefore, `1` passenger is successfully booked, and `1` passenger is on the waitlist.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table if not exists Flights(flight_id int,capacity int)
Create table if not exists Passengers (passenger_id int,flight_id int)

-- Populate the flights table    
Truncate table Flights
insert into Flights (flight_id, capacity) values ('1', '2')
insert into Flights (flight_id, capacity) values ('2', '2')
insert into Flights (flight_id, capacity) values ('3', '1')

-- Populate the passengers table    
Truncate table Passengers
insert into Passengers (passenger_id, flight_id) values ('101', '1')
insert into Passengers (passenger_id, flight_id) values ('102', '1')
insert into Passengers (passenger_id, flight_id) values ('103', '1')
insert into Passengers (passenger_id, flight_id) values ('104', '2')
insert into Passengers (passenger_id, flight_id) values ('105', '2')
insert into Passengers (passenger_id, flight_id) values ('106', '3')
insert into Passengers (passenger_id, flight_id) values ('107', '3')
```

### Pandas Code

```python
# flights data
data = [[1, 2], [2, 2], [3, 1]]

# flights dataframe
flights = pd.DataFrame(data, 
                       columns=['flight_id', 'capacity']) \
                      .astype({'flight_id':'Int64', 'capacity':'Int64'})

# passengers data
data = [[101, 1], [102, 1], [103, 1], [104, 2], [105, 2], [106, 3], [107, 3]]

# passengers dataframe
passengers = pd.DataFrame(data, 
                          columns=['passenger_id', 'flight_id']) \
                         .astype({'passenger_id':'Int64', 'flight_id':'Int64'})
```