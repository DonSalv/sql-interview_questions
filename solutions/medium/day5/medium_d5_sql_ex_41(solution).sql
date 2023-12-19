Create table Customers (customer_id int, customer_name varchar(20), email varchar(30), CONSTRAINT Customers_pk PRIMARY KEY (customer_id));
Create table Contacts (user_id int, contact_name varchar(20), contact_email varchar(30),
CONSTRAINT fk_Contacts FOREIGN KEY (user_id) REFERENCES Customers(customer_id));
Create table Invoices (invoice_id int, price int, user_id int, CONSTRAINT Invoices_pk PRIMARY KEY (invoice_id),
CONSTRAINT fk_Invoices FOREIGN KEY (user_id) REFERENCES Customers(customer_id));

ALTER TABLE Contacts ADD PRIMARY KEY (user_id, contact_email) DISABLE;

insert into Customers (customer_id, customer_name, email) values ('1', 'Alice', 'alice@leetcode.com');
insert into Customers (customer_id, customer_name, email) values ('2', 'Bob', 'bob@leetcode.com');
insert into Customers (customer_id, customer_name, email) values ('13', 'John', 'john@leetcode.com');
insert into Customers (customer_id, customer_name, email) values ('6', 'Alex', 'alex@leetcode.com');

insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Bob', 'bob@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'John', 'john@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Jal', 'jal@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Omar', 'omar@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Meir', 'meir@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('6', 'Alice', 'alice@leetcode.com');

insert into Invoices (invoice_id, price, user_id) values ('77', '100', '1');
insert into Invoices (invoice_id, price, user_id) values ('88', '200', '1');
insert into Invoices (invoice_id, price, user_id) values ('99', '300', '2');
insert into Invoices (invoice_id, price, user_id) values ('66', '400', '2');
insert into Invoices (invoice_id, price, user_id) values ('55', '500', '13');
insert into Invoices (invoice_id, price, user_id) values ('44', '60', '6');

SELECT Q3.invoice_id, Q3.customer_name, Q3.price, 
COALESCE(q3.contacts_cnt,0) AS contacts_cnt, COALESCE(q4.trusted_contacts_cnt,0) AS trusted_contacts_cnt FROM
(SELECT Q1.invoice_id, Q1.customer_name, Q1.price, q2.contacts_cnt, Q2.user_id FROM
(SELECT i.invoice_id, i.price, c.customer_id, c.customer_name FROM Invoices i
JOIN Customers c ON i.user_id=c.customer_id) Q1
LEFT JOIN
(SELECT user_id, COUNT(*) AS contacts_cnt FROM Contacts
GROUP BY user_id) Q2
ON Q1.customer_id=Q2.user_id) Q3
LEFT JOIN
(SELECT c1.user_id, COUNT(*) AS trusted_contacts_cnt FROM Contacts c1
JOIN Customers c2 ON c1.contact_email=c2.email
GROUP BY c1.user_id) Q4
ON Q3.user_id=Q4.user_id
ORDER BY Q3.invoice_id;

DROP TABLE Invoices PURGE;
DROP TABLE Contacts PURGE;
DROP TABLE Customers PURGE;