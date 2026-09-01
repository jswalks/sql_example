-- Solutions to exercises/01_select_basics.sql
-- Try the exercise yourself first -- there's often more than one correct way
-- to write a query, so don't worry if yours looks different but returns the
-- same result.

-- Task 1
SELECT * FROM trainers;

-- Task 2
SELECT name, hometown FROM trainers;

-- Task 3
SELECT name AS species_name FROM species;

-- Task 4
SELECT * FROM moves LIMIT 5;

-- Task 5
SELECT nickname, level FROM pokemon LIMIT 10;
-- Note: "pokemon" has no "name" column (that's on "species"), only
-- "nickname" -- and it's NULL for pokemon the trainer never renamed.

-- Task 6
SELECT DISTINCT hometown FROM trainers;
