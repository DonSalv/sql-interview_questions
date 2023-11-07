 -- Create the tables
Create table Prices (product_id int, start_date date, end_date date, price int);
Create table UnitsSold (product_id int, purchase_date date, units int);
    
-- Populate the prices table
Truncate table Prices;
insert into Prices (product_id, start_date, end_date, price) values (1, DATE '2019-02-17', DATE '2019-02-28', 5);
insert into Prices (product_id, start_date, end_date, price) values (1, DATE '2019-03-01', DATE '2019-03-22', 20);
insert into Prices (product_id, start_date, end_date, price) values (2, DATE '2019-02-01', DATE '2019-02-20', 15);
insert into Prices (product_id, start_date, end_date, price) values (2, DATE '2019-02-21', DATE '2019-03-31', 30);
    
-- Populate the unitsold table
Truncate table UnitsSold;
insert into UnitsSold (product_id, purchase_date, units) values (1, DATE '2019-02-25', 100);
insert into UnitsSold (product_id, purchase_date, units) values (1, DATE '2019-03-01', 15);
insert into UnitsSold (product_id, purchase_date, units) values (2, DATE '2019-02-10', 200);
insert into UnitsSold (product_id, purchase_date, units) values (2, DATE '2019-03-22', 30);

-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.
SELECT 
    t.product_id, 
    ROUND(t.total_profit/t2.num_units,2) average_price 
FROM (SELECT 
          product_id, 
          SUM(profit) total_profit 
      FROM (SELECT 
                p.product_id, 
                p.price * u.units profit
            FROM Prices p 
            INNER JOIN UnitsSold u 
            ON p.product_id = u.product_id 
            WHERE u.purchase_date BETWEEN p.start_date AND p.end_date)
      GROUP BY product_id) t
INNER JOIN (SELECT 
                product_id, 
                SUM(units) num_units 
            FROM (SELECT 
                      p.product_id, 
                      p.price, u.units 
                  FROM Prices p 
                  INNER JOIN UnitsSold u 
                  ON p.product_id = u.product_id 
                  WHERE u.purchase_date BETWEEN p.start_date AND p.end_date) 
            GROUP BY product_id) t2 
ON t.product_id = t2.product_id;

-- Drop tables
DROP TABLE Prices;
DROP TABLE UnitsSold;
