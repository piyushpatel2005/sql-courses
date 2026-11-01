---
title: 'Exercise: Supply an omitted value with DEFAULT'
slug: exercise-column-defaults
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Choose the value used when an insert omits a column.
seo_title: 'Exercise: Supply an omitted value with DEFAULT | Introduction to SQL'
seo_description: Choose the value used when an insert omits a column.
seo_keywords:
  - SQL
  - PostgreSQL
  - Supply an omitted value with DEFAULT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - locker_id
    - slots
  expected_row_count: 0
  expected_rows: []
hints:
  - DEFAULT applies to an omitted value, not an explicitly supplied NULL.
---

# Exercise: Supply an omitted value with DEFAULT

Most new lockers have one slot. Define that as the value for an omitted capacity while retaining the positive-capacity rule.

## Data model

### Exercise data

This exercise starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `lockers`

One row represents one locker.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `locker_id` · `integer` | Identifier of the locker. | Primary key. Required; cannot be `NULL`. |
| `slots` · `integer` | Whole-number count of storage slots in the locker. | Required; cannot be `NULL`. Default `1` when omitted. Check: `slots > 0`. |

## Your Task

1. Create lockers with locker_id integer PRIMARY KEY and slots integer NOT NULL DEFAULT 1 CHECK (slots > 0). Finish by selecting locker_id, slots in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
