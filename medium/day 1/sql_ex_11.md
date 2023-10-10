# Friend Requests II: Who Has the Most Friends

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `REQUESTACCEPTED`

| Column Name  | Type |
|--------------|------|
| requester_id | int  |
| accepter_id  | int  |
| accept_date  | date |

`(requester_id, accepter_id)` is the primary key (combination of columns with unique values) for this table.

This table contains the `ID` of the user who sent the request, the `ID` of the user who received the request, 
and the `date` when the request was accepted.

## Task

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
REQUESTACCEPTED table:

| requester_id | accepter_id | accept_date |
|--------------|-------------|-------------|
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |

Output: 

| id  | num |
|-----|-----|
| 3   | 3   |

## Explanation ##

The person with id `3` is a friend of people `1`, `2`, and `4`, so he has three friends in total, 
which is the most number than any others.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the requestaccepted table
Create table If Not Exists RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null)
    
-- Populate the requestaccepted table
Truncate table RequestAccepted
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09')
```

### Pandas Code

```python
# request_accepted data
data = [[1, 2, '2016/06/03'], [1, 3, '2016/06/08'], [2, 3, '2016/06/08'], [3, 4, '2016/06/09']]

# request_accepted dataframe
request_accepted = pd.DataFrame(data, 
                                columns=['requester_id', 'accepter_id', 'accept_date']) \
                               .astype({'requester_id':'Int64', 'accepter_id':'Int64', 'accept_date':'datetime64[ns]'})
```