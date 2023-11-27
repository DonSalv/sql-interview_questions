-- Create the tables
Create table Customers (customer_id int, customer_name varchar(20), email varchar(30));
Create table Contacts (user_id int, contact_name varchar(20), contact_email varchar(30));
Create table Invoices (invoice_id int, price int, user_id int);

-- Populate the customers table    
Truncate table Customers;
insert into Customers (customer_id, customer_name, email) values (1, 'Alice', 'alice@leetcode.com');
insert into Customers (customer_id, customer_name, email) values (2, 'Bob', 'bob@leetcode.com');
insert into Customers (customer_id, customer_name, email) values (13, 'John', 'john@leetcode.com');
insert into Customers (customer_id, customer_name, email) values (6, 'Alex', 'alex@leetcode.com');

-- Populate the contacts table    
Truncate table Contacts;
insert into Contacts (user_id, contact_name, contact_email) values (1, 'Bob', 'bob@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values (1, 'John', 'john@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values (1, 'Jal', 'jal@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values (2, 'Omar', 'omar@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values (2, 'Meir', 'meir@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values (6, 'Alice', 'alice@leetcode.com');

-- Populate the invoices table    
Truncate table Invoices;
insert into Invoices (invoice_id, price, user_id) values (77, 100, 1);
insert into Invoices (invoice_id, price, user_id) values (88, 200, 1);
insert into Invoices (invoice_id, price, user_id) values (99, 300, 2);
insert into Invoices (invoice_id, price, user_id) values (66, 400, 2);
insert into Invoices (invoice_id, price, user_id) values (55, 500, 13);
insert into Invoices (invoice_id, price, user_id) values (44, 60, 6);

-- Write a solution to find the following for each invoice_id:
-- 	 * customer_name: The name of the customer the invoice is related to.
-- 	 * price: The price of the invoice.
-- 	 * contacts_cnt: The number of contacts related to the customer.
-- 	 * trusted_contacts_cnt: The number of contacts related to the customer and
--	   at the same time they are customers to the shop. (i.e their email exists in the CUSTOMERS table.)
-- Return the result table ordered by invoice_id
WITH num_contacts AS (
    SELECT 
        c.customer_name,
        COUNT(co.contact_name) AS contacts_cnt
    FROM 
        Customers c
    LEFT JOIN
        Contacts co
    ON
        co.user_id = c.customer_id
    GROUP BY
        c.customer_name),
    trusted_contacts AS (
    SELECT
        c.customer_name,
        COUNT(c.customer_name) AS trusted_contacts_cnt
    FROM 
        Customers c
    LEFT JOIN
        Contacts co
    ON
        co.user_id = c.customer_id
    WHERE 
        co.contact_name IN (SELECT contact_name FROM Contacts WHERE contact_name IN (SELECT customer_name FROM Customers))
    GROUP BY
        c.customer_name)
SELECT
    i.invoice_id,
    c.customer_name,
    i.price,
    nc.contacts_cnt,
    NVL(tc.trusted_contacts_cnt, 0) AS trusted_contacts_cnt
FROM
    Invoices i
INNER JOIN
    Customers c
ON
    i.user_id = c.customer_id
LEFT JOIN
    num_contacts nc
ON
    nc.customer_name = c.customer_name
LEFT JOIN
    trusted_contacts tc
ON
    c.customer_name = tc.customer_name
ORDER BY
    i.invoice_id;

-- Drop tables
DROP TABLE Customers;
DROP TABLE Contacts;
DROP TABLE Invoices;
