Create table Events (business_id int, event_type varchar(10), occurences int);

ALTER TABLE Events ADD PRIMARY KEY (business_id, event_type) DISABLE;

insert into Events (business_id, event_type, occurences) values ('1', 'reviews', '7');
insert into Events (business_id, event_type, occurences) values ('3', 'reviews', '3');
insert into Events (business_id, event_type, occurences) values ('1', 'ads', '11');
insert into Events (business_id, event_type, occurences) values ('2', 'ads', '7');
insert into Events (business_id, event_type, occurences) values ('3', 'ads', '6');
insert into Events (business_id, event_type, occurences) values ('1', 'page views', '3');
insert into Events (business_id, event_type, occurences) values ('2', 'page views', '12');

SELECT business_id FROM
(SELECT e.business_id, COUNT(*) AS num FROM Events e
JOIN (SELECT event_type, AVG(occurences) AS average FROM Events
GROUP BY event_type) Q1
ON e.event_type=q1.event_type
WHERE occurences>average
GROUP BY e.business_id)
WHERE num>1;

DROP TABLE Events PURGE;