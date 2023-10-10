# Shortest Distance in a Plane

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `POINT2D`

| Column Name | Type |
|-------------|------|
| x           | int  |
| y           | int  |

`(x, y)` is the primary key column (combination of columns with unique values) for this table.

Each row of this table indicates the position of a point on the `X-Y plane`.

## Task

The distance between two points `p1(x1, y1)` and `p2(x2, y2)` is `sqrt((x2 - x1)2 + (y2 - y1)2)`.

Write a solution to report the shortest distance between any two points from the `POINT2D` table. 

Round the distance to **two decimal points**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
POINT2D table:

| x   | y   |
|-----|-----|
| -1  | -1  |
| 0   | 0   |
| -1  | -2  |

Output: 

| shortest |
|----------|
| 1.00     |

## Explanation ##

The shortest distance is `1.00` from point `(-1, -1)` to `(-1, 2)`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the point2d table
Create Table If Not Exists Point2D (x int not null, y int not null)
    
-- Populate the point2d table
Truncate table Point2D
insert into Point2D (x, y) values ('-1', '-1')
insert into Point2D (x, y) values ('0', '0')
insert into Point2D (x, y) values ('-1', '-2')
```

### Pandas Code

```python
# point2_d data
data = [[-1, -1], [0, 0], [-1, -2]]

# point2_d dataframe
point2_d = pd.DataFrame(data, 
                        columns=['x', 'y']) \
                       .astype({'x':'Int64', 'y':'Int64'})
```