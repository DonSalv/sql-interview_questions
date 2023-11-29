-- Create the loginfo table
Create table LogInfo (account_id int, ip_address int, login timestamp, logout timestamp);
    
-- Populate the loginfo table
Truncate table LogInfo;
insert into LogInfo (account_id, ip_address, login, logout) values (1, 1, TO_TIMESTAMP('2021-02-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values (1, 2, TO_TIMESTAMP('2021-02-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-01 11:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values (2, 6, TO_TIMESTAMP('2021-02-01 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values (2, 7, TO_TIMESTAMP('2021-02-02 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-02 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values (3, 9, TO_TIMESTAMP('2021-02-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-01 16:59:59', 'YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values (3, 13, TO_TIMESTAMP('2021-02-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-01 17:59:59', 'YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values (4, 10, TO_TIMESTAMP('2021-02-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values (4, 11, TO_TIMESTAMP('2021-02-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-02-01 17:59:59', 'YYYY-MM-DD HH24:MI:SS'));

-- Write a solution to find the account_id of the accounts that should be banned from Leetflex.
-- An account should be banned if it was logged in at some moment from two different IP addresses
SELECT 
    DISTINCT l.account_id
FROM 
    LogInfo l
INNER JOIN 
    LogInfo l2
ON 
    l.account_id = l2.account_id AND 
    l.ip_address != l2.ip_address
WHERE
    l.login BETWEEN l2.login AND l2.logout;

-- Drop tables
DROP TABLE LogInfo;
