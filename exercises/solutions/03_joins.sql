-- Solutions to exercises/03_joins.sql

-- Task 1
SELECT pokemon.nickname, species.name
FROM pokemon
JOIN species ON pokemon.species_id = species.species_id;

-- Task 2
SELECT trainers.name AS trainer_name, pokemon.nickname, pokemon.level
FROM pokemon
JOIN trainers ON pokemon.trainer_id = trainers.trainer_id;

-- Task 3
SELECT moves.name, moves.power
FROM pokemon
JOIN pokemon_moves ON pokemon.pokemon_id = pokemon_moves.pokemon_id
JOIN moves ON pokemon_moves.move_id = moves.move_id
WHERE pokemon.nickname = 'Sparky';

-- Task 4
SELECT species.name AS species_name, types.name AS primary_type
FROM species
JOIN types ON species.type1_id = types.type_id;

-- Task 5
SELECT pokemon.nickname, species.name AS species_name, trainers.name AS trainer_name
FROM pokemon
JOIN species ON pokemon.species_id = species.species_id
LEFT JOIN trainers ON pokemon.trainer_id = trainers.trainer_id;
