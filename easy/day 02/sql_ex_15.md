# Shortest Distance in a Line

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `POINT`

| Column Name | Type |
|-------------|------|
| x           | int  |

In `SQL`, `x` is the primary key column for this table.
Each row of this table indicates the position of a point on the `X-axis`.

## Task

Find the shortest distance between any two points from the `POINT` table.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
POINT table:

| x   |
|-----|
| -1  |
| 0   |
| 2   |

Output: 

| shortest |
|----------|
| 1        |

## Explanation ##

The shortest distance is between points -1 and 0 which is |(-1) - 0| = 1.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the point table
Create Table If Not Exists Point (x int not null)

-- Populate the point table
Truncate table Point
insert into Point (x) values ('-1')
insert into Point (x) values ('0')
insert into Point (x) values ('2')
```

### Pandas Code
```python
# point data
data = [[-1], [0], [2]]

# point dataframe
point = pd.DataFrame(data, columns=['x']).astype({'x':'Int64'})
```