Create table Countries (country_id int, country_name varchar(20), CONSTRAINT Countries_pk PRIMARY KEY (country_id));
Create table Weather (country_id int, weather_state int, day date);

ALTER TABLE Weather
    ADD PRIMARY KEY (country_id, day) DISABLE;
    
insert into Countries (country_id, country_name) values ('2', 'USA');
insert into Countries (country_id, country_name) values ('3', 'Australia');
insert into Countries (country_id, country_name) values ('7', 'Peru');
insert into Countries (country_id, country_name) values ('5', 'China');
insert into Countries (country_id, country_name) values ('8', 'Morocco');
insert into Countries (country_id, country_name) values ('9', 'Spain');

insert into Weather (country_id, weather_state, day) values ('2', '15', TO_DATE('2019-11-01','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('2', '12', TO_DATE('2019-10-28','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('2', '12', TO_DATE('2019-10-27','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('3', '-2', TO_DATE('2019-11-10','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('3', '0', TO_DATE('2019-11-11','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('3', '3', TO_DATE('2019-11-12','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('5', '16', TO_DATE('2019-11-07','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('5', '18', TO_DATE('2019-11-09','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('5', '21', TO_DATE('2019-11-23','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('7', '25', TO_DATE('2019-11-28','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('7', '22', TO_DATE('2019-12-01','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('7', '20', TO_DATE('2019-12-02','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('8', '25', TO_DATE('2019-11-05','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('8', '27', TO_DATE('2019-11-15','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('8', '31', TO_DATE('2019-11-25','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('9', '7', TO_DATE('2019-10-23','YYYY-MM-DD'));
insert into Weather (country_id, weather_state, day) values ('9', '3', TO_DATE('2019-12-23','YYYY-MM-DD'));

SELECT c.country_name,
  CASE
    WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
    WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
    ELSE 'Warm'
  END AS weather_type
FROM Countries c JOIN  Weather w 
ON c.country_id = w.country_id
WHERE EXTRACT(MONTH FROM w.day) = 11 AND EXTRACT(YEAR FROM w.day) = 2019
GROUP BY  c.country_name;

DROP TABLE Weather PURGE;
DROP TABLE Countries PURGE;