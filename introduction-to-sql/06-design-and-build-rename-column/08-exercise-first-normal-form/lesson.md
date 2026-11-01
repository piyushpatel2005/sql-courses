---
title: 'Exercise: Avoid repeating groups in first normal form'
slug: exercise-first-normal-form
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Represent each choice as a row instead of a repeating list.
seo_title: 'Exercise: Avoid repeating groups in first normal form | Introduction to SQL'
seo_description: Represent each choice as a row instead of a repeating list.
seo_keywords:
  - SQL
  - PostgreSQL
  - Avoid repeating groups in first normal form
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - person
    - item
  expected_row_count: 3
  expected_rows:
    - - Inez
      - Drill
    - - Inez
      - Saw
    - - Jules
      - Saw
hints:
  - Keep one person-item combination per result row.
---

# Exercise: Avoid repeating groups in first normal form

The equipment list stores one choice per row instead of numbered item columns. Read those rows as a person-item list; selecting them does not change the design.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `equipment_choices`

One row represents one person-item choice.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `person` · `text` | Person name used as an illustrative label. | Nullable; `NULL` means no person value is recorded. |
| `item` · `text` | Name of one chosen equipment item, not a list of items. | Nullable; `NULL` means no item value is recorded. |

These text labels are not identity constraints. No primary key or foreign key prevents duplicate choice rows.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

## Your Task

1. Return person and item from the one-choice-per-row equipment_choices table, ordered by person then item.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
