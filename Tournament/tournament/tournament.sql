-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.


-- CREATE DATABASE tournament
--
-- \c tournament
--
-- DROP TABLE if EXISTS players, matches;

CREATE TABLE players (
   id SERIAL PRIMARY KEY,
   player_name TEXT
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    winner INTEGER REFERENCES  players(id),
    loser INTEGER REFERENCES  players(id)
);

CREATE VIEW player_standings AS
SELECT players.player_name, count(players.player_name) AS win_total
FROM players, matches
WHERE players.id=matches.winner GROUP BY players.name ORDER BY win_total DESC;
