# Triangle Judgement

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TRIANGLE`

| Column Name | Type |
|-------------|------|
| x           | int  |
| y           | int  |
| z           | int  |

In SQL, `(x, y, z)` is the primary key column for this table.
Each row of this table contains the lengths of three line segments.

## Task

Report for every three line segments whether they can form a triangle.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TRIANGLE table:

| x   | y   | z   |
|-----|-----|-----|
| 13  | 15  | 30  |
| 10  | 20  | 15  |

Output: 

| x    | y    | z    | triangle |
|------|------|------|----------|
| 13   | 15   | 30   | No       |
| 10   | 20   | 15   | Yes      |

## Explanation ##

No explanation. **Hint**: Search for a condition on the length of the sides of a triangle.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the triangle table
Create table If Not Exists Triangle (x int, y int, z int)

-- Populate the triangle table
Truncate table Triangle
insert into Triangle (x, y, z) values ('13', '15', '30')
insert into Triangle (x, y, z) values ('10', '20', '15')
```

### Pandas Code

```python
# triangle data
data = [[13, 15, 30], 
        [10, 20, 15]]

# triangle dataframe
triangle = pd.DataFrame(data, 
                        columns=['x', 'y', 'z']) \
                        .astype({'x':'Int64', 'y':'Int64', 'z':'Int64'})
```