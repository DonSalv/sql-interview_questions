Create table Customer (id int, name varchar(25), referee_id int);

Truncate table Customer;
insert into Customer (id, name, referee_id) values (1, 'Will', NULL);
insert into Customer (id, name, referee_id) values (2, 'Jane', NULL);
insert into Customer (id, name, referee_id) values (3, 'Alex', 2);
insert into Customer (id, name, referee_id) values (4, 'Bill', NULL);
insert into Customer (id, name, referee_id) values (5, 'Zack', 1);
insert into Customer (id, name, referee_id) values (6, 'Mark', 2);

-- Find the names of the customer that are not referred by the customer with id = 2.
SELECT name 
FROM Customer 
WHERE referee_id != 2 OR referee_id is NULL;
