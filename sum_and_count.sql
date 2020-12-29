
--1.Show the total population of the world.
SELECT SUM(population)
FROM world


--2.List all the continents - just once each.
SELECT DISTINCT continent from world


--3.Give the total GDP of Africa
SELECT SUM(gdp) from world WHERE continent ='Africa'


--4.How many countries have an area of at least 1000000
SELECT COUNT(name) from world WHERE area >=1000000



--5.What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population) from world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')