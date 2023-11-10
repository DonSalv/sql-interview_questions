-- Create the ads table
Create table Ads (ad_id int, user_id int, action ENUM('Clicked', 'Viewed', 'Ignored'));
    
-- Populate the ads table
Truncate table Ads;
insert into Ads (ad_id, user_id, action) values (1, 1, 'Clicked');
insert into Ads (ad_id, user_id, action) values (2, 2, 'Clicked');
insert into Ads (ad_id, user_id, action) values (3, 3, 'Viewed');
insert into Ads (ad_id, user_id, action) values (5, 5, 'Ignored');
insert into Ads (ad_id, user_id, action) values (1, 7, 'Ignored');
insert into Ads (ad_id, user_id, action) values (2, 7, 'Viewed');
insert into Ads (ad_id, user_id, action) values (3, 5, 'Clicked');
insert into Ads (ad_id, user_id, action) values (1, 4, 'Viewed');
insert into Ads (ad_id, user_id, action) values (2, 11, 'Viewed');
insert into Ads (ad_id, user_id, action) values (1, 2, 'Clicked');

-- Drop tables
DROP TABLE Ads;