-- Which trainer earned which gym's badge, and when. Trainers 7, 9 and 11 own
-- no badges at all yet -- deliberately, so exercises can practice finding
-- "trainers with no matching row" via LEFT JOIN / NOT IN / NOT EXISTS.
INSERT INTO gym_badges (trainer_id, gym_id, earned_date) VALUES
    (1,  1, DATE '2015-07-01'),
    (1,  6, DATE '2016-01-15'),
    (2,  2, DATE '2016-08-01'),
    (3,  1, DATE '2014-05-01'),
    (3,  3, DATE '2014-10-01'),
    (3,  5, DATE '2015-01-20'),
    (4,  4, DATE '2018-09-01'),
    (5,  5, DATE '2013-06-01'),
    (5,  1, DATE '2013-08-15'),
    (5,  7, DATE '2013-11-01'),
    (6,  6, DATE '2017-05-01'),
    (8,  8, DATE '2017-01-10'),
    (8,  1, DATE '2017-03-03'),
    (10, 2, DATE '2015-12-01'),
    (10, 3, DATE '2016-02-14'),
    (12, 1, DATE '2012-09-01'),
    (12, 4, DATE '2012-10-01'),
    (12, 5, DATE '2012-11-01'),
    (12, 7, DATE '2013-01-01');
