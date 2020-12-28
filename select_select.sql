
--1.List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')


--2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
      SELECT name FROM world
  WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE  name = 'United Kingdom' )


--3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name ,continent from world WHERE continent IN ( SELECT continent from world WHERE name IN ('Argentina','Australia')) order by name



--4.Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name,population from world WHERE population >(SELECT population from world WHERE name= 'Canada') AND population <(SELECT population from world WHERE name ='Poland')
      