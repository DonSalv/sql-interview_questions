-- Create the dailysales table;
Create table DailySales(date_id date, make_name varchar(20), lead_id int, partner_id int);

-- Populate the dailysales table    
Truncate table DailySales;
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-8', 'toyota', 0, 1);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-8', 'toyota', 1, 0);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-8', 'toyota', 1, 2);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-7', 'toyota', 0, 2);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-7', 'toyota', 0, 1);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-8', 'honda', 1, 2);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-8', 'honda', 2, 1);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-7', 'honda', 0, 1);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-7', 'honda', 1, 2);
insert into DailySales (date_id, make_name, lead_id, partner_id) values (DATE '2020-12-7', 'honda', 2, 1);

-- For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's
SELECT 
    date_id, 
    make_name, 
    COUNT(DISTINCT lead_id) unique_leads, 
    COUNT(DISTINCT partner_id) unique_partners 
FROM DailySales 
GROUP BY 
    date_id, 
    make_name;

-- Drop tables
DROP TABLE DailySales;
