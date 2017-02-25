-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.


-- CREATE DATABASE tournament
--
-- \c tournament
--
-- DROP TABLE if EXISTS players, matches;

CREATE TABLE players (
   player_id SERIAL PRIMARY KEY,
   player_name TEXT
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    winner INTEGER REFERENCES  players(player_id),
    loser INTEGER REFERENCES  players(player_id)
);

CREATE VIEW wins_view AS
SELECT  players.player_id,
        players.player_name,
        count(matches.winner) AS wins
FROM players LEFT JOIN matches
ON players.player_id = matches.winner
GROUP BY players.player_id
ORDER BY wins DESC;


CREATE VIEW matches_view AS
SELECT  players.player_id,
        players.player_name,
        (count(matches.winner)) + (count(matches.loser)) AS matches
FROM players LEFT JOIN matches
ON players.player_id = matches.winner or players.player_id = matches.loser
GROUP BY players.player_id
ORDER BY matches DESC;
