

--1.List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

--2.Give year of 'Citizen Kane'.
SELECT yr from movie WHERE title = 'Citizen Kane'


--3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id,title,yr from movie WHERE title LIKE  'Star Trek%' ORDER BY yr



--4.What id number does the actor 'Glenn Close' have?
SELECT id from actor WHERE name = 'Glenn Close'

--5.What is the id of the film 'Casablanca
SELECT id from movie WHERE title ='Casablanca'