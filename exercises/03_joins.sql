-- ============================================================================
-- 03: Joins
--
-- Goal: combine rows from two related tables into one result. This is the
-- single most important SQL skill -- almost every real query joins at
-- least two tables.
--
-- The database only knows tables are related because a column in one
-- table matches a column in another (a "foreign key"). For example,
-- pokemon.species_id matches species.species_id. A JOIN tells the database
-- to line those matching rows up.
--
-- Reminder of the tables you have available: trainers, species, pokemon,
-- moves, pokemon_moves, gyms, gym_badges, battles, types.
-- ============================================================================


-- Task 1
-- For every pokemon, show its nickname (from "pokemon") next to its
-- species name (from "species"). Join pokemon.species_id to species.species_id.



-- Task 2
-- For every owned pokemon (i.e. it has a trainer), show the trainer's name
-- next to the pokemon's nickname and level



-- Task 3
-- List every move known by the pokemon with nickname 'Sparky', showing the
-- move's name and power. You'll need pokemon_moves to bridge pokemon and
-- moves (a "many-to-many" join, since it goes through a middle table).



-- Task 4
-- List every species name together with its primary type name (type1_id).



-- Task 5
-- Show every pokemon's nickname/species alongside its trainer's name --
-- but this time include wild pokemon too, with the trainer name showing as
-- NULL/blank instead of dropping the row.
