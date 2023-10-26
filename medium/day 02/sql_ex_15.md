# Exchange Seats

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SEAT`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| student     | varchar |

`id` is the primary key (unique value) column for this table.

Each row of this table indicates the `name` and the `ID` of a `student`.

id is a continuous increment.

## Task

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of 
the last student is not swapped.

**Return** the result table ordered by `id` in ascending order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SEAT table:

| id  | student |
|-----|---------|
| 1   | Abbot   |
| 2   | Doris   |
| 3   | Emerson |
| 4   | Green   |
| 5   | Jeames  |

Output: 

| id  | student |
|-----|---------|
| 1   | Doris   |
| 2   | Abbot   |
| 3   | Green   |
| 4   | Emerson |
| 5   | Jeames  |

## Explanation ##

Note that if the number of students is odd, there is no need to change the last one's seat.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the seat table
Create table If Not Exists Seat (id int, student varchar(255))

-- Populate the seat table    
Truncate table Seat
insert into Seat (id, student) values ('1', 'Abbot')
insert into Seat (id, student) values ('2', 'Doris')
insert into Seat (id, student) values ('3', 'Emerson')
insert into Seat (id, student) values ('4', 'Green')
insert into Seat (id, student) values ('5', 'Jeames')
```

### Pandas Code

```python
# seat data
data = [[1, 'Abbot'], [2, 'Doris'], [3, 'Emerson'], [4, 'Green'], [5, 'Jeames']]

# seat dataframe
seat = pd.DataFrame(data, 
                    columns=['id', 'student']) \
                   .astype({'id':'Int64', 'student':'object'})
```