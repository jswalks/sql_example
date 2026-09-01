# Database schema

The database models a small Pokemon world: trainers who catch and battle
with Pokemon, gyms they can earn badges from, and the moves their Pokemon
know. It's entirely made-up data for teaching SQL — not sourced from or
distributed with any Pokemon game.

## Tables and how they relate

```
types
  ^        ^                    ^
  |        |                    |
species  moves                gyms
  ^        ^                    ^
  |        |                    |
pokemon --pokemon_moves    gym_badges
  ^                              ^
  |                              |
trainers ---------------------- trainers
  ^
  |
battles (trainer1_id, trainer2_id, winner_id all point back to trainers)
```

| Table | What one row represents | Points to (foreign keys) |
|---|---|---|
| `types` | One of the 18 elemental types (Fire, Water, ...) | — |
| `trainers` | One trainer (person) | — |
| `species` | One *kind* of Pokemon, e.g. "Pikachu" (the Pokedex entry, not an individual) | `types` (twice: `type1_id`, `type2_id`) |
| `pokemon` | One individual Pokemon, owned or wild | `species`, `trainers` (nullable — NULL means wild) |
| `moves` | One attack a Pokemon can know, e.g. "Flamethrower" | `types` |
| `pokemon_moves` | "this individual Pokemon knows this move" | `pokemon`, `moves` |
| `gyms` | One gym | `types` (its specialty) |
| `gym_badges` | "this trainer earned this gym's badge, on this date" | `trainers`, `gyms` |
| `battles` | One battle between two trainers | `trainers` (three times: `trainer1_id`, `trainer2_id`, `winner_id`) |

## Why it's built this way

- **`species` vs `pokemon`** is the most important distinction in the
  schema: `species` is reference data (there is exactly one "Pikachu" row,
  describing the species in general), while `pokemon` is the individuals
  (there can be many separately-owned Pikachu, each its own row with its
  own level and nickname). This mirrors a very common real-world pattern:
  a catalog/reference table (like `species` or `moves`) versus an
  instance/transaction table (like `pokemon`).

- **`pokemon_moves`** and **`gym_badges`** are *link tables* (also called
  join tables or associative tables). They exist because a Pokemon can
  know many moves and a move can be known by many Pokemon — you can't
  represent that with a single foreign key column on either side, so a
  third table sits in between and holds one row per pairing. Same idea for
  trainers and gym badges.

- **`pokemon.trainer_id` is nullable.** A NULL trainer_id means the
  Pokemon is wild — nobody has caught it. This is deliberate: it gives you
  a reason to practice `LEFT JOIN` and `IS NULL`, both of which come up
  constantly in real queries.

- **`battles.trainer1_id` / `trainer2_id` / `winner_id`** all reference
  the same `trainers` table. That's a "self-referencing" relationship —
  when you join `battles` to `trainers` to get readable names instead of
  ids, you have to join the same table in more than once (with different
  aliases), which is a skill worth practicing deliberately.

## Full column reference

See [`db/schema.sql`](../db/schema.sql) — it's the authoritative definition,
and every column has a comment explaining what it's for.
