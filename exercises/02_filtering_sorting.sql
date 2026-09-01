-- ============================================================================
-- 02: Filtering and sorting
--
-- Goal: use WHERE to keep only the rows you care about, and ORDER BY to
-- control what order they come back in.
-- ============================================================================


-- Task 1
-- Find every species with a base_speed greater than 90.



-- Task 2
-- Find every trainer from the hometown 'Ashport'.
-- Note: text values go in single quotes, e.g. 'Ashport'.



-- Task 3
-- List all pokemon with a level of 30 or higher, sorted by level from
-- highest to lowest.
-- Hint: ORDER BY <column> DESC sorts highest-first.



-- Task 4
-- Find every species that is Fire type OR Water type (type1_id = 2 or 3).
-- Hint: look up "types" table first to see which id maps to which name,
-- or use IN (2, 3).



-- Task 5
-- Find every pokemon that does NOT have a nickname.
-- Hint: a missing value in SQL is NULL, and NULL needs its own comparison:
-- "column IS NULL" (not "column = NULL", which never matches anything).



-- Task 6
-- Find every trainer who started between 2015 and 2018 (inclusive),
-- sorted alphabetically by name.
-- Hint: look up "BETWEEN".



-- Task 7
-- Find every trainer whose name starts with the letter 'M'.
-- Hint: look up "LIKE" and the '%' wildcard, e.g. LIKE 'M%'.



-- Task 8
-- List the 3 highest-level pokemon, showing nickname, species_id and level.
-- Hint: combine ORDER BY ... DESC with LIMIT.
