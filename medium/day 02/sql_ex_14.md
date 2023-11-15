# Second Degree Follower

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `FOLLOW`

| Column Name | Type    |
|-------------|---------|
| followee    | varchar |
| follower    | varchar |

`(followee, follower)` is the primary key (combination of columns with unique values) for this table.

Each row of this table indicates that the user `follower` follows the user `followee` on a social network.

There will not be a user following themself.

## Task

A **second-degree follower** is a user who:

- follows at least one user, and
- is followed by at least one user.

Write a solution to report the **second-degree users** and the number of their followers.

**Return** the result table **ordered by** `follower` **in alphabetical order**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
FOLLOW table:

| followee | follower |
|----------|----------|
| Alice    | Bob      |
| Bob      | Cena     |
| Bob      | Donald   |
| Donald   | Edward   |

Output: 

| follower | num |
|----------|-----|
| Bob      | 2   |
| Donald   | 1   |

## Explanation ##

- User `Bob` has `2` followers. `Bob` is a second-degree follower because he follows `Alice`, so we include him in the 
result table.
- User `Donald` has `1` follower. `Donald` is a second-degree follower because he follows `Bob`, so we include 
him in the result table.
- User `Alice` has `1` follower. `Alice` is not a second-degree follower because she does not follow anyone,
so we don not include her in the result table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the follow table
Create table If Not Exists Follow (followee varchar(255), follower varchar(255))
    
-- Populate the follow table
Truncate table Follow
insert into Follow (followee, follower) values ('Alice', 'Bob')
insert into Follow (followee, follower) values ('Bob', 'Cena')
insert into Follow (followee, follower) values ('Bob', 'Donald')
insert into Follow (followee, follower) values ('Donald', 'Edward')
```

### Pandas Code

```python
# follow data
data = [['Alice', 'Bob'], ['Bob', 'Cena'], ['Bob', 'Donald'], ['Donald', 'Edward']]

# follow dataframe
follow = pd.DataFrame(data, 
                      columns=['followee', 'follower']) \
                     .astype({'followee':'object', 'follower':'object'})
```