-- Create the spotify table
Create table Spotify (id int,track_name varchar(100),artist varchar(100));

-- Populate the spotify table
Truncate table Spotify;
insert into Spotify (id, track_name, artist) values (303651, 'Heart Wont Forget', 'Ed Sheeran');
insert into Spotify (id, track_name, artist) values (1046089, 'Shape of you', 'Sia');
insert into Spotify (id, track_name, artist) values (33445, 'Im the one', 'DJ Khalid');
insert into Spotify (id, track_name, artist) values (811266, 'Young Dumb and Broke', 'DJ Khalid');
insert into Spotify (id, track_name, artist) values (505727, 'Happier', 'Ed Sheeran');

-- Write a solution to find how many times each artist appeared on the Spotify ranking list.
-- Return the result table having the artist's name along with the corresponding number of occurrences ordered by occurrence count in descending order. 
-- If the occurrences are equal, then it’s ordered by the artist’s name in ascending order
SELECT 
    artist, 
    COUNT(artist) occurrences 
FROM 
    Spotify 
GROUP BY 
    artist
ORDER BY
    COUNT(artist) DESC,
    artist;

-- Drop table;
DROP TABLE Spotify;
