create database spotifyanalysis;

use spotifyanalysis;

-- Table to store songs
create table songs (
    Songid int primary key auto_increment,
    Title varchar(255),
    Artistid int,
    Albumid int,
    Releaseyear int,
    Popularity int,
    Durationinseconds int,
    Genre varchar(255)
);

desc songs;   

-- Table to store artists
create table artists (
    Artistid int primary key auto_increment,
    Name varchar(255),
    Country varchar(255)
);

desc artists;

-- Table to store albums
create table albums (
    Albumid int primary key auto_increment,
    Title varchar(255),
    Artistid int,
    Releaseyear int
);

desc albums;

-- Table to store user data (e.g., user playlists, preferences, etc.)
create table users (
    Userid int primary key auto_increment,
    Username varchar(255),
    Email varchar(255)
);

desc users;

-- Insert data into Artists table
insert into artists (Name, Country)
values
    ('Artist 1', 'USA'),
    ('Artist 2', 'UK'),
    ('Artist 3', 'Canada'),
    ('Artist 4', 'Australia');
    
select * from artists;    

-- Insert data into Albums table
insert into albums (Title, ArtistID, ReleaseYear)
values
    ('Album 1', 1, 2020),
    ('Album 2', 1, 2018),
    ('Album 3', 2, 2019),
    ('Album 4', 3, 2021);
    
select * from albums;   

-- Insert data into Songs table
insert into songs (Title, ArtistID, AlbumID, ReleaseYear, Popularity, DurationInSeconds, Genre)
values
    ('Song 1', 1, 1, 2020, 100, 180, 'Pop'),
    ('Song 2', 1, 1, 2020, 90, 220, 'Pop'),
    ('Song 3', 1, 2, 2018, 80, 200, 'Rock'),
    ('Song 4', 2, 3, 2019, 95, 240, 'Electronic'),
    ('Song 5', 3, 4, 2021, 110, 210, 'Pop');
    
select * from songs;

-- Insert data into Users table (if you plan to analyze user data)
insert into users (Username, Email)
values
    ('User1', 'user1@email.com'),
    ('User2', 'user2@email.com'),
    ('User3', 'user3@email.com');
    
select * from users;




-- 1.Retrieve the top N(2) most popular songs:alter

select Title, Popularity
from Songs
order by Popularity desc
limit 2;


-- 2.Find the average popularity of songs by year:

select ReleaseYear, avg(Popularity) as AvgPopularity
from Songs
group by Releaseyear
order by ReleaseYear;


-- 3.Get the artists with the most songs in the database:

select A.Name as ArtistName, count(S.ArtistID) as SongCount
from Artists A
join Songs S on A.ArtistID = S.ArtistID
group by A.Name
order by SongCount desc;


-- 4.Find the most popular songs of a specific genre(Rock):

select Title, Popularity
from Songs
where Genre = 'Rock'
order by Popularity desc
limit 1;





 
