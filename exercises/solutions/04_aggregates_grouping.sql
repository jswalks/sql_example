-- Solutions to exercises/04_aggregates_grouping.sql

-- Task 1
SELECT COUNT(*) FROM pokemon;

-- Task 2
SELECT AVG(base_speed) FROM species;

-- Task 3
SELECT trainer_id, COUNT(*) AS pokemon_count
FROM pokemon
WHERE trainer_id IS NOT NULL
GROUP BY trainer_id;

-- Task 4
SELECT trainers.name, COUNT(*) AS pokemon_count
FROM pokemon
JOIN trainers ON pokemon.trainer_id = trainers.trainer_id
GROUP BY trainers.name;

-- Task 5
SELECT type1_id, AVG(base_attack) AS avg_attack
FROM species
GROUP BY type1_id;

-- Task 6
SELECT trainer_id, COUNT(*) AS pokemon_count
FROM pokemon
WHERE trainer_id IS NOT NULL
GROUP BY trainer_id
HAVING COUNT(*) >= 3;

-- Task 7
SELECT trainer_id, MAX(level) AS highest_level
FROM pokemon
WHERE trainer_id IS NOT NULL
GROUP BY trainer_id;
