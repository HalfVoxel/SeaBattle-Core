CREATE TABLE player (
    player_id serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    hash char(128) NOT NULL,
    salt char(16) NOT NULL,
    email text NOT NULL,
    banned boolean NOT NULL DEFAULT false,
    user_since timestamp with time zone NOT NULL
);

CREATE TABLE game (
    game_id serial PRIMARY KEY,
    map_id integer NOT NULL,
    tick_length integer NOT NULL, -- in seconds
    last_tick timestamp with time zone NOT NULL,
    started_at timestamp NOT NULL
);

CREATE TABLE game_player (
    game_id REFERENCES game ON DELETE CASCADE,
    player_id REFERENCES player ON DELETE CASCADE,
);

CREATE TABLE stock (
    stock_id serial PRIMARY KEY,
    cannonballs integer NOT NULL,
    gold integer NOT NULL,
    wood integer NOT NULL,
    iron integer NOT NULL
);

CREATE TABLE ship (
    ship_id serial PRIMARY KEY,
    game_id integer REFERENCES game ON DELETE CASCADE,
    stock_id integer REFERENCES stock ON DELETE CASCADE,
    class integer NOT NULL, -- ship class
    damage integer NOT NULL,
    owner integer NOT NULL,
    pos_x integer NOT NULL,
    pos_y integer NOT NULL
);

CREATE TABLE island (
    island_id serial PRIMARY_KEY,
    game_id integer REFERENCES game ON DELETE CASCADE,
    stock_id integer REFERENCES stock ON DELETE CASCADE
);
