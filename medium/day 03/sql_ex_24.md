# Active Businesses

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `EVENTS`

| Column Name | Type    |
|-------------|---------|
| business_id | int     |
| event_type  | varchar |
| occurences  | int     | 

`(business_id, event_type)` is the primary key (combination of columns with unique values) of this table.

Each row in the table logs the info that an `event` of some type occurred at some business for a number of times.

## Task

The **average activity** for a particular `event_type` is the average `occurences` across all companies that have 
this event.

An **active business** is a business that has **more than one** `event_type` such that their occurences is 
**strictly greater** than the average activity for that event.

Write a solution to find all **active businesses**.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
EVENTS table:

| business_id | event_type | occurences |
|-------------|------------|------------|
| 1           | reviews    | 7          |
| 3           | reviews    | 3          |
| 1           | ads        | 11         |
| 2           | ads        | 7          |
| 3           | ads        | 6          |
| 1           | page views | 3          |
| 2           | page views | 12         |

Output: 

| business_id |
|-------------|
| 1           |

## Explanation ##

The average activity for each event can be calculated as follows:
- '`reviews`': (7+3)/2 = 5
- '`ads`': (11+7+6)/3 = 8
- '`page views`': (3+12)/2 = 7.5
The business with `id=1` has `7` 'reviews' events (more than `5`) and `11` 'ads' events (more than `8`), 

So it is an active business.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the events table
Create table If Not Exists Events (business_id int, event_type varchar(10), occurences int)

-- Populate the events table
Truncate table Events
insert into Events (business_id, event_type, occurences) values ('1', 'reviews', '7')
insert into Events (business_id, event_type, occurences) values ('3', 'reviews', '3')
insert into Events (business_id, event_type, occurences) values ('1', 'ads', '11')
insert into Events (business_id, event_type, occurences) values ('2', 'ads', '7')
insert into Events (business_id, event_type, occurences) values ('3', 'ads', '6')
insert into Events (business_id, event_type, occurences) values ('1', 'page views', '3')
insert into Events (business_id, event_type, occurences) values ('2', 'page views', '12')
```

### Pandas Code

```python
# events data
data = [[1, 'reviews', 7], [3, 'reviews', 3], [1, 'ads', 11], [2, 'ads', 7], 
        [3, 'ads', 6], [1, 'page views', 3], [2, 'page views', 12]]

# events dataframe
events = pd.DataFrame(data, 
                      columns=['business_id', 'event_type', 'occurences']) \
                     .astype({'business_id':'Int64', 'event_type':'object', 'occurences':'Int64'})
```