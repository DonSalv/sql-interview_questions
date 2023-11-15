# Ads Performance

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ADS`

| Column Name | Type |
|-------------|------|
| ad_id       | int  |
| user_id     | int  |
| action      | enum |

`(ad_id, user_id)` is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the `ID` of an `Ad`, the `ID` of a `user`, and the action taken by this user 
regarding this Ad. The action column is an `ENUM` (category) type of `('Clicked', 'Viewed', 'Ignored')`.

## Task

A company is running Ads and wants to calculate the performance of each Ad.

Performance of the Ad is measured using Click-Through Rate (CTR) where:
- `CTR = 0`, If  `Ad` is the total clicks plus Ad total `views = 0` 
- `Ad total clicks / (Ad total clicks + Ad total views)` otherwise

Write a solution to find the `ctr` of each Ad. **Round** `ctr` to **two decimal points**.

Return the result table ordered by `ctr` in **descending order** and by `ad_id` in **ascending order** in case of a tie.

The result format is in the following example.

## Description of the Solution ##

Example 1:

Input: 
ADS table:

| ad_id | user_id | action  |
|-------|---------|---------|
| 1     | 1       | Clicked |
| 2     | 2       | Clicked |
| 3     | 3       | Viewed  |
| 5     | 5       | Ignored |
| 1     | 7       | Ignored |
| 2     | 7       | Viewed  |
| 3     | 5       | Clicked |
| 1     | 4       | Viewed  |
| 2     | 11      | Viewed  |
| 1     | 2       | Clicked |

Output: 

| ad_id | ctr   |
|-------|-------|
| 1     | 66.67 |
| 3     | 50.00 |
| 2     | 33.33 |
| 5     | 0.00  |

## Explanation ##

- For `ad_id = 1`, `ctr = (2/(2+1)) * 100 = 66.67`
- For `ad_id = 2`, `ctr = (1/(1+2)) * 100 = 33.33`
- For `ad_id = 3`, `ctr = (1/(1+1)) * 100 = 50.00`
- For `ad_id = 5`, `ctr = 0.00`, 

**Note** that ad_id = 5 has no clicks or views.

**Note** that we do not care about Ignored Ads.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the ads table
Create table If Not Exists Ads (ad_id int, user_id int, action ENUM('Clicked', 'Viewed', 'Ignored'))
    
-- Populate the ads table
Truncate table Ads
insert into Ads (ad_id, user_id, action) values ('1', '1', 'Clicked')
insert into Ads (ad_id, user_id, action) values ('2', '2', 'Clicked')
insert into Ads (ad_id, user_id, action) values ('3', '3', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('5', '5', 'Ignored')
insert into Ads (ad_id, user_id, action) values ('1', '7', 'Ignored')
insert into Ads (ad_id, user_id, action) values ('2', '7', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('3', '5', 'Clicked')
insert into Ads (ad_id, user_id, action) values ('1', '4', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('2', '11', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('1', '2', 'Clicked')
```

### Pandas Code

```python
# ads data
data = [[1, 1, 'Clicked'], [2, 2, 'Clicked'], [3, 3, 'Viewed'], [5, 5, 'Ignored'], 
        [1, 7, 'Ignored'], [2, 7, 'Viewed'], [3, 5, 'Clicked'], [1, 4, 'Viewed'], 
        [2, 11, 'Viewed'], [1, 2, 'Clicked']]

# ads dataframe
ads = pd.DataFrame(data, 
                   columns=['ad_id', 'user_id']) \
                   .astype({'ad_id':'Int64', 
                            'user_id':'Int64', 
                            'action':'object'})
```