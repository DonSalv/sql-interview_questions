-- To have DATE datatype in proper format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 

-- Create the tables
Create table Countries (country_id int, country_name varchar(20));
Create table Weather (country_id int, weather_state int, day date);

-- Populate the countries table    
Truncate table Countries;
insert into Countries (country_id, country_name) values (2, 'USA');
insert into Countries (country_id, country_name) values (3, 'Australia');
insert into Countries (country_id, country_name) values (7, 'Peru');
insert into Countries (country_id, country_name) values (5, 'China');
insert into Countries (country_id, country_name) values (8, 'Morocco');
insert into Countries (country_id, country_name) values (9, 'Spain');

-- Populate the wather table    
Truncate table Weather;
insert into Weather (country_id, weather_state, day) values (2, 15, DATE '2019-11-01');
insert into Weather (country_id, weather_state, day) values (2, 12, DATE '2019-10-28');
insert into Weather (country_id, weather_state, day) values (2, 12, DATE '2019-10-27');
insert into Weather (country_id, weather_state, day) values (3, -2, DATE '2019-11-10');
insert into Weather (country_id, weather_state, day) values (3, 0, DATE '2019-11-11');
insert into Weather (country_id, weather_state, day) values (3, 3, DATE '2019-11-12');
insert into Weather (country_id, weather_state, day) values (5, 16, DATE '2019-11-07');
insert into Weather (country_id, weather_state, day) values (5, 18, DATE '2019-11-09');
insert into Weather (country_id, weather_state, day) values (5, 21, DATE '2019-11-23');
insert into Weather (country_id, weather_state, day) values (7, 25, DATE '2019-11-28');
insert into Weather (country_id, weather_state, day) values (7, 22, DATE '2019-12-01');
insert into Weather (country_id, weather_state, day) values (7, 20, DATE '2019-12-02');
insert into Weather (country_id, weather_state, day) values (8, 25, DATE '2019-11-05');
insert into Weather (country_id, weather_state, day) values (8, 27, DATE '2019-11-15');
insert into Weather (country_id, weather_state, day) values (8, 31, DATE '2019-11-25');
insert into Weather (country_id, weather_state, day) values (9, 7, DATE '2019-10-23');
insert into Weather (country_id, weather_state, day) values (9, 3, DATE '2019-12-23');

-- Write a solution to find the type of weather in each country for November 2019.
-- The type of weather is:
--   * Cold if the average weather_state is less than or equal 15,
--   * Hot if the average weather_state is greater than or equal to 25
--   * Warm otherwise.
SELECT 
    country_name, 
    CASE 
        WHEN average_temp <= 15 
            THEN 'Cold'
        WHEN average_temp >= 25
            THEN 'Hot'
        ELSE
            'Warm'
    END weather_type
FROM (SELECT 
          c.country_name, 
          AVG(w.weather_state) average_temp 
      FROM Weather w 
      INNER JOIN Countries c 
      ON c.country_id = w.country_id 
      WHERE w.day BETWEEN '2019-11-01' AND '2019-11-30' 
      GROUP BY c.country_name);

-- Drop tables;
DROP TABLE Countries;
DROP TABLE Weather;
