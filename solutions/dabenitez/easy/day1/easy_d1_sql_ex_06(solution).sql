Create table Weather (id int, recordDate date, temperature int, CONSTRAINT Weather_pk PRIMARY KEY (id));

insert into Weather (id, recordDate, temperature) values ('1', TO_DATE('2015-01-01','YYYY-MM-DD'), '10');
insert into Weather (id, recordDate, temperature) values ('2', TO_DATE('2015-01-02','YYYY-MM-DD'), '25');
insert into Weather (id, recordDate, temperature) values ('3', TO_DATE('2015-01-03','YYYY-MM-DD'), '20');
insert into Weather (id, recordDate, temperature) values ('4', TO_DATE('2015-01-04','YYYY-MM-DD'), '30');

SELECT id FROM 
(SELECT id, LAG(temperature) 
OVER (ORDER BY recordDate) AS prev_temperature, 
temperature  FROM Weather)
WHERE temperature > prev_temperature;

DROP TABLE Weather PURGE;