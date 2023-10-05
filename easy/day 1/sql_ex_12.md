# Friend Requests I: Overall Acceptance Rate

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `FRIENDREQUEST`


| Column Name  | Type |
|--------------|------|
| sender_id    | int  |
| send_to_id   | int  |
| request_date | date |

This table may contain duplicates (In other words, there is no primary key for this table in `SQL`).
This table contains the ID of the user who sent the request, the ID of the user who received the request, 
and the date of the request.

**Table**: `REQUESTACCEPTED`

| Column Name  | Type |
|--------------|------|
| requester_id | int  |
| accepter_id  | int  |
| accept_date  | date |

This table may contain duplicates (In other words, there is no primary key for this table in `SQL`).
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.

## Task

Find the overall acceptance rate of requests, which is the number of acceptance divided by the number of requests. Return the answer rounded to 2 decimals places.
**Note that**:
- The accepted requests are not necessarily from the table ``friend_request``. In this case, Count the total accepted requests (no matter whether they are in the original requests), and divide it by the number of requests to get the acceptance rate.
- It is possible that a sender sends multiple requests to the same receiver, and a request could be accepted more than once. In this case, the ‘duplicated’ requests or acceptances are only counted once.
- If there are no requests at all, you should return `0.00` as the `accept_rate`.

**Follow up:**
- Could you find the acceptance rate for every month?
- Could you find the cumulative acceptance rate for every day?

## Description of the Solution ##
The result format is in the following example.

Example 1:

Input:

FRIENDREQUEST table:

| sender_id  | send_to_id | request_date |
|------------|------------|--------------|
| 1          | 2          | 2016/06/01   |
| 1          | 3          | 2016/06/01   |
| 1          | 4          | 2016/06/01   |
| 2          | 3          | 2016/06/02   |
| 3          | 4          | 2016/06/09   |

REQUESTACCEPTED table:

| requester_id | accepter_id | accept_date |
|--------------|-------------|-------------|
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
| 3            | 4           | 2016/06/10  |

Output: 

| accept_rate |
|-------------|
| 0.8         |

## Explanation ##
There are `4` unique accepted requests, and there are `5` requests in total. 
So the `rate` is `0.80`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists FriendRequest (sender_id int, send_to_id int, request_date date)
Create table If Not Exists RequestAccepted (requester_id int, accepter_id int, accept_date date)

-- Populate the friendrequest table    
Truncate table FriendRequest
insert into FriendRequest (sender_id, send_to_id, request_date) values ('1', '2', '2016/06/01')
insert into FriendRequest (sender_id, send_to_id, request_date) values ('1', '3', '2016/06/01')
insert into FriendRequest (sender_id, send_to_id, request_date) values ('1', '4', '2016/06/01')
insert into FriendRequest (sender_id, send_to_id, request_date) values ('2', '3', '2016/06/02')
insert into FriendRequest (sender_id, send_to_id, request_date) values ('3', '4', '2016/06/09')

-- Populate the requestaccepted
Truncate table RequestAccepted
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/10')
```

### Pandas Code

```python
# friend_request data
data = [[1, 2, '2016/06/01'], 
        [1, 3, '2016/06/01'], 
        [1, 4, '2016/06/01'], 
        [2, 3, '2016/06/02'], 
        [3, 4, '2016/06/09']]

# friend_request dataframe
friend_request = pd.DataFrame(data, 
                              columns=['sender_id', 'send_to_id', 'request_date']) \
                              .astype({'sender_id':'Int64', 
                                       'send_to_id':'Int64', 
                                       'request_date':'datetime64[ns]'})

# request accepted data
data = [[1, 2, '2016/06/03'], 
        [1, 3, '2016/06/08'], 
        [2, 3, '2016/06/08'], 
        [3, 4, '2016/06/09'], 
        [3, 4, '2016/06/10']]

# request accepted dataframe
request_accepted = pd.DataFrame(data, 
                                columns=['requester_id', 'accepter_id', 'accept_date']) \
                                .astype({'requester_id':'Int64', 
                                         'accepter_id':'Int64', 
                                         'accept_date':'datetime64[ns]'})
```
