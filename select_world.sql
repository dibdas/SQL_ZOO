

--1.Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany'


--2.Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
--Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway','Denmark');


--3. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


--4.Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world


--5.Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population > 200000000


--6.Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name,gdp/population from world WHERE population > 200000000


--7.Show the name and population in millions for the countries of the continent 'South America'.
-- Divide the population by 1000000 to get population in millions.
SELECT name,population/1000000 from world WHERE continent = 'South America'


--8.Show the name and population for France, Germany, Italy
SELECT name,population from world WHERE name IN ('France','Germany', 'Italy')


--9.Show the countries which have a name that includes the word 'United'
SELECT name from world WHERE name LIKE('%United%')


--10.Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
--Show the countries that are big by area or big by population. Show name, population and area.
SELECT name,population,area from world WHERE population > 250000000 OR area >3000000


--11.Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name,population,area FROM world WHERE area > 3000000 XOR population > 250000000



--12.Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
--For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name,ROUND(population/1000000,2),ROUND(gdp/1000000000,2) from world WHERE continent='South America'



--13.Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
--Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name,ROUND(gdp/population,-3) from world WHERE gdp >= 1000000000000


--14.Show the name and capital where the name and the capital have the same number of characters
SELECT name,capital FROM world WHERE LENGTH(name) = LENGTH(capital)


--15.Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name,capital FROM world WHERE name <> capital AND LEFT(name,1) = LEFT(capital,1)

--16.Find the country that has all the vowels and no spaces in its name.
SELECT name FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'
