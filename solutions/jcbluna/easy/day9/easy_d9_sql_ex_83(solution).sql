-- Create the store table
CREATE TABLE Store (bill_id int, customer_id int, amount int);

-- Populate the store table    
TRUNCATE TABLE Store;
INSERT INTO Store (bill_id, customer_id, amount) VALUES ('6', '1', '549');
INSERT INTO Store (bill_id, customer_id, amount) VALUES ('8', '1', '834');
INSERT INTO Store (bill_id, customer_id, amount) VALUES ('4', '2', '394');
INSERT INTO Store (bill_id, customer_id, amount) VALUES ('11', '3', '657');
INSERT INTO Store (bill_id, customer_id, amount) VALUES ('13', '3', '257');

-- Solve the exercise
SELECT COUNT(DISTINCT customer_id) AS rich_count
FROM Store s
WHERE EXISTS (SELECT bill_id FROM Store
                WHERE customer_id=s.customer_id
                AND amount>500);

-- Drop unused table
DROP TABLE Store;