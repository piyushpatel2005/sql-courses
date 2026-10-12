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

## Your Task

1. Return rental_id and borrowed_on cast to text AS borrowed_on for loans borrowed on or after April 1 and before May 1, 2025, ordered by rental_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
