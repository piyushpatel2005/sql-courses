---
title: 'Exercise: Filter a whole calendar period'
slug: exercise-date-period-filters
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Select a month with an inclusive start and exclusive next-month boundary.
seo_title: 'Exercise: Filter a whole calendar period | Introduction to SQL'
seo_description: Select a month with an inclusive start and exclusive next-month boundary.
seo_keywords:
  - SQL
  - PostgreSQL
  - Filter a whole calendar period
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - rental_id
    - borrowed_on
  expected_row_count: 2
  expected_rows:
    - - 2
      - '2025-04-01'
    - - 3
      - '2025-04-30'
hints:
  - Filter borrowed_on; returned_on does not decide the borrowing month.
---

# Exercise: Filter a whole calendar period

An April loan report is based on borrowing date. A loan returned in May still belongs if it began in April. The ::text cast is PostgreSQL shorthand for CAST(... AS text), used only for display.

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

1. Return rental_id and borrowed_on cast to text AS borrowed_on for loans borrowed on or after April 1 and before May 1, 2025, ordered by rental_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
