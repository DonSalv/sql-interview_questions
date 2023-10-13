# Count Apples and Oranges

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `BOXES`

| Column Name  | Type |
|--------------|------|
| box_id       | int  |
| chest_id     | int  |
| apple_count  | int  |
| orange_count | int  |

`box_id` is the column with unique values for this table.

`chest_id` is a foreign key (reference column) of the chests table.

This table contains information about the boxes and the number of oranges and apples they have. 
Each box may include a chest, which also can contain oranges and apples.

**Table**: `CHESTS`

| Column Name  | Type |

| chest_id     | int  |
| apple_count  | int  |
| orange_count | int  |

`chest_id` is the column with unique values for this table.

This table contains information about the chests and the corresponding number of oranges and apples they have.

## Task

Write a solution to count the number of apples and oranges in all the boxes. If a box contains a chest, 
you should also include the number of apples and oranges it has.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
BOXES table:

| box_id | chest_id | apple_count | orange_count |
|--------|----------|-------------|--------------|
| 2      | null     | 6           | 15           |
| 18     | 14       | 4           | 15           |
| 19     | 3        | 8           | 4            |
| 12     | 2        | 19          | 20           |
| 20     | 6        | 12          | 9            |
| 8      | 6        | 9           | 9            |
| 3      | 14       | 16          | 7            |

CHESTS table:

| chest_id | apple_count | orange_count |
|----------|-------------|--------------|
| 6        | 5           | 6            |
| 14       | 20          | 10           |
| 2        | 8           | 8            |
| 3        | 19          | 4            |
| 16       | 19          | 19           |

Output: 

| apple_count | orange_count |
|-------------|--------------|
| 151         | 123          |

## Explanation ##

- `box` `2` has `6` apples and `15` oranges.
- `box` `18` has 4 + 20 (from the chest) = `24` apples and 15 + 10 (from the chest) = `25` oranges.
- `box` `19` has 8 + 19 (from the chest) = `27` apples and 4 + 4 (from the chest) = `8` oranges.
- `box` `12` has 19 + 8 (from the chest) = `27` apples and 20 + 8 (from the chest) = `28` oranges.
- `box` `20` has 12 + 5 (from the chest) = `17` apples and 9 + 6 (from the chest) = `15` oranges.
- `box` `8` has 9 + 5 (from the chest) = `14` apples and 9 + 6 (from the chest) = `15` oranges.
- `box` `3` has 16 + 20 (from the chest) = `36` apples and 7 + 10 (from the chest) = `17` oranges.
- Total `number of apples` = 6 + 24 + 27 + 27 + 17 + 14 + 36 = `151`
- Total `number of oranges` = 15 + 25 + 8 + 28 + 15 + 15 + 17 = `123`

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Boxes (box_id int, chest_id int, apple_count int, orange_count int)
Create table If Not Exists Chests (chest_id int, apple_count int, orange_count int)

-- Populate the boxes table    
Truncate table Boxes
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('2', 'None', '6', '15')
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('18', '14', '4', '15')
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('19', '3', '8', '4')
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('12', '2', '19', '20')
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('20', '6', '12', '9')
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('8', '6', '9', '9')
insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('3', '14', '16', '7')

-- Populate the chests table
Truncate table Chests
insert into Chests (chest_id, apple_count, orange_count) values ('6', '5', '6')
insert into Chests (chest_id, apple_count, orange_count) values ('14', '20', '10')
insert into Chests (chest_id, apple_count, orange_count) values ('2', '8', '8')
insert into Chests (chest_id, apple_count, orange_count) values ('3', '19', '4')
insert into Chests (chest_id, apple_count, orange_count) values ('16', '19', '19')
```

### Pandas Code

```python
# boxes data
data = [[2, None, 6, 15], [18, 14, 4, 15], [19, 3, 8, 4], 
        [12, 2, 19, 20], [20, 6, 12, 9], [8, 6, 9, 9], [3, 14, 16, 7]]

# boxes dataframe
boxes = pd.DataFrame(data, 
                     columns=['box_id', 'chest_id', 'apple_count', 'orange_count']) \
                    .astype({'box_id':'Int64', 'chest_id':'Int64', 'apple_count':'Int64', 'orange_count':'Int64'})

# chests data
data = [[6, 5, 6], [14, 20, 10], [2, 8, 8], [3, 19, 4], [16, 19, 19]]

# chests dataframe
chests = pd.DataFrame(data, 
                      columns=['chest_id', 'apple_count', 'orange_count']) \
                     .astype({'chest_id':'Int64', 'apple_count':'Int64', 'orange_count':'Int64'})
```