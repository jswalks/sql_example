-- ============================================================================
-- 05: Multi-table joins
--
-- Goal: chain three or more tables together, and join a table to itself
-- (useful whenever two rows in the same table relate to each other, like
-- two trainers facing off in a battle).

-- I have given you chains in some more complex joins below so you shaped
-- less time working out the structure and more practicing joins!

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



-- Task 4
-- Extend Task 3: also show the winner's name. Since winner_id can be NULL
-- (a draw), make sure these still show up (with a NULL/blank winner name) instead of disappearing.
-- (There are 2 draws for when you are testing!)



-- Task 5
-- List every trainer's name together with every move known by every
-- pokemon they own (one row per trainer/move combination -- a trainer with
-- several pokemon that each know several moves will appear many times).
-- Chain: trainers -> pokemon -> pokemon_moves -> moves.
