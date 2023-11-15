# Number of Times a Driver Was a Passenger

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `RIDES`

| Column Name  | Type |
|--------------|------|
| ride_id      | int  |
| driver_id    | int  |
| passenger_id | int  |

`ride_id` is the column with unique values for this table.

Each row of this table contains the ID of the `driver` and the ID of the `passenger` that rode in `ride_id`.

Note that `driver_id != passenger_id`.

## Task

Write a solution to report the ID of each driver and the number of times they were a passenger.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
RIDES table:

| ride_id | driver_id | passenger_id |
|---------|-----------|--------------|
| 1       | 7         | 1            |
| 2       | 7         | 2            |
| 3       | 11        | 1            |
| 4       | 11        | 7            |
| 5       | 11        | 7            |
| 6       | 11        | 3            |

Output: 

| driver_id | cnt |
|-----------|-----|
| 7         | 2   |
| 11        | 0   |

## Explanation ##

There are two drivers in all the given rides: `7` and `11`.
- The driver with `ID = 7` was a passenger two times.
- The driver with `ID = 11` was never a passenger.

## Schemas & scripts

### SQL Schema

```genericsql

```

### Pandas Code

```python
# rides data
data = [[1, 7, 1], [2, 7, 2], [3, 11, 1], [4, 11, 7], [5, 11, 7], [6, 11, 3]]

# rides dataframe
rides = pd.DataFrame(data, 
                     columns=['ride_id', 'driver_id', 'passenger_id']) \
                    .astype({'ride_id':'Int64', 'driver_id':'Int64', 'passenger_id':'Int64'})
```