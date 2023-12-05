-- Create the coffeeshop table
Create table CoffeeShop (id int, drink varchar(20));

-- Populate the coffeeshop table    
Truncate table CoffeeShop;
insert into CoffeeShop (id, drink) values ('9', 'Rum and Coke');
insert into CoffeeShop (id, drink) values ('6', NULL);
insert into CoffeeShop (id, drink) values ('7', NULL);
insert into CoffeeShop (id, drink) values ('3', 'St Germain Spritz');
insert into CoffeeShop (id, drink) values ('1', 'Orange Margarita');
insert into CoffeeShop (id, drink) values ('2', NULL);

-- Write a solution to replace the null values of the drink with the name of the 
-- drink of the previous row that is not null. It is guaranteed that the drink on the first row of the table is not null.
-- Return the result table in the same order as the input
SELECT
    id,
    FIRST_VALUE(drink) OVER (PARTITION BY grp ORDER BY rownum) AS drink
FROM
    (SELECT
         id,
         drink,
         SUM(CASE WHEN drink is NULL THEN 0 ELSE 1 END) OVER (ORDER by rownum) AS grp
     FROM
         CoffeeShop);

-- Drop tables
DROP TABLE CoffeeShop;
