-- Create the hallevents table
CREATE TABLE HallEvents (hall_id int, start_day date, end_day date);

-- Populate the hallevents table    
TRUNCATE TABLE HallEvents;
INSERT INTO HallEvents (hall_id, start_day, end_day) VALUES ('1', TO_DATE('2023-01-13','%YYYY-%MM-%DD'), TO_DATE('2023-01-14','%YYYY-%MM-%DD'));
INSERT INTO HallEvents (hall_id, start_day, end_day) VALUES ('1', TO_DATE('2023-01-14','%YYYY-%MM-%DD'), TO_DATE('2023-01-17','%YYYY-%MM-%DD'));
INSERT INTO HallEvents (hall_id, start_day, end_day) VALUES ('1', TO_DATE('2023-01-18','%YYYY-%MM-%DD'), TO_DATE('2023-01-25','%YYYY-%MM-%DD'));
INSERT INTO HallEvents (hall_id, start_day, end_day) VALUES ('2', TO_DATE('2022-12-09','%YYYY-%MM-%DD'), TO_DATE('2022-12-23','%YYYY-%MM-%DD'));
INSERT INTO HallEvents (hall_id, start_day, end_day) VALUES ('2', TO_DATE('2022-12-13','%YYYY-%MM-%DD'), TO_DATE('2022-12-17','%YYYY-%MM-%DD'));
INSERT INTO HallEvents (hall_id, start_day, end_day) VALUES ('3', TO_DATE('2022-12-01','%YYYY-%MM-%DD'), TO_DATE('2023-01-30','%YYYY-%MM-%DD'));

-- Solve the exercise
WITH EventsIds AS
(SELECT hall_id, start_day, end_day, ROWNUM AS event_id
FROM HallEvents),
OverlapedEvents AS
(
SELECT h1.hall_id AS hall_id_1, h1.start_day AS start_day_1, h1.end_day AS end_day_1, h1.event_id AS event_id_1,
h2.hall_id hall_id_2, h2.start_day AS start_day_2, h2.end_day AS end_day_2, h2.event_id AS event_id_2
FROM EventsIds h1 LEFT OUTER JOIN EventsIds h2
ON(h1.hall_id=h2.hall_id
AND h2.start_day BETWEEN h1.start_day AND h1.end_day
AND h1.event_id!=h2.event_id))
SELECT hall_id_1 AS hall_id, TO_CHAR(start_day_1,'YYYY-MM-DD') AS start_day,
TO_CHAR((CASE WHEN end_day_2 IS NULL THEN end_day_1
WHEN end_day_2>end_day_1 THEN end_day_2
ELSE end_day_1 END),'YYYY-MM-DD') AS end_day
FROM(SELECT hall_id_1, start_day_1, end_day_1, hall_id_2, start_day_2, end_day_2
FROM OverlapedEvents
WHERE event_id_1 NOT IN (SELECT event_id_2 FROM OverlapedEvents WHERE event_id_2 IS NOT NULL));

-- Drop unused table
DROP TABLE HallEvents;