Create table Users (user_id int, item varchar(100),created_at date,amount int);

insert into Users (user_id, item, created_at, amount) values ('5', 'Smart Crock Pot', TO_DATE('2021-09-18','YYYY-MM-DD'), '698882');
insert into Users (user_id, item, created_at, amount) values ('6', 'Smart Lock', TO_DATE('2021-09-14','YYYY-MM-DD'), '11487');
insert into Users (user_id, item, created_at, amount) values ('6', 'Smart Thermostat', TO_DATE('2021-09-10','YYYY-MM-DD'), '674762');
insert into Users (user_id, item, created_at, amount) values ('8', 'Smart Light Strip', TO_DATE('2021-09-29','YYYY-MM-DD'), '630773');
insert into Users (user_id, item, created_at, amount) values ('4', 'Smart Cat Feeder', TO_DATE('2021-09-02','YYYY-MM-DD'), '693545');
insert into Users (user_id, item, created_at, amount) values ('4', 'Smart Bed', TO_DATE('2021-09-13','YYYY-MM-DD'), '170249');

SELECT DISTINCT user_id FROM
(SELECT user_id, created_at,
LAG(created_at) OVER (PARTITION BY user_id ORDER BY created_at) AS last_purchase
FROM Users)
WHERE created_at-last_purchase<=7;

DROP TABLE Users PURGE;