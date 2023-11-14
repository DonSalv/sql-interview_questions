-- Create the days table
Create table Days (day date);

-- Populate the days table    
Truncate table Days;
insert into Days (day) values (DATE '2022-04-12');
insert into Days (day) values (DATE '2021-08-09');
insert into Days (day) values (DATE '2020-06-26');

-- Write a solution to convert each date in DAYS into a string formatted as "day_name, month_name day, year"
SELECT 
    TO_CHAR(day, 'Day, Month DD, YYYY') day 
FROM Days;

-- Drop tables
DROP TABLE Days;
