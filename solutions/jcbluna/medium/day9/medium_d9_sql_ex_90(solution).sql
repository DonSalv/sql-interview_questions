-- Create the coffeeshop table
CREATE TABLE CoffeeShop (id int, drink varchar(20));

-- Populate the coffeeshop table    
TRUNCATE TABLE CoffeeShop;
INSERT INTO CoffeeShop (id, drink) VALUES ('9', 'Rum and Coke');
INSERT INTO CoffeeShop (id, drink) VALUES ('6', NULL);
INSERT INTO CoffeeShop (id, drink) VALUES ('7', NULL);
INSERT INTO CoffeeShop (id, drink) VALUES ('3', 'St Germain Spritz');
INSERT INTO CoffeeShop (id, drink) VALUES ('1', 'Orange Margarita');
INSERT INTO CoffeeShop (id, drink) VALUES ('2', NULL);

-- Solve the exercise
WITH GroupCoffee AS
(-- 1. Create groups for consecutive null values and the previous
-- not null value
SELECT id, drink, SUM(CASE WHEN drink IS NOT NULL THEN 1 ELSE 0 END) OVER(ORDER BY rn) AS group_nn, rn
FROM(SELECT id, drink, ROWNUM as rn
FROM CoffeeShop))
SELECT gc1.id, gc2.drink
-- 2. Self join the table to replace the Nulls from one table
-- to the drink of the same group
FROM GroupCoffee gc1 JOIN (SELECT * FROM GroupCoffee WHERE drink IS NOT NULL) gc2
ON(gc2.group_nn=gc1.group_nn)
-- Force the original order of the table
ORDER BY gc1.rn;

-- Drop unused table
DROP TABLE CoffeeShop;