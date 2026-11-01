---
title: 'Exercise: Read a subquery as a table'
slug: exercise-derived-tables
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Query a grouped result as an intermediate table.
seo_title: 'Exercise: Read a subquery as a table | Introduction to SQL'
seo_description: Query a grouped result as an intermediate table.
seo_keywords:
  - SQL
  - PostgreSQL
  - Read a subquery as a table
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - category
    - total_fee
  expected_row_count: 2
  expected_rows:
    - - outdoors
      - '18.00'
    - - repair
      - '10.00'
hints:
  - Alias the parenthesized FROM query so its totals become outer columns.
---

# Exercise: Read a subquery as a table

Separate the catalog category totals from the rule that selects sufficiently large totals.

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

### Named query result

#### `totals`

One row represents one category group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `category` · `text` | Grouping label from `gear.category`. | Logical group key, not a physical primary key. Required in the base table. |
| `total_fee` · `numeric` | Sum of `gear.fee` in this group, in daily borrowing currency units. | Computed value; no fixed precision or scale. Each nonempty group has required fee inputs, so its total is known. |

This FROM-subquery alias exists only within the statement. Grouping yields one row per label, including at most one NULL-label group where allowed; it creates no stored table, key or foreign key.

## Your Task

1. Use a FROM subquery to compute category and SUM(fee) AS total_fee. Return categories with total_fee >= 10, ordered by category.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
