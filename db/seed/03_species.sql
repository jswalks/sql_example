-- 30 species spanning generations 1-3, with a mix of single-type and
-- dual-type Pokemon so students can practice joining species -> types twice
-- (once for type1, once for type2).
--
-- Base stats are approximate, for teaching purposes only.
INSERT INTO species (species_id, name, type1_id, type2_id, base_hp, base_attack, base_defense, base_speed, generation) VALUES
    (1,  'Bulbasaur',  5,  8,    45,  49,  49,  45,  1),
    (2,  'Ivysaur',    5,  8,    60,  62,  63,  60,  1),
    (3,  'Venusaur',   5,  8,    80,  82,  83,  80,  1),
    (4,  'Charmander', 2,  NULL, 39,  52,  43,  65,  1),
    (5,  'Charmeleon', 2,  NULL, 58,  64,  58,  80,  1),
    (6,  'Charizard',  2,  10,   78,  84,  78,  100, 1),
    (7,  'Squirtle',   3,  NULL, 44,  48,  65,  43,  1),
    (8,  'Wartortle',  3,  NULL, 59,  63,  80,  58,  1),
    (9,  'Blastoise',  3,  NULL, 79,  83,  100, 78,  1),
    (10, 'Pikachu',    4,  NULL, 35,  55,  40,  90,  1),
    (11, 'Raichu',     4,  NULL, 60,  90,  55,  110, 1),
    (12, 'Jigglypuff', 1,  18,   115, 45,  20,  20,  1),
    (13, 'Meowth',     1,  NULL, 40,  45,  35,  90,  1),
    (14, 'Psyduck',    3,  NULL, 50,  52,  48,  55,  1),
    (15, 'Machop',     7,  NULL, 70,  80,  50,  35,  1),
    (16, 'Geodude',    13, 9,    40,  80,  100, 20,  1),
    (17, 'Gastly',     14, 8,    30,  35,  30,  80,  1),
    (18, 'Onix',       13, 9,    35,  45,  160, 70,  1),
    (19, 'Eevee',      1,  NULL, 55,  55,  50,  55,  1),
    (20, 'Snorlax',    1,  NULL, 160, 110, 65,  30,  1),
    (21, 'Dratini',    15, NULL, 41,  64,  45,  50,  1),
    (22, 'Chikorita',  5,  NULL, 45,  49,  65,  45,  2),
    (23, 'Cyndaquil',  2,  NULL, 39,  52,  43,  65,  2),
    (24, 'Totodile',   3,  NULL, 50,  65,  64,  43,  2),
    (25, 'Pichu',      4,  NULL, 20,  40,  15,  60,  2),
    (26, 'Togepi',     18, NULL, 35,  20,  65,  20,  2),
    (27, 'Mareep',     4,  NULL, 55,  40,  40,  35,  2),
    (28, 'Treecko',    5,  NULL, 40,  45,  35,  70,  3),
    (29, 'Torchic',     2, NULL, 45,  60,  40,  45,  3),
    (30, 'Mudkip',     3,  NULL, 50,  70,  50,  40,  3);
