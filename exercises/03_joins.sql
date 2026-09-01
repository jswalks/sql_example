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
-- Hint:
--   SELECT pokemon.nickname, species.name
--   FROM pokemon
--   JOIN species ON pokemon.species_id = species.species_id;



-- Task 2
-- For every owned pokemon (i.e. it has a trainer), show the trainer's name
-- next to the pokemon's nickname and level. Join pokemon.trainer_id to
-- trainers.trainer_id.
-- Note: a plain JOIN only returns rows where both sides match, so wild
-- (trainer_id IS NULL) pokemon are automatically left out here -- exactly
-- what we want for this task.



-- Task 3
-- List every move known by the pokemon with nickname 'Sparky', showing the
-- move's name and power. You'll need pokemon_moves to bridge pokemon and
-- moves (a "many-to-many" join, since it goes through a middle table).
-- Hint:
--   SELECT moves.name, moves.power
--   FROM pokemon
--   JOIN pokemon_moves ON pokemon.pokemon_id = pokemon_moves.pokemon_id
--   JOIN moves ON pokemon_moves.move_id = moves.move_id
--   WHERE pokemon.nickname = 'Sparky';



-- Task 4
-- List every species name together with its primary type name (type1_id).
-- Join species.type1_id to types.type_id.



-- Task 5
-- Show every pokemon's nickname/species alongside its trainer's name --
-- but this time include wild pokemon too, with the trainer name showing as
-- NULL/blank instead of dropping the row.
-- Hint: look up "LEFT JOIN" -- it keeps every row from the left-hand table
-- even when there's no match on the right.
