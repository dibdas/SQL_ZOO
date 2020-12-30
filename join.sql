
--1.Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid,player from goal WHERE teamid='GER'



--2.Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game WHERE id='1012'



--3.Modify it to show the player, teamid, stadium and mdate for every German goal.
  SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (game.id=matchid) WHERE teamid ='GER'


--4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1,team2,player from game JOIN goal ON (game.id=matchid) WHERE player LIKE('Mario%')


--5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (goal.teamid=eteam.id)
 WHERE gtime<=10



--6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
 SELECT mdate,teamname from game JOIN eteam ON (game.team1 = eteam.id) WHERE coach LIKE 'Fernando Santos'



--7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
 SELECT player from goal JOIN game ON (game.id=goal.matchid) WHERE stadium LIKE 'National Stadium, Warsaw'


--8.Select goals scored only by non-German players in matches where GER was the id of either team1 or team2.
 SELECT DISTINCT player
  FROM goal JOIN game ON goal.matchid = game.id 
    WHERE (game.team1='GER' OR game.team2='GER') AND (goal.teamid!='GER')



--9.Show teamname and the total number of goals scored.
SELECT teamname,COUNT(teamid)
  FROM goal JOIN eteam ON id=teamid
GROUP BY teamname


--10.Show the stadium and the number of goals scored in each stadium.
SELECT stadium,COUNT(teamid) from game JOIN goal ON goal.matchid=game.id GROUP BY stadium


--11.For every match involving 'POL', show the matchid, date and the number of goals scored
SELECT matchid,mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (game.team1 = 'POL' OR game.team2 = 'POL') GROUP BY matchid,mdate


--12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
 SELECT matchid,mdate,COUNT(teamid) FROM game JOIn goal ON id=matchid WHERE(teamid='GER') GROUP BY matchid,mdate



--13.List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
 SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game JOIN goal ON matchid = id
   GROUP BY mdate, team1, team2
   ORDER BY mdate, team1, team2;

 