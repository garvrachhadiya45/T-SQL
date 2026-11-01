SELECT * FROM PLAYER
SELECT * FROM STADIUM
SELECT * FROM TEAM


--1. Display players who belong to teams located in ‘Mumbai’.

SELECT P.PLAYER_FIRST_NAME, P.PLAYER_LAST_NAME, T.TEAM_NAME, S.Stadium_city
FROM PLAYER P
JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
JOIN STADIUM S ON T.HOME_STADIUM_ID = S.Stadium_id
WHERE S.Stadium_city = 'Mumbai'

--2. Display all teams and players.

SELECT T.TEAM_NAME, P.PLAYER_FIRST_NAME, P.PLAYER_LAST_NAME, P.PLAYER_JERSEY_NUMBER
FROM TEAM T
JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID

--3. Display players along with team wins and stadium city.

SELECT P.PLAYER_FIRST_NAME, P.PLAYER_LAST_NAME, T.TEAM_WINS, S.Stadium_city
FROM PLAYER P
JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
JOIN STADIUM S ON T.HOME_STADIUM_ID = S.Stadium_id

--4. Display team name and number of players in each team.

SELECT TEAM_NAME , COUNT(*)
FROM TEAM T JOIN PLAYER P ON P.TEAM_ID = T.TEAM_ID
GROUP BY TEAM_NAME

--5. Display team name, coach, and number of bowlers in each team.

SELECT T.TEAM_NAME , T.TEAM_COACH , COUNT(*)
FROM TEAM T JOIN PLAYER P ON P.TEAM_ID = T.TEAM_ID
WHERE PLAYER_ROLE = 'BOWLER'
GROUP BY T.TEAM_NAME , T.TEAM_COACH

--6. Display team name with count of batsmen, bowlers, and all-rounders.

SELECT T.TEAM_NAME , COUNT(CASE WHEN PLAYER_ROLE = 'BOWLER' THEN 1 END) AS BOWLER,
					 COUNT(CASE WHEN PLAYER_ROLE = 'BATSMAN' THEN 1 END) AS BATSMAN,
					 COUNT(CASE WHEN PLAYER_ROLE = 'ALL-ROUNDER' THEN 1 END) AS ALL_ROUNDER
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--7. Display stadiums where teams have won more than 10 matches.

SELECT STADIUM_NAME,TEAM_WINS FROM STADIUM
JOIN TEAM ON Stadium_id = HOME_STADIUM_ID
WHERE TEAM_WINS > 10

--8. Display team name and number of players whose matches played is greater than 25.

SELECT TEAM_NAME , COUNT(CASE WHEN PLAYER_MATCHES_PLAYED > 25 THEN 1 END) AS PLAYERS
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--9. Display team name and total number of players having jersey number greater than 30.

SELECT TEAM_NAME , COUNT(CASE WHEN PLAYER_JERSEY_NUMBER > 30 THEN 1 END) AS PLAYERS
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--10. Display team name and total matches played by its players. 

SELECT TEAM_NAME , SUM(PLAYER_MATCHES_PLAYED) AS MATCHES
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--11. Display stadium city and total number of teams in each city.

SELECT S.Stadium_city, COUNT(*)
FROM STADIUM S JOIN TEAM T
ON S.Stadium_id = T.HOME_STADIUM_ID
GROUP BY S.Stadium_city

--12. Display team name and average matches played by players in each team.

SELECT TEAM_NAME , AVG(PLAYER_MATCHES_PLAYED) AS MATCHES
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--13. Display team name and maximum matches played by any player in each team.

SELECT TEAM_NAME , MAX(PLAYER_MATCHES_PLAYED) AS MATCHES
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--14. Display team name and minimum matches played by any player in each team.

SELECT TEAM_NAME , MIN(PLAYER_MATCHES_PLAYED) AS MATCHES
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--15. Display stadium name and total number of players playing under teams of that stadium.

SELECT T.TEAM_NAME, S.Stadium_name, COUNT(*) AS PLAYERS
FROM PLAYER P
JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
JOIN STADIUM S ON T.HOME_STADIUM_ID = S.Stadium_id
GROUP BY S.Stadium_name, T.TEAM_NAME

--16. Display teams having more all-rounders than bowlers.

SELECT TEAM_NAME 
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING COUNT(CASE WHEN PLAYER_ROLE='BOWLER' THEN 1 END) < COUNT(CASE WHEN PLAYER_ROLE='ALL-ROUNDER' THEN 1 END) 

--17. Display teams where difference between max and min player matches is greater than 5.

SELECT TEAM_NAME 
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING MAX(P.PLAYER_MATCHES_PLAYED) - MIN(P.PLAYER_MATCHES_PLAYED) > 5

--18. Display stadium city and total wins of teams in that city.

SELECT S.Stadium_city, T.TEAM_NAME ,T.TEAM_WINS 
FROM STADIUM S
JOIN TEAM T ON Stadium_id  = HOME_STADIUM_ID

--19. Display team name and total number of players for each role (grouped by role).

SELECT T.TEAM_NAME , COUNT(CASE WHEN PLAYER_ROLE = 'BOWLER' THEN 1 END) AS BOWLER,
					 COUNT(CASE WHEN PLAYER_ROLE = 'BATSMAN' THEN 1 END) AS BATSMAN,
					 COUNT(CASE WHEN PLAYER_ROLE = 'WICKETKEEPER' THEN 1 END) AS WICKETKEEPER
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME

--20. Display team name and total number of players whose name starts with ‘A’ 

SELECT T.TEAM_NAME , COUNT(*) AS PLAYER_A
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
WHERE PLAYER_FIRST_NAME LIKE 'A%'
GROUP BY T.TEAM_NAME
