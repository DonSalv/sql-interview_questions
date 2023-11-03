-- Create the table Customers
CREATE TABLE Customer (id int, name varchar(25), referee_id int);

-- Populate the table Customers
TRUNCATE TABLE Customer;
INSERT INTO Customer (id, name, referee_id) VALUES ('1', 'Will', NULL);
INSERT INTO Customer (id, name, referee_id) VALUES ('2', 'Jane', NULL);
INSERT INTO Customer (id, name, referee_id) VALUES ('3', 'Alex', '2');
INSERT INTO Customer (id, name, referee_id) VALUES ('4', 'Bill', NULL);
INSERT INTO Customer (id, name, referee_id) VALUES ('5', 'Zack', '1');
INSERT INTO Customer (id, name, referee_id) VALUES ('6', 'Mark', '2');

-- Solve the exercise
SELECT name
FROM Customer
WHERE referee_id!=2
OR referee_id IS NULL
ORDER BY referee_id NULLS FIRST;

-- Drop unused table
DROP TABLE Customer;