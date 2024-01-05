Create table Drivers (driver_id int, join_date date, CONSTRAINT Drivers_pk PRIMARY KEY (driver_id));
Create table Rides (ride_id int, user_id int, requested_at date, CONSTRAINT Rides_pk PRIMARY KEY (ride_id));
Create table AcceptedRides (ride_id int, driver_id int, ride_distance int, ride_duration int, CONSTRAINT AcceptedRides_pk PRIMARY KEY (ride_id));

insert into Drivers (driver_id, join_date) values ('10', TO_DATE('2019-12-10','YYYY-MM-DD'));
insert into Drivers (driver_id, join_date) values ('8', TO_DATE('2020-1-13','YYYY-MM-DD'));
insert into Drivers (driver_id, join_date) values ('5', TO_DATE('2020-2-16','YYYY-MM-DD'));
insert into Drivers (driver_id, join_date) values ('7', TO_DATE('2020-3-8','YYYY-MM-DD'));
insert into Drivers (driver_id, join_date) values ('4', TO_DATE('2020-5-17','YYYY-MM-DD'));
insert into Drivers (driver_id, join_date) values ('1', TO_DATE('2020-10-24','YYYY-MM-DD'));
insert into Drivers (driver_id, join_date) values ('6', TO_DATE('2021-1-5','YYYY-MM-DD'));

insert into Rides (ride_id, user_id, requested_at) values ('6', '75', TO_DATE('2019-12-9','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('1', '54', TO_DATE('2020-2-9','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('10', '63', TO_DATE('2020-3-4','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('19', '39', TO_DATE('2020-4-6','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('3', '41', TO_DATE('2020-6-3','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('13', '52', TO_DATE('2020-6-22','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('7', '69', TO_DATE('2020-7-16','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('17', '70', TO_DATE('2020-8-25','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('20', '81', TO_DATE('2020-11-2','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('5', '57', TO_DATE('2020-11-9','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('2', '42', TO_DATE('2020-12-9','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('11', '68', TO_DATE('2021-1-11','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('15', '32', TO_DATE('2021-1-17','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('12', '11', TO_DATE('2021-1-19','YYYY-MM-DD'));
insert into Rides (ride_id, user_id, requested_at) values ('14', '18', TO_DATE('2021-1-27','YYYY-MM-DD'));

insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('10', '10', '63', '38');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('13', '10', '73', '96');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('7', '8', '100', '28');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('17', '7', '119', '68');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('20', '1', '121', '92');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('5', '7', '42', '101');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('2', '4', '6', '38');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('11', '8', '37', '43');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('15', '8', '108', '82');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('12', '8', '38', '34');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('14', '1', '90', '74');


SELECT Q1.month, CASE 
WHEN Q1.active_drivers>0 THEN ROUND(100*COALESCE(Q2.accepted_rides/Q1.active_drivers,0),2) ELSE 0 END
AS working_percentage FROM
(SELECT EXTRACT(MONTH FROM months.month) AS month, COUNT(d.driver_id) AS active_drivers FROM
(SELECT ADD_MONTHS(TO_DATE('2020-01-31', 'YYYY-MM-DD'), LEVEL - 1) AS Month
FROM DUAL CONNECT BY LEVEL <= 12) Months
LEFT JOIN Drivers d ON d.join_date <= Months.Month
GROUP BY EXTRACT(MONTH FROM months.month)) Q1
LEFT JOIN
(SELECT EXTRACT(MONTH FROM r.requested_at) AS month, COUNT(DISTINCT ar.driver_id) AS accepted_rides
FROM AcceptedRides ar JOIN Rides r ON r.ride_id = ar.ride_id
WHERE EXTRACT(YEAR FROM requested_at)=2020
GROUP BY EXTRACT(MONTH FROM r.requested_at)) Q2
ON Q1.month=Q2.month
ORDER BY Q1.month;

DROP TABLE AcceptedRides PURGE;
DROP TABLE Rides PURGE;
DROP TABLE Drivers PURGE;