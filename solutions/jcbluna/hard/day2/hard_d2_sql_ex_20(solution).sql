-- Create the tables
CREATE TABLE Drivers (driver_id int, join_date date);
CREATE TABLE Rides (ride_id int, user_id int, requested_at date);
CREATE TABLE AcceptedRides (ride_id int, driver_id int, ride_distance int, ride_duration int);

-- Populate the drivers table    
TRUNCATE TABLE Drivers;
INSERT INTO Drivers (driver_id, join_date) VALUES ('10', TO_DATE('2019-12-10','%YYYY-%fmMM-%fmDD'));
INSERT INTO Drivers (driver_id, join_date) VALUES ('8', TO_DATE('2020-1-13','%YYYY-%fmMM-%fmDD'));
INSERT INTO Drivers (driver_id, join_date) VALUES ('5', TO_DATE('2020-2-16','%YYYY-%fmMM-%fmDD'));
INSERT INTO Drivers (driver_id, join_date) VALUES ('7', TO_DATE('2020-3-8','%YYYY-%fmMM-%fmDD'));
INSERT INTO Drivers (driver_id, join_date) VALUES ('4', TO_DATE('2020-5-17','%YYYY-%fmMM-%fmDD'));
INSERT INTO Drivers (driver_id, join_date) VALUES ('1', TO_DATE('2020-10-24','%YYYY-%fmMM-%fmDD'));
INSERT INTO Drivers (driver_id, join_date) VALUES ('6', TO_DATE('2021-1-5','%YYYY-%fmMM-%fmDD'));

-- Populate the rides table    
TRUNCATE TABLE Rides;
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('6', '75', TO_DATE('2019-12-9','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('1', '54', TO_DATE('2020-2-9','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('10', '63', TO_DATE('2020-3-4','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('19', '39', TO_DATE('2020-4-6','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('3', '41', TO_DATE('2020-6-3','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('13', '52', TO_DATE('2020-6-22','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('7', '69', TO_DATE('2020-7-16','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('17', '70', TO_DATE('2020-8-25','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('20', '81', TO_DATE('2020-11-2','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('5', '57', TO_DATE('2020-11-9','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('2', '42', TO_DATE('2020-12-9','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('11', '68', TO_DATE('2021-1-11','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('15', '32', TO_DATE('2021-1-17','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('12', '11', TO_DATE('2021-1-19','%YYYY-%fmMM-%fmDD'));
INSERT INTO Rides (ride_id, user_id, requested_at) VALUES ('14', '18', TO_DATE('2021-1-27','%YYYY-%fmMM-%fmDD'));

-- Populate the acceptedrides    
TRUNCATE TABLE AcceptedRides;
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('10', '10', '63', '38');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('13', '10', '73', '96');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('7', '8', '100', '28');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('17', '7', '119', '68');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('20', '1', '121', '92');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('5', '7', '42', '101');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('2', '4', '6', '38');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('11', '8', '37', '43');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('15', '8', '108', '82');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('12', '8', '38', '34');
INSERT INTO AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) VALUES ('14', '1', '90', '74');

-- Solve the exercise
WITH MonthsList AS
(SELECT ROWNUM month
FROM dual
CONNECT BY ROWNUM <=12)
SELECT ml.month, 
(CASE WHEN COUNT(DISTINCT d.driver_id)=0 THEN 0
ELSE ROUND(100*COUNT(DISTINCT ar.ride_id)/COUNT(DISTINCT d.driver_id),2) END) AS working_percentage
FROM MonthsList ml LEFT OUTER JOIN 
(SELECT * FROM Rides 
WHERE EXTRACT(YEAR FROM requested_at)=2020) r
ON(ml.month=EXTRACT(MONTH FROM requested_at))
LEFT OUTER JOIN AcceptedRides ar
ON(r.ride_id=ar.ride_id)
LEFT OUTER JOIN Drivers d
ON(d.join_date<ADD_MONTHS(TO_DATE('2020-'|| month || '-01','%YYYY-%MM-%DD'),1))
GROUP BY ml.month
ORDER BY month;

-- Drop unused tables
DROP TABLE Drivers;
DROP TABLE Rides;
DROP TABLE AcceptedRides;