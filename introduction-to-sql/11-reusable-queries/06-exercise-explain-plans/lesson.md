---
title: 'Exercise: Read a query plan with EXPLAIN'
slug: exercise-explain-plans
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Inspect the proposed operations for a query.
seo_title: 'Exercise: Read a query plan with EXPLAIN | Introduction to SQL'
seo_description: Inspect the proposed operations for a query.
seo_keywords:
  - SQL
  - PostgreSQL
  - Read a query plan with EXPLAIN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - QUERY PLAN
  expected_row_count: 2
  expected_rows:
    - - Seq Scan on gear
    - - '  Filter: (category = ''repair''::text)'
hints:
  - Put EXPLAIN (COSTS OFF) before the SELECT and leave it as the final statement.
---

# Exercise: Read a query plan with EXPLAIN

Inspect how the database proposes to find repair gear. The expected plan belongs to this tiny fixed table, not a production speed guarantee.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `gear`

One row represents one equipment catalog entry.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `gear_id` · `integer` | Identifier of the equipment entry. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Equipment display name. | Required; cannot be `NULL`. |
| `category` · `text` | Equipment grouping, such as repair, outdoors or art. | Required; cannot be `NULL`. |
| `fee` · `numeric(6,2)` | Daily borrowing charge in currency units, stored to two decimal places. | Required; cannot be `NULL`. |
| `available` · `boolean` | Whether the equipment is available to borrow: true or false. | Required; cannot be `NULL`. |
| `note` · `text` | Optional handling note. | Nullable; `NULL` means no note is recorded. |

Only `note` may be missing. Category labels are sample values, not an enforced vocabulary. No currency code or nonnegative-fee constraint is declared; a fee is a daily charge, not a count of items.

## Your Task

1. Run EXPLAIN (COSTS OFF) on SELECT name FROM gear WHERE category = 'repair'. Leave EXPLAIN as the final statement.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
