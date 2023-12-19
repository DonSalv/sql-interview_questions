Create table CoffeeShop (id int, drink varchar(20), CONSTRAINT CoffeeShop_pk PRIMARY KEY (id));

insert into CoffeeShop (id, drink) values ('9', 'Rum and Coke');
insert into CoffeeShop (id, drink) values ('6', NULL);
insert into CoffeeShop (id, drink) values ('7', NULL);
insert into CoffeeShop (id, drink) values ('3', 'St Germain Spritz');
insert into CoffeeShop (id, drink) values ('1', 'Orange Margarita');
insert into CoffeeShop (id, drink) values ('2', NULL);

SELECT id,
COALESCE(drink, LAG(drink IGNORE NULLS) OVER (ORDER BY ROWNUM)) AS drink
FROM (SELECT id, drink, ROWNUM FROM CoffeeShop);

DROP TABLE CoffeeShop PURGE;