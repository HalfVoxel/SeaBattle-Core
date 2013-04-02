CREATE TABLE player (
    playerId serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    hash char(128) NOT NULL,
    salt char(16) NOT NULL,
    email text NOT NULL,
    banned boolean NOT NULL DEFAULT false,
    userSince timestamp with time zone NOT NULL
);

CREATE TABLE game (
    gameId serial PRIMARY KEY,
    mapId integer NOT NULL,
    tickLength integer NOT NULL, -- in seconds
    lastTick timestamp with time zone NOT NULL,
    startedAt timestamp NOT NULL
);

CREATE TABLE game_player (
    gameId integer REFERENCES game ON DELETE CASCADE,
    playerId integer REFERENCES player ON DELETE CASCADE
);

CREATE TABLE stock (
    stockId serial PRIMARY KEY,
    cannonballs integer NOT NULL,
    gold integer NOT NULL,
    wood integer NOT NULL,
    iron integer NOT NULL
);

CREATE TABLE ship (
    shipId serial PRIMARY KEY,
    gameId integer REFERENCES game ON DELETE CASCADE,
    stockId integer REFERENCES stock ON DELETE CASCADE,
    class integer NOT NULL, -- ship class
    damage integer NOT NULL,
    owner integer NOT NULL,
    posX integer NOT NULL,
    posY integer NOT NULL
);

CREATE TABLE island (
    island_id serial PRIMARY KEY,
    gameId integer REFERENCES game ON DELETE CASCADE,
    stockId integer REFERENCES stock ON DELETE CASCADE
);
