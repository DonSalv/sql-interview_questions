# Immediate Food Delivery I

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `DELIVERY`

| Column Name                 | Type |
|-----------------------------|------|
| delivery_id                 | int  |
| customer_id                 | int  |
| order_date                  | date |
| customer_pref_delivery_date | date |

`delivery_id` is the primary key (column with unique values) of this table.
The table holds information about food delivery to customers that make orders at some date and 
specify a preferred delivery date (on the same order date or after it).

## Task

If the customer's preferred delivery date is the same as the order date, then the order is called 
**immediate**; otherwise, it is called **scheduled**.

Write a solution to find the percentage of immediate orders in the table, **rounded to 2 decimal places**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
DELIVERY table:

| delivery_id | customer_id | order_date | customer_pref_delivery_date |
|-------------|-------------|------------|-----------------------------|
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 5           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-11                  |
| 4           | 3           | 2019-08-24 | 2019-08-26                  |
| 5           | 4           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |

Output: 

| immediate_percentage |
|----------------------|
| 33.33                |

## Explanation ##

The orders with delivery `id = 2` and `id = 3` are immediate while the others are scheduled.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the delivery table
Create table If Not Exists Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date)
    
-- Populate the delivery table
Truncate table Delivery
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '5', '2019-08-02', '2019-08-02')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-11')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-26')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '4', '2019-08-21', '2019-08-22')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13')
```

### Pandas Code

```python
# delivery data
data = [[1, 1, '2019-08-01', '2019-08-02'], 
        [2, 5, '2019-08-02', '2019-08-02'], 
        [3, 1, '2019-08-11', '2019-08-11'], 
        [4, 3, '2019-08-24', '2019-08-26'], 
        [5, 4, '2019-08-21', '2019-08-22'], 
        [6, 2, '2019-08-11', '2019-08-13']]

# delivery dataframe
delivery = pd.DataFrame(data, 
                        columns=['delivery_id', 'customer_id', 'order_date', 'customer_pref_delivery_date']) \
                        .astype({'delivery_id':'Int64', 
                                 'customer_id':'Int64', 
                                 'order_date':'datetime64[ns]', 
                                 'customer_pref_delivery_date':'datetime64[ns]'})
```