-- ============================================================================
-- 01: SELECT basics
--
-- Goal: get comfortable reading a table and picking out the columns/rows you
-- want. Every task below is a comment describing what to find; write your
-- SQL query underneath it.
--
-- How SQL comments work: anything after "--" on a line is ignored, exactly
-- like the instructions you're reading right now.
--
-- How to run this file:
--   duckdb data/pokemon.duckdb -c ".read exercises/01_select_basics.sql"
-- (see README.md if that command doesn't make sense yet)
--
-- Every query in this file ends with a semicolon ";" -- that's how the
-- database knows where one query ends and the next begins.
-- ============================================================================


-- Task 1
-- Look at every column and every row of the "trainers" table.
-- Hint: SELECT * FROM <table_name>;



-- Task 2
-- Look at every row of "trainers", but only the "name" and "hometown"
-- columns. Listing specific columns instead of "*" is normal practice --
-- it's easier to read and faster once tables get big.



-- Task 3
-- List just the "name" column from "species", but rename ("alias") the
-- column in the output to "species_name".



-- Task 4
-- Show only the first 5 rows of the "moves" table.
-- Hint: the LIMIT clause goes at the end of the query.



-- Task 5
-- List the "nickname" and "level" columns from "pokemon", but only the
-- first 10 rows.



-- Task 6
-- List every distinct (i.e. no duplicates) hometown that appears in
-- "trainers". There are 12 trainers but only 6 hometowns -- your result
-- should have 6 rows, not 12.
-- Hint: look up "SELECT DISTINCT".
