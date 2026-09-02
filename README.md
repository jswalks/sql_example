# sql_example

A dummy, file-based database for practicing SQL, plus a set of SQL scripts
to run against it. The data is Pokemon-themed (trainers, Pokemon, moves,
gyms, battles) so it's easy to reason about while you're focused on
learning SQL syntax rather than a business domain.

This guide assumes you have never used a database before. Follow it
top to bottom the first time.

## Overview of this repository

- **The database** is a single file, `data/pokemon.duckdb`. It is *not* a
  server you connect to over a network — it's just a file on your computer,
  similar to how a `.xlsx` spreadsheet is a file. This makes it simple:
  nothing to start, nothing to configure, nothing to break.
- **DuckDB** is the free, open-source tool that reads and writes that file
  format, and understands SQL. You run a `duckdb` command in your terminal,
  point it at the file, and type SQL queries.
- **SQL** (Structured Query Language) is the language you use to ask a
  database questions, like "show me every trainer from Ashport" or "how
  many Pokemon does each trainer own?". That's what you're here to
  practice.
- The database file itself is *not* checked into this repository (see
  "Rebuilding the database" below for why) — you'll generate it yourself
  in step 3.

## 1. Install DuckDB

You need the DuckDB command-line tool ("CLI") installed. Pick your
operating system:

**macOS or Linux** — open a terminal and run:
```
curl https://install.duckdb.org | sh
```
This installs `duckdb` to `~/.duckdb/cli/latest/duckdb` and prints a line
telling you to add it to your `PATH`. Do what it says, e.g. add this to
your `~/.bashrc` or `~/.zshrc` (then restart your terminal, or run `source`
on that file):
```
export PATH="$HOME/.duckdb/cli/latest":$PATH
```

**Windows** — open PowerShell and run:
```
winget install DuckDB.cli
```
If you don't have `winget`, download the Windows zip from
https://duckdb.org/docs/installation and unzip `duckdb.exe` somewhere on
your `PATH`.

DuckDB's Windows install steps assume PowerShell/Windows Terminal (PATH updates may not apply to existing Git Bash sessions). Install via the Windows option above, then reopen your terminal (Git Bash or PowerShell) and run `duckdb --version`.

### Check it worked

Close and reopen your terminal, then run:
```
duckdb --version
```
You should see something like `v1.5.5 (Variegata) ...`. If you get
"command not found", the install step above didn't finish — the most
common cause is skipping the `PATH` step.

## 2. Get the repo

If you haven't already:
```
git clone <this-repo-url>
cd sql_example
```

## 3. Build the database

The actual database file isn't stored in git — only the SQL that *builds*
it is. Run the build script from inside the repo folder:

**macOS or Linux:**
```
./db/build.sh
```

**Windows:** the build script is a bash script, which Windows doesn't run
natively. Either use Git Bash (installed alongside Git for Windows) or WSL
to run the command above, or build it manually by running these two
commands from PowerShell, from inside the repo folder:
```
duckdb data\pokemon.duckdb -c ".read db/schema.sql"
Get-ChildItem db\seed\*.sql | ForEach-Object { duckdb data\pokemon.duckdb -c ".read '$($_.FullName)'" }
```

Either way, you should see a table of row counts printed at the end,
something like:
```
┌───────────────┬───────┐
│  table_name   │ rows  │
├───────────────┼───────┤
│ battles       │    15 │
│ gym_badges    │    19 │
...
```
That means it worked. You now have `data/pokemon.duckdb` on disk.

### Rebuilding the database

`./db/build.sh` is always safe to run again — it deletes any existing
`data/pokemon.duckdb` and rebuilds it fresh from `db/schema.sql` and
`db/seed/*.sql`. Run it any time you want to throw away changes you made
while experimenting (e.g. an `UPDATE` or `DELETE` you ran by hand) and get
back to a known starting point.

This is also *why* the `.duckdb` file itself isn't committed to git: it's
a generated build artifact (like a compiled binary), not source code. The
SQL files are the source of truth.

## 4. Open the database and try a query

Run:
```
duckdb data/pokemon.duckdb
```
You're now inside the DuckDB interactive shell — notice the prompt changes
to `D `. Type a SQL query and end it with a semicolon, then press Enter:
```sql
SELECT * FROM trainers LIMIT 5;
```
You should see a table of 5 trainers printed back.

A few things worth knowing about this shell:
- Every query must end with `;` — if you press Enter and nothing happens,
  you probably forgot it. Just type `;` and press Enter again.
- Queries can span multiple lines; nothing runs until you type `;`.
- To leave the shell, type `.exit` and press Enter (or press Ctrl-D).
- `.tables` lists every table. `.schema pokemon` shows how the `pokemon`
  table is defined.

## 5. YOUR TURN!

The `exercises/` folder has `.sql` files with practice questions instead
of pre-written answers — comments describe each task, and you write the
query underneath. You can trial and error these directly in the interactive
shell as you are developing.

Work through the `exercises/` files in numeric order — each one builds on
skills from the last. Read `docs/schema.md` first if you want to
understand what the tables mean before you start querying them.

To load and run the whole file from the shell :
```
duckdb data/pokemon.duckdb -c ".read exercises/01_select_basics.sql"
```
Or, from inside the interactive shell (step 4), run:
```
.read exercises/01_select_basics.sql
```
Once you've attempted a file, compare against
`exercises/solutions/<same filename>`, which has one correct answer for
every task (there's often more than one correct way to write a query —
if yours returns the same result, it's right, even if it looks different).

Run solution for one like:
```
duckdb data/pokemon.duckdb -c ".read exercises/solutions/01_select_basics.sql"
```
Or from the interactive shell:
```
.read exercises/solutions/01_select_basics.sql
```

## Repository layout

```
sql_example/
├── README.md               you are here
├── db/
│   ├── schema.sql           CREATE TABLE statements -- the table definitions
│   ├── seed/                INSERT statements -- the actual dummy data, one file per table
│   └── build.sh              rebuilds data/pokemon.duckdb from the two above
├── data/
│   └── pokemon.duckdb        the generated database file (not committed to git)
├── exercises/
│   ├── 01_select_basics.sql        beginner: SELECT, LIMIT, DISTINCT
│   ├── 02_filtering_sorting.sql    beginner: WHERE, ORDER BY, LIKE, BETWEEN
│   ├── 03_joins.sql                intermediate: JOIN, LEFT JOIN
│   ├── 04_aggregates_grouping.sql  intermediate: COUNT/AVG/SUM, GROUP BY, HAVING
│   ├── 05_multi_table_joins.sql    intermediate: joining 3+ tables, self-joins
│   └── solutions/                  one worked answer per exercise file
└── docs/
    └── schema.md              explains every table, what it's for, and how they connect
```

## Troubleshooting

- **`duckdb: command not found`** — the install step's `PATH` change
  didn't take effect. Reopen your terminal, or re-check step 1.
- **`Parser Error: ... syntax error`** — almost always a missing
  semicolon, an unclosed quote, or a typo in a column/table name. Check
  the exact error text, which usually points at the problem.
- **A query returns 0 rows and you expected some** — double-check you're
  comparing text with single quotes, e.g. `WHERE hometown = 'Ashport'`,
  not double quotes or no quotes. Also check for typos/capitalization in
  the value you're filtering on — text comparisons are case-sensitive.
- **You changed some data and want a clean slate** — re-run
  `./db/build.sh`. It always rebuilds from scratch.
