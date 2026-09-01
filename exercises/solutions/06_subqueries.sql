-- Solutions to exercises/06_subqueries.sql

-- Task 1
SELECT name, base_speed
FROM species
WHERE base_speed > (SELECT AVG(base_speed) FROM species);

-- Task 2
SELECT name FROM trainers
WHERE trainer_id NOT IN (SELECT trainer_id FROM gym_badges);

-- Task 3
SELECT *
FROM pokemon
WHERE pokemon_id IN (
    SELECT pokemon_moves.pokemon_id
    FROM pokemon_moves
    JOIN moves ON pokemon_moves.move_id = moves.move_id
    WHERE moves.name = 'Thunderbolt'
);

-- Task 4
SELECT name, base_hp
FROM species
WHERE base_hp = (SELECT MAX(base_hp) FROM species);

-- Task 5
SELECT trainer_id, pokemon_count
FROM (
    SELECT trainer_id, COUNT(*) AS pokemon_count
    FROM pokemon
    WHERE trainer_id IS NOT NULL
    GROUP BY trainer_id
) AS counts
WHERE pokemon_count > (
    SELECT AVG(pokemon_count) FROM (
        SELECT COUNT(*) AS pokemon_count
        FROM pokemon
        WHERE trainer_id IS NOT NULL
        GROUP BY trainer_id
    )
);
