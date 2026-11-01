---
title: 'Exercise: Use a subquery as an IN list'
slug: exercise-subquery-lists
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Select categories through a one-column subquery.
seo_title: 'Exercise: Use a subquery as an IN list | Introduction to SQL'
seo_description: Select categories through a one-column subquery.
seo_keywords:
  - SQL
  - PostgreSQL
  - Use a subquery as an IN list
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - category
  expected_row_count: 2
  expected_rows:
    - - Tent
      - outdoors
    - - Camp stove
      - outdoors
hints:
  - Filter the inner fees; the outer query selects every item in the qualifying categories.
---

# Exercise: Use a subquery as an IN list

The desk wants all gear in any category that contains an item costing at least ten units.

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

1. Return name and category where category occurs in a subquery selecting categories with fee >= 10; order by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
