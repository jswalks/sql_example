-- ============================================================================
-- 04: Aggregates and GROUP BY
--
-- Goal: turn many rows into a summary -- counts, totals, averages -- and do
-- it separately for each group (e.g. "how many pokemon does each trainer
-- have?" instead of just "how many pokemon are there in total?").
--
-- Aggregate functions you'll need: COUNT(), AVG(), SUM(), MIN(), MAX().
-- ============================================================================


-- Task 1
-- Count how many rows are in the "pokemon" table in total.
-- Hint: SELECT COUNT(*) FROM pokemon;



-- Task 2
-- Find the average base_speed across all species.



-- Task 3
-- Count how many pokemon each trainer owns. Show trainer_id and the count,
-- one row per trainer. Wild pokemon (trainer_id IS NULL) should not be
-- counted as belonging to any trainer.
-- Hint:
--   SELECT trainer_id, COUNT(*) AS pokemon_count
--   FROM pokemon
--   WHERE trainer_id IS NOT NULL
--   GROUP BY trainer_id;



-- Task 4
-- Same as Task 3, but now show the trainer's *name* instead of just their
-- id. You'll need to JOIN trainers in before grouping.



-- Task 5
-- For each species type (type1_id), find the average base_attack.
-- Group by type1_id.



-- Task 6
-- Repeat Task 3 (pokemon count per trainer), but only keep trainers who
-- own 3 or more pokemon.
-- Hint: WHERE filters rows before grouping; HAVING filters groups after
-- aggregation -- you need HAVING here since COUNT(*) doesn't exist until
-- after grouping.



-- Task 7
-- Find the highest level pokemon belonging to each trainer. Show
-- trainer_id and the max level.
