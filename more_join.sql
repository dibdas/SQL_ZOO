

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

--6.Obtain the cast list for 'Casablanca'.
--what is a cast list?
--The cast list is the names of the actor who were in the movie.
--Use movieid=11768, (or whatever value you got from the previous question)

SELECT name from actor INNER JOIN casting ON  actorid = actor.id INNER JOIN movie ON movie.id = movieid WHERE movieid = 11768


--7.Obtain the cast list for the film 'Alien'
SELECT name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
INNER JOIN movie ON 
casting.movieid = movie.id
WHERE title = 'Alien';


--8.List the films in which 'Harrison Ford' has appeared
SELECT title from movie INNER JOIN casting ON movie.id = casting.movieid INNER JOIN actor ON actor.id = casting.actorid WHERE name = 'Harrison Ford'


--9.List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title from movie INNER JOIN casting ON movie.id = casting.movieid INNER JOIN actor ON actor.id = casting.actorid WHERE name  = 'Harrison Ford' AND ord!=1


--10.List the films together with the leading star for all 1962 films.
SELECT title,name from movie INNER JOIN casting ON movieid = movie.id INNER JOIN actor ON casting.actorid = actor.id WHERE yr = 1962 AND ord=1


--11.Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.
--Did you get "Little Miss Marker twice"?
--Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).
--Title is not a unique field, create a table of IDs in your subquery

SELECT title,name  FROM movie JOIN casting ON (movie.id = movieid  AND ord = 1) JOIN actor ON actor.id = actorid
WHERE movie.id IN (SELECT movieid FROM casting 
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews') )


--13.Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
  SELECT name  FROM actor JOIN casting ON (actor.id = actorid  AND ord = 1)
GROUP BY name HAVING COUNT(actorid) >= 15


--14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title,COUNT(actorid)from movie JOIN casting ON movie.id=movieid JOIN actor ON actorid= actor.id WHERE yr=1978
GROUP BY title ORDER BY COUNT(actorid)DESC,title 


--15.List all the people who have worked with 'Art Garfunk
SELECT name from actor JOIN casting ON actor.id = casting.actorid JOIN movie ON movie.id = casting.movieid WHERE movie.id IN (SELECT movie.id from movie JOIN casting ON movie.id = casting.movieid JOIN actor ON actor.id = casting.actorid WHERE name = 'Art Garfunkel') 
AND name != 'Art Garfunkel'
