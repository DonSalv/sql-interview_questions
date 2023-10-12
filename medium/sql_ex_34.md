# Page Recommendations

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `FRIENDSHIP`

| Column Name | Type |
|-------------|------|
| user1_id    | int  |
| user2_id    | int  |

`(user1_id, user2_id)` is the primary key (combination of columns with unique values) for this table.

Each row of this table indicates that there is a friendship relation between `user1_id` and `user2_id`.

**Table**: `LIKES`

| Column Name | Type |
|-------------|------|
| user_id     | int  |
| page_id     | int  |

`(user_id, page_id)` is the primary key (combination of columns with unique values) for this table.

Each row of this table indicates that `user_id` likes `page_id`.

## Task

Write a solution to recommend pages to the user with `user_id = 1` using the pages that your friends liked. 
It should not recommend pages you already liked.

**Return** result table in any order without duplicates.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
FRIENDSHIP table:

| user1_id | user2_id |
|----------|----------|
| 1        | 2        |
| 1        | 3        |
| 1        | 4        |
| 2        | 3        |
| 2        | 4        |
| 2        | 5        |
| 6        | 1        |

LIKES table:

| user_id | page_id |
|---------|---------|
| 1       | 88      |
| 2       | 23      |
| 3       | 24      |
| 4       | 56      |
| 5       | 11      |
| 6       | 33      |
| 2       | 77      |
| 3       | 77      |
| 6       | 88      |

Output: 

| recommended_page |
|------------------|
| 23               |
| 24               |
| 56               |
| 33               |
| 77               |

## Explanation ##

- User one is friend with users `2`, `3`, `4` and `6`.
- Suggested pages are `23` from user `2`, `24` from user `3`, `56` from user `3` and `33` from user `6`.
- Page `77` is suggested from both user `2` and user `3`.
- Page `88` is not suggested because user `1` already likes it.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Friendship (user1_id int, user2_id int)
Create table If Not Exists Likes (user_id int, page_id int)

-- Populate the friendship table    
Truncate table Friendship
insert into Friendship (user1_id, user2_id) values ('1', '2')
insert into Friendship (user1_id, user2_id) values ('1', '3')
insert into Friendship (user1_id, user2_id) values ('1', '4')
insert into Friendship (user1_id, user2_id) values ('2', '3')
insert into Friendship (user1_id, user2_id) values ('2', '4')
insert into Friendship (user1_id, user2_id) values ('2', '5')
insert into Friendship (user1_id, user2_id) values ('6', '1')
    
-- Populate the likes table
Truncate table Likes
insert into Likes (user_id, page_id) values ('1', '88')
insert into Likes (user_id, page_id) values ('2', '23')
insert into Likes (user_id, page_id) values ('3', '24')
insert into Likes (user_id, page_id) values ('4', '56')
insert into Likes (user_id, page_id) values ('5', '11')
insert into Likes (user_id, page_id) values ('6', '33')
insert into Likes (user_id, page_id) values ('2', '77')
insert into Likes (user_id, page_id) values ('3', '77')
insert into Likes (user_id, page_id) values ('6', '88')
```

### Pandas Code

```python
# friendship data
data = [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [2, 5], [6, 1]]

# friendship dataframe
friendship = pd.DataFrame(data, 
                          columns=['user1_id', 'user2_id']) \
                         .astype({'user1_id':'Int64', 'user2_id':'Int64'})

# likes data
data = [[1, 88], [2, 23], [3, 24], [4, 56], [5, 11], [6, 33], [2, 77], [3, 77], [6, 88]]

# likes dataframe
likes = pd.DataFrame(data, 
                     columns=['user_id', 'page_id']) \
                    .astype({'user_id':'Int64', 'page_id':'Int64'})
```