-- ============================================================================
-- 05: Multi-table joins
--
-- Goal: chain three or more tables together, and join a table to itself
-- (useful whenever two rows in the same table relate to each other, like
-- two trainers facing off in a battle).
-- ============================================================================


-- Task 1
-- For every owned pokemon, show: trainer name, pokemon nickname, species
-- name, and the species' primary type name. That's four tables chained
-- together: trainers -> pokemon -> species -> types.



-- Task 2
-- List every gym badge earned, showing the trainer's name, the gym's name,
-- and the earned_date. Join trainers -> gym_badges -> gyms.



-- Task 3
-- List every battle, showing the *names* of both trainers involved (not
-- their ids) plus the battle_date and location. You need to join the
-- "trainers" table into "battles" twice -- once for trainer1_id and once
-- for trainer2_id -- so give each join a different alias.
-- Hint:
--   SELECT t1.name AS trainer1_name, t2.name AS trainer2_name,
--          b.battle_date, b.location
--   FROM battles b
--   JOIN trainers t1 ON b.trainer1_id = t1.trainer_id
--   JOIN trainers t2 ON b.trainer2_id = t2.trainer_id;



-- Task 4
-- Extend Task 3: also show the winner's name. Since winner_id can be NULL
-- (a draw), use a LEFT JOIN for that third trainers alias so draws still
-- show up (with a NULL/blank winner name) instead of disappearing.



-- Task 5
-- List every trainer's name together with every move known by every
-- pokemon they own (one row per trainer/move combination -- a trainer with
-- several pokemon that each know several moves will appear many times).
-- Chain: trainers -> pokemon -> pokemon_moves -> moves.
