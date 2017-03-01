-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament

\c tournament

DROP TABLE if EXISTS players, matches;

CREATE TABLE players (
   player_id SERIAL PRIMARY KEY,
   player_name TEXT
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    winner INTEGER REFERENCES  players(player_id),
    loser INTEGER REFERENCES  players(player_id)
);

CREATE VIEW matches_view AS
SELECT  players.player_id AS player,
        count(matches) AS matches
FROM players LEFT JOIN matches
ON players.player_id = matches.winner or players.player_id = matches.loser
GROUP BY players.player_id
ORDER BY matches DESC;

CREATE VIEW wins_view AS
SELECT  players.player_id AS player,
        count(matches.winner) AS wins
FROM players LEFT JOIN matches
ON players.player_id = matches.winner
GROUP BY players.player_id
ORDER BY wins DESC;

CREATE VIEW losses_view AS
SELECT  players.player_id AS player,
        count(matches.loser) AS losses
FROM players LEFT JOIN matches
ON players.player_id = matches.loser
GROUP BY players.player_id
ORDER BY losses DESC;

CREATE VIEW standings AS
SELECT players.player_id AS player,
       players.player_name AS name,
       wins_view.wins,
       matches_view.matches
FROM players
LEFT JOIN wins_view ON players.player_id = wins_view.player
LEFT JOIN matches_view ON players.player_id = matches_view.player
GROUP BY players.player_id, players.player_name, wins_view.wins, matches_view.matches
ORDER BY wins_view.wins DESC;
