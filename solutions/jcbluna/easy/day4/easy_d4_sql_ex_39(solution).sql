-- Create the tables
CREATE TABLE Countries (country_id int, country_name varchar(20));
CREATE TABLE Weather (country_id int, weather_state int, day date);

-- Populate the countries table    
TRUNCATE TABLE Countries;
INSERT INTO Countries (country_id, country_name) VALUES ('2', 'USA');
INSERT INTO Countries (country_id, country_name) VALUES ('3', 'Australia');
INSERT INTO Countries (country_id, country_name) VALUES ('7', 'Peru');
INSERT INTO Countries (country_id, country_name) VALUES ('5', 'China');
INSERT INTO Countries (country_id, country_name) VALUES ('8', 'Morocco');
INSERT INTO Countries (country_id, country_name) VALUES ('9', 'Spain');

-- Populate the wather table    
TRUNCATE TABLE Weather;
INSERT INTO Weather (country_id, weather_state, day) VALUES ('2', '15', TO_DATE('2019-11-01','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('2', '12', TO_DATE('2019-10-28','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('2', '12', TO_DATE('2019-10-27','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('3', '-2', TO_DATE('2019-11-10','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('3', '0', TO_DATE('2019-11-11','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('3', '3', TO_DATE('2019-11-12','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('5', '16', TO_DATE('2019-11-07','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('5', '18', TO_DATE('2019-11-09','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('5', '21', TO_DATE('2019-11-23','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('7', '25', TO_DATE('2019-11-28','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('7', '22', TO_DATE('2019-12-01','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('7', '20', TO_DATE('2019-12-02','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('8', '25', TO_DATE('2019-11-05','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('8', '27', TO_DATE('2019-11-15','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('8', '31', TO_DATE('2019-11-25','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('9', '7', TO_DATE('2019-10-23','%YYYY-%MM-%DD'));
INSERT INTO Weather (country_id, weather_state, day) VALUES ('9', '3', TO_DATE('2019-12-23','%YYYY-%MM-%DD'));

-- Solve the exercise

SELECT country_name, (CASE WHEN AVG(weather_state)<=15 THEN 'Cold'
                            WHEN AVG(weather_state)>=25 THEN 'Hot'
                            ELSE 'Warm'
                            END) AS weather_type
FROM Countries JOIN Weather
USING(country_id)
WHERE EXTRACT(MONTH FROM day)=11
AND EXTRACT(YEAR FROM day)=2019
GROUP BY country_name
ORDER BY weather_type;

-- Drop unused tables

DROP TABLE Countries;
DROP TABLE Weather;