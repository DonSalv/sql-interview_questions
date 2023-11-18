-- Create the tables
CREATE TABLE Customers (customer_id int, customer_name varchar(20), email varchar(30));
CREATE TABLE Contacts (user_id int, contact_name varchar(20), contact_email varchar(30));
CREATE TABLE Invoices (invoice_id int, price int, user_id int);

-- Populate the customers table    
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, customer_name, email) VALUES ('1', 'Alice', 'alice@leetcode.com');
INSERT INTO Customers (customer_id, customer_name, email) VALUES ('2', 'Bob', 'bob@leetcode.com');
INSERT INTO Customers (customer_id, customer_name, email) VALUES ('13', 'John', 'john@leetcode.com');
INSERT INTO Customers (customer_id, customer_name, email) VALUES ('6', 'Alex', 'alex@leetcode.com');

-- Populate the contacts table    
TRUNCATE TABLE Contacts;
INSERT INTO Contacts (user_id, contact_name, contact_email) VALUES ('1', 'Bob', 'bob@leetcode.com');
INSERT INTO Contacts (user_id, contact_name, contact_email) VALUES ('1', 'John', 'john@leetcode.com');
INSERT INTO Contacts (user_id, contact_name, contact_email) VALUES ('1', 'Jal', 'jal@leetcode.com');
INSERT INTO Contacts (user_id, contact_name, contact_email) VALUES ('2', 'Omar', 'omar@leetcode.com');
INSERT INTO Contacts (user_id, contact_name, contact_email) VALUES ('2', 'Meir', 'meir@leetcode.com');
INSERT INTO Contacts (user_id, contact_name, contact_email) VALUES ('6', 'Alice', 'alice@leetcode.com');

-- Populate the invoices table    
TRUNCATE TABLE Invoices;
INSERT INTO Invoices (invoice_id, price, user_id) VALUES ('77', '100', '1');
INSERT INTO Invoices (invoice_id, price, user_id) VALUES ('88', '200', '1');
INSERT INTO Invoices (invoice_id, price, user_id) VALUES ('99', '300', '2');
INSERT INTO Invoices (invoice_id, price, user_id) VALUES ('66', '400', '2');
INSERT INTO Invoices (invoice_id, price, user_id) VALUES ('55', '500', '13');
INSERT INTO Invoices (invoice_id, price, user_id) VALUES ('44', '60', '6');

-- Solve the exercise
-- 3. Count the not null contacts and contacts that are customers (contact_client)
SELECT invoice_id, customer_name, price, COUNT(contact_name) AS contacts_cnt, COUNT(contact_client) AS trusted_contacts_cnt
FROM(
-- 1. Create a join between the tables    
SELECT invoice_id, customer_name, price, contact_name, 
-- 2. Add a column to check if the contact is in the Customers table
(CASE WHEN (contact_name, contact_email) IN (SELECT customer_name, email FROM Customers) THEN 1 ELSE NULL END) AS contact_client
FROM Invoices i LEFT OUTER JOIN Customers cu
ON(i.user_id=cu.customer_id)
LEFT OUTER JOIN  Contacts co
ON(cu.customer_id=co.user_id)
ORDER BY invoice_id)
GROUP BY invoice_id, customer_name, price
ORDER BY invoice_id;

-- Drop unused tables
DROP TABLE Customers;
DROP TABLE Contacts;
DROP TABLE Invoices;