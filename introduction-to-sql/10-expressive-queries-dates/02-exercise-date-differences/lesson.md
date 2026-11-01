---
title: 'Exercise: Calculate calendar days between dates'
slug: exercise-date-differences
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Calculate the number of calendar days between two dates.
seo_title: 'Exercise: Calculate calendar days between dates | Introduction to SQL'
seo_description: Calculate the number of calendar days between two dates.
seo_keywords:
  - SQL
  - PostgreSQL
  - Calculate calendar days between dates
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - rental_id
    - days_out
  expected_row_count: 4
  expected_rows:
    - - 1
      - 2
    - - 2
      - 3
    - - 3
      - 2
    - - 4
      - 5
hints:
  - Subtract the borrowing date from the return date, not the other way around.
---

# Exercise: Calculate calendar days between dates

The desk wants the length of every recorded loan, including loans that cross a month boundary.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `rentals`

One row represents one borrowing record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `rental_id` · `integer` | Identifier of the rental. | Primary key. Required; cannot be `NULL`. |
| `borrowed_on` · `date` | Borrowing calendar date; no time of day or time zone. | Nullable; `NULL` means no borrowed on value is recorded. |
| `returned_on` · `date` | Return calendar date; no time of day or time zone. | Nullable; `NULL` means no returned on value is recorded. |

These rows do not reference the earlier gear table. A missing return date means no return date is recorded, not a zero-length rental or an automatic count through today. No date-order check is declared.

## Your Task

1. Return rental_id and returned_on - borrowed_on AS days_out for all rentals, ordered by rental_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
