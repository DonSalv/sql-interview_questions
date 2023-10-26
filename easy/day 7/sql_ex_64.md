# Invalid Tweets

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TWEETS`

| Column Name | Type    |
|-------------|---------|
| tweet_id    | int     |
| content     | varchar |

`tweet_id` is the primary key (column with unique values) for this table.

This table contains all the tweets in a social media app.

## Task

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters 
used in the content of the tweet is **strictly greater** than `15`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TWEETS table:

| tweet_id | content                          |
|----------|----------------------------------|
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |

Output: 

| tweet_id |
|----------|
| 2        |

## Explanation ##

- Tweet `1` has `length = 14`. It is a valid tweet.
- Tweet `2` has `length = 32`. It is an invalid tweet.

## Schemas & scripts

### SQL Schema

```genericsql
-- Creat the twweets table
Create table If Not Exists Tweets(tweet_id int, content varchar(50))

-- Populate the tweets table
Truncate table Tweets
insert into Tweets (tweet_id, content) values ('1', 'Vote for Biden')
insert into Tweets (tweet_id, content) values ('2', 'Let us make America great again!')
```

### Pandas Code

```python
# tweets data
data = [[1, 'Vote for Biden'], [2, 'Let us make America great again!']]

# tweets dataframe
tweets = pd.DataFrame(data, 
                      columns=['tweet_id', 'content']) \
                     .astype({'tweet_id':'Int64', 'content':'object'})
```