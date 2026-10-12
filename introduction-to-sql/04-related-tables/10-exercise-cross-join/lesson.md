---
title: 'Exercise: bench and shift combinations'
slug: exercise-cross-join
order: 10
language: sql
runtime: sql
lesson_type: coding
summary: Generate every bench-and-shift combination.
seo_title: 'Exercise: bench and shift combinations | Introduction to SQL'
seo_description: Generate every bench-and-shift combination.
seo_keywords:
- SQL
- PostgreSQL
- exercise cross join
hints:
- CROSS JOIN pairs every row with every row; it does not need an ON condition.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - bench
  - shift
  expected_row_count: 6
  expected_rows:
  - - A
    - early
  - - A
    - late
  - - B
    - early
  - - B
    - late
  - - C
    - early
  - - C
    - late
---

# Exercise: bench and shift combinations

A workshop is planning every bench-and-shift combination before bookings begin. No key matching is involved: each bench can be used in each shift. Generate the combinations instead of typing out a fixed schedule.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE benches (bench text);
CREATE TABLE shifts (shift text);
INSERT INTO benches VALUES ('A'),('B'),('C');
INSERT INTO shifts VALUES ('early'),('late');
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Return every bench and shift combination as `bench, shift`, ordered alphabetically by bench and then shift.

## Result to aim for

| bench | shift |
| --- | --- |
| A | early |
| A | late |
| B | early |
| B | late |
| C | early |
| C | late |
