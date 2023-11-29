Create table Activity (user_id INT, session_id INT, activity_date DATE, activity_type VARCHAR2(15), CONSTRAINT activity_type_check CHECK (activity_type IN ('open_session', 'end_session', 'scroll_down', 'send_message')));

insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', TO_DATE('2019-07-20','YYYY-MM-DD'), 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', TO_DATE('2019-07-20','YYYY-MM-DD'), 'scroll_down');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', TO_DATE('2019-07-20','YYYY-MM-DD'), 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', TO_DATE('2019-07-20','YYYY-MM-DD'), 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', TO_DATE('2019-07-21','YYYY-MM-DD'), 'send_message');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', TO_DATE('2019-07-21','YYYY-MM-DD'), 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', TO_DATE('2019-07-21','YYYY-MM-DD'), 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', TO_DATE('2019-07-21','YYYY-MM-DD'), 'send_message');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', TO_DATE('2019-07-21','YYYY-MM-DD'), 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('4', '3', TO_DATE('2019-06-25','YYYY-MM-DD'), 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('4', '3', TO_DATE('2019-06-25','YYYY-MM-DD'), 'end_session');


SELECT ROUND(COUNT(user_id)/COUNT(DISTINCT user_id),2) AS average_seesions_per_user FROM
(SELECT DISTINCT user_id, activity_date FROM Activity
  WHERE activity_date BETWEEN TO_DATE('2019-06-28','YYYY-MM-DD') AND TO_DATE('2019-07-27','YYYY-MM-DD'));

DROP TABLE Activity PURGE;