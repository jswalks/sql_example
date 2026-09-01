-- 20 moves spread across several types. power is NULL-able in the schema
-- for status moves, but every move seeded here deals damage.
INSERT INTO moves (move_id, name, type_id, power, accuracy, pp) VALUES
    (1,  'Tackle',         1,  40,  100, 35),
    (2,  'Scratch',        1,  40,  100, 35),
    (3,  'Quick Attack',   1,  40,  100, 30),
    (4,  'Body Slam',      1,  85,  100, 15),
    (5,  'Ember',          2,  40,  100, 25),
    (6,  'Flamethrower',   2,  90,  100, 15),
    (7,  'Water Gun',      3,  40,  100, 25),
    (8,  'Hydro Pump',     3,  110, 80,  5),
    (9,  'Thunder Shock',  4,  40,  100, 30),
    (10, 'Thunderbolt',    4,  90,  100, 15),
    (11, 'Vine Whip',      5,  45,  100, 25),
    (12, 'Razor Leaf',     5,  55,  95,  25),
    (13, 'Bite',           16, 60,  100, 25),
    (14, 'Confusion',      11, 50,  100, 25),
    (15, 'Psychic',        11, 90,  100, 10),
    (16, 'Rock Throw',     13, 50,  90,  15),
    (17, 'Dig',            9,  80,  100, 10),
    (18, 'Shadow Ball',    14, 80,  100, 15),
    (19, 'Ice Beam',       6,  90,  100, 10),
    (20, 'Dragon Breath',  15, 60,  100, 20);
