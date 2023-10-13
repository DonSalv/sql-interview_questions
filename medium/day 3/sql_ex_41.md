# Number of Trusted Contacts of a Customer

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 
**Table**: `CUSTOMERS`

| Column Name   | Type    |
|---------------|---------|
| customer_id   | int     |
| customer_name | varchar |
| email         | varchar |

`customer_id` is the column of unique values for this table.

Each row of this table contains the `name` and the `email` of a customer of an online shop.

**Table**: `CONTACTS`

| Column Name   | Type    |
|---------------|---------|
| user_id       | id      |
| contact_name  | varchar |
| contact_email | varchar |

`(user_id, contact_email)` is the primary key (combination of columns with unique values) for this table.

Each row of this table contains the `name` and `email` of one `contact` of customer with `user_id`.

This table contains information about people each customer trust. 
The contact may or may not exist in the `CUSTOMERS` table.

**Table**: `INVOICES`

| Column Name | Type |
|-------------|------|
| invoice_id  | int  |
| price       | int  |
| user_id     | int  |

`invoice_id` is the column of unique values for this table.

Each row of this table indicates that `user_id` has an invoice with `invoice_id` and a `price`.

## Task

Write a solution to find the following for each `invoice_id`:

- `customer_name`: The name of the customer the invoice is related to.
- `price`: The price of the invoice.
- `contacts_cnt`: The number of contacts related to the customer.
- `trusted_contacts_cnt`: The number of contacts related to the customer and at the same time they are customers 
to the shop. (i.e their email exists in the `CUSTOMERS` table.)

**Return** the result table ordered by `invoice_id`.

## Description of the Solution ##

Example 1:

Input: 
CUSTOMERS table:

| customer_id | customer_name | email              |
|-------------|---------------|--------------------|
| 1           | Alice         | alice@leetcode.com |
| 2           | Bob           | bob@leetcode.com   |
| 13          | John          | john@leetcode.com  |
| 6           | Alex          | alex@leetcode.com  |

CONTACTS table:

| user_id | contact_name | contact_email      |
|---------|--------------|--------------------|
| 1       | Bob          | bob@leetcode.com   |
| 1       | John         | john@leetcode.com  |
| 1       | Jal          | jal@leetcode.com   |
| 2       | Omar         | omar@leetcode.com  |
| 2       | Meir         | meir@leetcode.com  |
| 6       | Alice        | alice@leetcode.com |

INVOICES table:

| invoice_id | price | user_id |
|------------|-------|---------|
| 77         | 100   | 1       |
| 88         | 200   | 1       |
| 99         | 300   | 2       |
| 66         | 400   | 2       |
| 55         | 500   | 13      |
| 44         | 60    | 6       |

Output: 

| invoice_id | customer_name | price | contacts_cnt | trusted_contacts_cnt |
|------------|---------------|-------|--------------|----------------------|
| 44         | Alex          | 60    | 1            | 1                    |
| 55         | John          | 500   | 0            | 0                    |
| 66         | Bob           | 400   | 2            | 0                    |
| 77         | Alice         | 100   | 3            | 2                    |
| 88         | Alice         | 200   | 3            | 2                    |
| 99         | Bob           | 300   | 2            | 0                    |

## Explanation ##

- `Alice` has three contacts, two of them are trusted contacts (`Bob` and `John`).
- `Bob` has two contacts, none of them is a trusted contact.
- `Alex` has one contact and it is a trusted contact (`Alice`).
- `John` doesn't have any contacts.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Customers (customer_id int, customer_name varchar(20), email varchar(30))
Create table If Not Exists Contacts (user_id int, contact_name varchar(20), contact_email varchar(30))
Create table If Not Exists Invoices (invoice_id int, price int, user_id int)

-- Populate the customers table    
Truncate table Customers
insert into Customers (customer_id, customer_name, email) values ('1', 'Alice', 'alice@leetcode.com')
insert into Customers (customer_id, customer_name, email) values ('2', 'Bob', 'bob@leetcode.com')
insert into Customers (customer_id, customer_name, email) values ('13', 'John', 'john@leetcode.com')
insert into Customers (customer_id, customer_name, email) values ('6', 'Alex', 'alex@leetcode.com')

-- Populate the contacts table    
Truncate table Contacts
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Bob', 'bob@leetcode.com')
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'John', 'john@leetcode.com')
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Jal', 'jal@leetcode.com')
insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Omar', 'omar@leetcode.com')
insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Meir', 'meir@leetcode.com')
insert into Contacts (user_id, contact_name, contact_email) values ('6', 'Alice', 'alice@leetcode.com')

-- Populate the invoices table    
Truncate table Invoices
insert into Invoices (invoice_id, price, user_id) values ('77', '100', '1')
insert into Invoices (invoice_id, price, user_id) values ('88', '200', '1')
insert into Invoices (invoice_id, price, user_id) values ('99', '300', '2')
insert into Invoices (invoice_id, price, user_id) values ('66', '400', '2')
insert into Invoices (invoice_id, price, user_id) values ('55', '500', '13')
insert into Invoices (invoice_id, price, user_id) values ('44', '60', '6')
```

### Pandas Code

```python
# customers data
data = [[1, 'Alice', 'alice@leetcode.com'], [2, 'Bob', 'bob@leetcode.com'], 
        [13, 'John', 'john@leetcode.com'], [6, 'Alex', 'alex@leetcode.com']]

# customers dataframe
customers = pd.DataFrame(data, 
                         columns=['customer_id', 'customer_name', 'email'])\
                        .astype({'customer_id':'Int64', 'customer_name':'object', 'email':'object'})

# contacts data
data = [[1, 'Bob', 'bob@leetcode.com'], [1, 'John', 'john@leetcode.com'], [1, 'Jal', 'jal@leetcode.com'],
        [2, 'Omar', 'omar@leetcode.com'], [2, 'Meir', 'meir@leetcode.com'], [6, 'Alice', 'alice@leetcode.com']]

# contacts dataframe
contacts = pd.DataFrame(data, 
                        columns=['user_id', 'contact_name', 'contact_email']) \
                       .astype({'user_id':'Int64', 'contact_name':'object', 'contact_email':'object'})

# invoices data
data = [[77, 100, 1], [88, 200, 1], [99, 300, 2], [66, 400, 2], [55, 500, 13], [44, 60, 6]]

# invoices dataframe
invoices = pd.DataFrame(data, 
                        columns=['invoice_id', 'price', 'user_id']) \
                       .astype({'invoice_id':'Int64', 'price':'Int64', 'user_id':'Int64'})
```