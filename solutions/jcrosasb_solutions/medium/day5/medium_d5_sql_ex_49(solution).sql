-- Create the tables
Create table Person (id int, name varchar(15), phone_number varchar(11));
Create table Country (name varchar(15), country_code varchar(3));
Create table Calls (caller_id int, callee_id int, duration int);

-- Populate the person table
Truncate table Person;
/*
insert into Person (id, name, phone_number) values (3, 'Jonathan', '051-1234567');
insert into Person (id, name, phone_number) values (12, 'Elvis', '051-7654321');
insert into Person (id, name, phone_number) values (1, 'Moncef', '212-1234567');
insert into Person (id, name, phone_number) values (2, 'Maroua', '212-6523651');
insert into Person (id, name, phone_number) values (7, 'Meir', '972-1234567');
insert into Person (id, name, phone_number) values (9, 'Rachel', '972-0011100');
*/
insert into Person (id, name, phone_number) values (989, 'Naftali', '523-7847696');
insert into Person (id, name, phone_number) values (422, 'Tamar', '670-0840142');
insert into Person (id, name, phone_number) values (123, 'Yosef', '728-6529775');
insert into Person (id, name, phone_number) values (460, 'Yaakov', '515-4655306');
insert into Person (id, name, phone_number) values (285, 'Tamar', '119-4963054');
insert into Person (id, name, phone_number) values (546, 'Menachem', '550-5622421');
insert into Person (id, name, phone_number) values (407, 'Yaakov', '584-0211700');
insert into Person (id, name, phone_number) values (824, 'Tikvah', '119-4931906');
insert into Person (id, name, phone_number) values (320, 'Tamar', '089-2960728');
insert into Person (id, name, phone_number) values (107, 'Sarah', '089-4128482');
insert into Person (id, name, phone_number) values (765, 'Freida', '646-1074145');
insert into Person (id, name, phone_number) values (13, 'Rachel', '187-6516857');
insert into Person (id, name, phone_number) values (935, 'Adam', '550-0464730');
insert into Person (id, name, phone_number) values (792, 'Yaffah', '202-2765764');
insert into Person (id, name, phone_number) values (343, 'Sarah', '119-8935789');
insert into Person (id, name, phone_number) values (933, 'Yosef', '285-7578157');
insert into Person (id, name, phone_number) values (263, 'Dalia', '584-9041687');
insert into Person (id, name, phone_number) values (464, 'Moshe', '285-7682744');
insert into Person (id, name, phone_number) values (748, 'Menachem', '174-4162360');
insert into Person (id, name, phone_number) values (762, 'Daniel', '623-4209590');

-- Populate the country table    
Truncate table Country;
/*
insert into Country (name, country_code) values ('Peru', 051);
insert into Country (name, country_code) values ('Israel', 972);
insert into Country (name, country_code) values ('Morocco', 212);
insert into Country (name, country_code) values ('Germany', 049);
insert into Country (name, country_code) values ('Ethiopia', 251);
*/
insert into Country (name, country_code) values ('Libya', 119);
insert into Country (name, country_code) values ('Nigeria', 728);
insert into Country (name, country_code) values ('Japan', 187);
insert into Country (name, country_code) values ('SaudiArabia', 523);
insert into Country (name, country_code) values ('Qatar', 89);
insert into Country (name, country_code) values ('Israel', 670);
insert into Country (name, country_code) values ('France', 409);
insert into Country (name, country_code) values ('Turkey', 584);
insert into Country (name, country_code) values ('Mexico', 918);
insert into Country (name, country_code) values ('China', 646);
insert into Country (name, country_code) values ('Ethiopia', 285);
insert into Country (name, country_code) values ('Algeria', 34);
insert into Country (name, country_code) values ('Spain', 549);
insert into Country (name, country_code) values ('Tunisia', 488);
insert into Country (name, country_code) values ('Morocco', 550);
insert into Country (name, country_code) values ('Germany', 202);
insert into Country (name, country_code) values ('Italy', 623);
insert into Country (name, country_code) values ('Brazil', 515);
insert into Country (name, country_code) values ('Peru', 526);
insert into Country (name, country_code) values ('Russia', 174);

-- Populate the calls table    
Truncate table Calls;
/*
insert into Calls (caller_id, callee_id, duration) values (1, 9, 33);
insert into Calls (caller_id, callee_id, duration) values (2, 9, 4);
insert into Calls (caller_id, callee_id, duration) values (1, 2, 59);
insert into Calls (caller_id, callee_id, duration) values (3, 12, 102);
insert into Calls (caller_id, callee_id, duration) values (3, 12, 330);
insert into Calls (caller_id, callee_id, duration) values (12, 3, 5);
insert into Calls (caller_id, callee_id, duration) values (7, 9, 13);
insert into Calls (caller_id, callee_id, duration) values (7, 1, 3);
insert into Calls (caller_id, callee_id, duration) values (9, 7, 1);
insert into Calls (caller_id, callee_id, duration) values (1, 7, 7);
*/
insert into Calls (caller_id, callee_id, duration) values (285, 285, 285);
insert into Calls (caller_id, callee_id, duration) values (792, 792, 792);
insert into Calls (caller_id, callee_id, duration) values (13, 13, 13);
insert into Calls (caller_id, callee_id, duration) values (422, 422, 422);
insert into Calls (caller_id, callee_id, duration) values (762, 762, 762);
insert into Calls (caller_id, callee_id, duration) values (460, 460, 460);
insert into Calls (caller_id, callee_id, duration) values (343, 343, 343);
insert into Calls (caller_id, callee_id, duration) values (263, 263, 263);
insert into Calls (caller_id, callee_id, duration) values (792, 792, 792);
insert into Calls (caller_id, callee_id, duration) values (765, 765, 765);
insert into Calls (caller_id, callee_id, duration) values (422, 422, 422);
insert into Calls (caller_id, callee_id, duration) values (320, 320, 320);
insert into Calls (caller_id, callee_id, duration) values (123, 123, 123);
insert into Calls (caller_id, callee_id, duration) values (765, 765, 765);
insert into Calls (caller_id, callee_id, duration) values (460, 460, 460);
insert into Calls (caller_id, callee_id, duration) values (460, 460, 460);
insert into Calls (caller_id, callee_id, duration) values (748, 748, 748);
insert into Calls (caller_id, callee_id, duration) values (285, 285, 285);
insert into Calls (caller_id, callee_id, duration) values (343, 343, 343);
insert into Calls (caller_id, callee_id, duration) values (933, 933, 933);
insert into Calls (caller_id, callee_id, duration) values (285, 285, 285);
insert into Calls (caller_id, callee_id, duration) values (935, 935, 935);
insert into Calls (caller_id, callee_id, duration) values (464, 464, 464);
insert into Calls (caller_id, callee_id, duration) values (13, 13, 13);
insert into Calls (caller_id, callee_id, duration) values (935, 935, 935);
insert into Calls (caller_id, callee_id, duration) values (285, 285, 285);
insert into Calls (caller_id, callee_id, duration) values (407, 407, 407);
insert into Calls (caller_id, callee_id, duration) values (263, 263, 263);
insert into Calls (caller_id, callee_id, duration) values (824, 824, 824);
insert into Calls (caller_id, callee_id, duration) values (460, 460, 460);
insert into Calls (caller_id, callee_id, duration) values (123, 123, 123);
insert into Calls (caller_id, callee_id, duration) values (123, 123, 123);
insert into Calls (caller_id, callee_id, duration) values (989, 989, 989);
insert into Calls (caller_id, callee_id, duration) values (792, 792, 792);
insert into Calls (caller_id, callee_id, duration) values (460, 460, 460);
insert into Calls (caller_id, callee_id, duration) values (546, 546, 546);
insert into Calls (caller_id, callee_id, duration) values (935, 935, 935);
insert into Calls (caller_id, callee_id, duration) values (107, 107, 107);
insert into Calls (caller_id, callee_id, duration) values (422, 422, 422);
insert into Calls (caller_id, callee_id, duration) values (765, 765, 765);

-- A telecommunications company wants to invest in new countries.
-- The company intends to invest in the countries where the average call duration
-- of the calls in this country is strictly greater than the global average call duration.
-- Write a solution to find the countries where this company can invest.
WITH avg_by_country AS (
    SELECT 
        co.name AS country,
        AVG(c.duration) AS average_call
    FROM 
        Person p
    LEFT JOIN
        Country co
    ON
        co.country_code = TO_NUMBER(SUBSTR(p.phone_number, 1, INSTR(p.phone_number, '-') - 1))
    RIGHT JOIN
        Calls c
    ON
        c.caller_id = p.id
    GROUP BY
        co.name
)
SELECT 
    country
FROM
    avg_by_country
WHERE
    average_call >= (SELECT 
                         AVG(c.duration) AS global_average_call
                     FROM 
                         Person p
                     LEFT JOIN
                         Country co
                     ON
                         co.country_code = TO_NUMBER(SUBSTR(p.phone_number, 1, INSTR(p.phone_number, '-') - 1))
                     RIGHT JOIN
                         Calls c
                     ON
                         c.caller_id = p.id);
    
-- Drop tables
DROP TABLE Person;
DROP TABLE Country;
DROP TABLE Calls;
