-- Solutions to exercises/05_multi_table_joins.sql

-- Task 1
SELECT trainers.name AS trainer_name,
       pokemon.nickname,
       species.name AS species_name,
       types.name AS primary_type
FROM trainers
JOIN pokemon ON trainers.trainer_id = pokemon.trainer_id
JOIN species ON pokemon.species_id = species.species_id
JOIN types ON species.type1_id = types.type_id;

-- Task 2
SELECT trainers.name AS trainer_name, gyms.name AS gym_name, gym_badges.earned_date
FROM trainers
JOIN gym_badges ON trainers.trainer_id = gym_badges.trainer_id
JOIN gyms ON gym_badges.gym_id = gyms.gym_id;

-- Task 3
SELECT t1.name AS trainer1_name, t2.name AS trainer2_name,
       b.battle_date, b.location
FROM battles b
JOIN trainers t1 ON b.trainer1_id = t1.trainer_id
JOIN trainers t2 ON b.trainer2_id = t2.trainer_id;

-- Task 4
SELECT t1.name AS trainer1_name, t2.name AS trainer2_name,
       w.name AS winner_name,
       b.battle_date, b.location
FROM battles b
JOIN trainers t1 ON b.trainer1_id = t1.trainer_id
JOIN trainers t2 ON b.trainer2_id = t2.trainer_id
LEFT JOIN trainers w ON b.winner_id = w.trainer_id;

-- Task 5
SELECT trainers.name AS trainer_name, moves.name AS move_name
FROM trainers
JOIN pokemon ON trainers.trainer_id = pokemon.trainer_id
JOIN pokemon_moves ON pokemon.pokemon_id = pokemon_moves.pokemon_id
JOIN moves ON pokemon_moves.move_id = moves.move_id;
