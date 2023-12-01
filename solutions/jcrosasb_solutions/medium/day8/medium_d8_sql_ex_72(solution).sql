-- Create the tables
Create table Subscriptions (account_id int, start_date date, end_date date);
Create table Streams (session_id int, account_id int, stream_date date);

-- Populate the subscriptions table
Truncate table Subscriptions;
insert into Subscriptions (account_id, start_date, end_date) values (9, DATE '2020-02-18', DATE '2021-10-30');
insert into Subscriptions (account_id, start_date, end_date) values (3, DATE '2021-09-21', DATE '2021-11-13');
insert into Subscriptions (account_id, start_date, end_date) values (11, DATE '2020-02-28', DATE '2020-08-18');
insert into Subscriptions (account_id, start_date, end_date) values (13, DATE '2021-04-20', DATE '2021-09-22');
insert into Subscriptions (account_id, start_date, end_date) values (4, DATE '2020-10-26', DATE '2021-05-08');
insert into Subscriptions (account_id, start_date, end_date) values (5, DATE '2020-09-11', DATE '2021-01-17');

-- Populate the streams table
Truncate table Streams;
insert into Streams (session_id, account_id, stream_date) values (14, 9, DATE '2020-05-16');
insert into Streams (session_id, account_id, stream_date) values (16, 3, DATE '2021-10-27');
insert into Streams (session_id, account_id, stream_date) values (18, 11, DATE '2020-04-29');
insert into Streams (session_id, account_id, stream_date) values (17, 13, DATE '2021-08-08');
insert into Streams (session_id, account_id, stream_date) values (19, 4, DATE '2020-12-31');
insert into Streams (session_id, account_id, stream_date) values (13, 5, DATE '2021-01-05');

-- Write an SQL query to report the number of accounts that bought a subscription in 2021 but did not have any stream session
SELECT
    COUNT(s.account_id) AS accounts_count
FROM
    Subscriptions s
INNER JOIN
    Streams st
ON
    s.account_id = st.account_id
WHERE
    EXTRACT(YEAR FROM s.start_date)   <= '2021' AND 
    EXTRACT(YEAR FROM s.end_date)     >= '2021' AND
    EXTRACT(YEAR FROM st.stream_date) != '2021';
    
-- Drop tables
DROP TABLE Subscriptions;
DROP TABLE Streams;
