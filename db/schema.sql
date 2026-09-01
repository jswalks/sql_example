-- ============================================================================
-- schema.sql
--
-- Creates every table in the Pokemon teaching database, empty (no data yet).
-- Seed data lives in db/seed/*.sql and is loaded separately by db/build.sh.
--
-- Run order matters because of foreign keys: a table referenced by another
-- table (e.g. "types") must be created before the table that references it
-- (e.g. "species"). The order below already respects that.
-- ============================================================================

-- Drop tables first so this script can be re-run safely against an existing
-- database. Order is reverse of creation, so nothing gets dropped while
-- something else still references it.
DROP TABLE IF EXISTS battles;
DROP TABLE IF EXISTS gym_badges;
DROP TABLE IF EXISTS gyms;
DROP TABLE IF EXISTS pokemon_moves;
DROP TABLE IF EXISTS moves;
DROP TABLE IF EXISTS pokemon;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS trainers;
DROP TABLE IF EXISTS types;

-- ----------------------------------------------------------------------------
-- types: the 18 elemental types (Fire, Water, Grass, ...). A lookup table
-- that other tables point to instead of repeating the type name as text.
-- ----------------------------------------------------------------------------
CREATE TABLE types (
    type_id INTEGER PRIMARY KEY,
    name    VARCHAR NOT NULL UNIQUE
);

-- ----------------------------------------------------------------------------
-- trainers: the people who catch and battle with Pokemon.
-- ----------------------------------------------------------------------------
CREATE TABLE trainers (
    trainer_id   INTEGER PRIMARY KEY,
    name         VARCHAR NOT NULL,
    hometown     VARCHAR,
    started_year INTEGER  -- year the trainer got their first Pokemon
);

-- ----------------------------------------------------------------------------
-- species: the Pokedex entry for a *kind* of Pokemon (e.g. "Pikachu"), not an
-- individual animal. Every owned Pokemon in the "pokemon" table points back
-- to one row here for its type(s) and base stats.
-- type2_id is nullable because many species only have one type.
-- ----------------------------------------------------------------------------
CREATE TABLE species (
    species_id   INTEGER PRIMARY KEY,
    name         VARCHAR NOT NULL,
    type1_id     INTEGER NOT NULL REFERENCES types(type_id),
    type2_id     INTEGER REFERENCES types(type_id),
    base_hp      INTEGER NOT NULL,
    base_attack  INTEGER NOT NULL,
    base_defense INTEGER NOT NULL,
    base_speed   INTEGER NOT NULL,
    generation   INTEGER NOT NULL  -- which Pokemon game generation introduced it
);

-- ----------------------------------------------------------------------------
-- pokemon: one row per *individual* Pokemon, owned or wild.
-- trainer_id is nullable: NULL means the Pokemon is wild and has not been
-- caught by anyone. This is used later to practice LEFT JOIN and IS NULL.
-- ----------------------------------------------------------------------------
CREATE TABLE pokemon (
    pokemon_id  INTEGER PRIMARY KEY,
    nickname    VARCHAR,   -- optional; NULL means the trainer never renamed it
    species_id  INTEGER NOT NULL REFERENCES species(species_id),
    trainer_id  INTEGER REFERENCES trainers(trainer_id),
    level       INTEGER NOT NULL,
    is_shiny    BOOLEAN NOT NULL DEFAULT FALSE,
    caught_date DATE  -- NULL for Pokemon that are still wild
);

-- ----------------------------------------------------------------------------
-- moves: attacks that a Pokemon can know (e.g. "Flamethrower").
-- ----------------------------------------------------------------------------
CREATE TABLE moves (
    move_id  INTEGER PRIMARY KEY,
    name     VARCHAR NOT NULL,
    type_id  INTEGER NOT NULL REFERENCES types(type_id),
    power    INTEGER,  -- NULL for status moves that don't deal damage
    accuracy INTEGER,  -- percent, 1-100
    pp       INTEGER NOT NULL  -- "power points": how many times it can be used
);

-- ----------------------------------------------------------------------------
-- pokemon_moves: which moves each individual Pokemon knows.
-- This is a many-to-many link table: one Pokemon can know many moves, and one
-- move can be known by many Pokemon. The primary key is the pair of columns,
-- which also stops the same Pokemon from learning the same move twice.
-- ----------------------------------------------------------------------------
CREATE TABLE pokemon_moves (
    pokemon_id INTEGER NOT NULL REFERENCES pokemon(pokemon_id),
    move_id    INTEGER NOT NULL REFERENCES moves(move_id),
    PRIMARY KEY (pokemon_id, move_id)
);

-- ----------------------------------------------------------------------------
-- gyms: a gym a trainer can challenge for a badge.
-- ----------------------------------------------------------------------------
CREATE TABLE gyms (
    gym_id      INTEGER PRIMARY KEY,
    name        VARCHAR NOT NULL,
    city        VARCHAR,
    leader_name VARCHAR,
    badge_name  VARCHAR,
    type_id     INTEGER REFERENCES types(type_id)  -- the gym's specialty type
);

-- ----------------------------------------------------------------------------
-- gym_badges: which trainer has earned which gym's badge, and when.
-- Another many-to-many link table, same pattern as pokemon_moves.
-- ----------------------------------------------------------------------------
CREATE TABLE gym_badges (
    trainer_id  INTEGER NOT NULL REFERENCES trainers(trainer_id),
    gym_id      INTEGER NOT NULL REFERENCES gyms(gym_id),
    earned_date DATE,
    PRIMARY KEY (trainer_id, gym_id)
);

-- ----------------------------------------------------------------------------
-- battles: a battle between two trainers. winner_id is nullable to represent
-- a draw. trainer1_id/trainer2_id/winner_id all reference the *same* table
-- (trainers), which is used later to practice joining a table to itself.
-- ----------------------------------------------------------------------------
CREATE TABLE battles (
    battle_id   INTEGER PRIMARY KEY,
    trainer1_id INTEGER NOT NULL REFERENCES trainers(trainer_id),
    trainer2_id INTEGER NOT NULL REFERENCES trainers(trainer_id),
    winner_id   INTEGER REFERENCES trainers(trainer_id),  -- NULL = draw
    battle_date DATE,
    location    VARCHAR
);
