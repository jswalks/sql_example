-- 15 battles between trainers. winner_id is NULL for a couple of rows to
-- represent a draw -- useful for practicing NULL-aware filtering later.
-- trainer1_id, trainer2_id and winner_id all reference the trainers table,
-- which makes this table a good example of joining one table to itself.
INSERT INTO battles (battle_id, trainer1_id, trainer2_id, winner_id, battle_date, location) VALUES
    (1,  1,  3,  3,    DATE '2015-08-01', 'Cedar Falls Field'),
    (2,  2,  7,  2,    DATE '2019-07-10', 'Ashport Pier'),
    (3,  5,  12, 12,   DATE '2013-09-01', 'Pallet Grove Arena'),
    (4,  4,  10, 4,    DATE '2018-10-05', 'Rivermouth Dock'),
    (5,  6,  11, NULL, DATE '2018-03-03', 'Stonebridge Plaza'),
    (6,  8,  1,  1,    DATE '2017-04-04', 'Cedar Falls Field'),
    (7,  9,  7,  7,    DATE '2020-05-05', 'Solvale Outskirts'),
    (8,  3,  12, 3,    DATE '2015-02-02', 'Solvale Stadium'),
    (9,  10, 2,  10,   DATE '2016-06-06', 'Rivermouth Dock'),
    (10, 5,  8,  5,    DATE '2014-01-01', 'Pallet Grove Arena'),
    (11, 11, 4,  NULL, DATE '2019-02-02', 'Stonebridge Plaza'),
    (12, 1,  6,  6,    DATE '2018-01-01', 'Cedar Falls Field'),
    (13, 9,  11, 9,    DATE '2021-01-01', 'Solvale Outskirts'),
    (14, 12, 3,  12,   DATE '2016-03-03', 'Pallet Grove Arena'),
    (15, 2,  10, 2,    DATE '2017-07-07', 'Ashport Pier');
