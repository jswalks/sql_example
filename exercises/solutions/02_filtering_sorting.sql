-- Solutions to exercises/02_filtering_sorting.sql

-- Task 1
SELECT * FROM species WHERE base_speed > 90;

-- Task 2
SELECT * FROM trainers WHERE hometown = 'Ashport';

-- Task 3
SELECT * FROM pokemon WHERE level >= 30 ORDER BY level DESC;

-- Task 4
SELECT * FROM species WHERE type1_id IN (2, 3);

-- Task 5
SELECT * FROM pokemon WHERE nickname IS NULL;

-- Task 6
SELECT * FROM trainers
WHERE started_year BETWEEN 2015 AND 2018
ORDER BY name;

-- Task 7
SELECT * FROM trainers WHERE name LIKE 'M%';

-- Task 8
SELECT nickname, species_id, level
FROM pokemon
ORDER BY level DESC
LIMIT 3;
