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

## Your Task

1. Return rental_id and returned_on - borrowed_on AS days_out for all rentals, ordered by rental_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
