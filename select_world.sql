

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





