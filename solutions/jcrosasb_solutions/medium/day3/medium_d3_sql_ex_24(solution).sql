-- Create the events table
Create table Events (business_id int, event_type varchar(10), occurences int);

-- Populate the events table
Truncate table Events;
insert into Events (business_id, event_type, occurences) values (1, 'reviews', 7);
insert into Events (business_id, event_type, occurences) values (3, 'reviews', 3);
insert into Events (business_id, event_type, occurences) values (1, 'ads', 11);
insert into Events (business_id, event_type, occurences) values (2, 'ads', 7);
insert into Events (business_id, event_type, occurences) values (3, 'ads', 6);
insert into Events (business_id, event_type, occurences) values (1, 'page views', 3);
insert into Events (business_id, event_type, occurences) values (2, 'page views', 12);

-- The average activity for a particular event_type is the average occurences across all
-- companies that have this event. An active business is a business that has more than one
-- event_type such that their occurences is strictly greater than the average activity for that event.
-- Write a solution to find all active businesses
WITH Event_activity AS (
    SELECT 
        event_type, 
        AVG(occurences) AS avg_activity 
    FROM 
        Events 
    GROUP BY 
        event_type)
SELECT 
    e.business_id 
FROM
    Events e
LEFT JOIN
    Event_activity ea
ON
    e.event_type = ea.event_type
WHERE 
    e.occurences > ea.avg_activity
GROUP BY
    e.business_id
HAVING
    COUNT(e.business_id) > 1;

-- Drop tables
DROP TABLE Events;
