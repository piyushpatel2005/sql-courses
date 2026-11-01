---
title: 'Exercise: Identify a row with PRIMARY KEY'
slug: exercise-primary-keys
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Give each stored row a unique, required identifier.
seo_title: 'Exercise: Identify a row with PRIMARY KEY | Introduction to SQL'
seo_description: Give each stored row a unique, required identifier.
seo_keywords:
  - SQL
  - PostgreSQL
  - Identify a row with PRIMARY KEY
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - locker_id
    - label
  expected_row_count: 0
  expected_rows: []
hints:
  - PRIMARY KEY supplies both uniqueness and non-NULL identity.
---

# Exercise: Identify a row with PRIMARY KEY

Give every locker a required, unique identifier. The table starts empty, so matching the displayed headings will not by itself prove that the key was declared.

## Data model

### Exercise data

This exercise starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `lockers`

One row represents one locker.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `locker_id` · `integer` | Identifier of the locker. | Primary key. Required; cannot be `NULL`. |
| `label` · `text` | Readable locker label. | Nullable; `NULL` means no label value is recorded. |

## Your Task

1. Create lockers with locker_id integer PRIMARY KEY and label text. Finish by selecting locker_id, label in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
