---
title: 'Exercise: Test decimal text with a regular expression'
slug: exercise-validate-before-casting
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Check whether fee text follows a stated decimal policy.
seo_title: 'Exercise: Test decimal text with a regular expression | Data Analysis Using SQL'
seo_description: Check whether fee text follows a stated decimal policy.
seo_keywords:
  - SQL
  - PostgreSQL
  - Test decimal text with a regular expression
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - approved
  expected_row_count: 6
  expected_rows:
    - - 1
      - true
    - - 2
      - false
    - - 3
      - true
    - - 4
      - false
    - - 5
      - true
    - - 6
      - true
hints:
  - Anchor the whole trimmed string; a numeric-looking fragment is not enough.
---

# Exercise: Test decimal text with a regular expression

The intake desk needs to see which fee strings satisfy its nonnegative-decimal policy before trying to convert them.

## Your Task

1. Return import_id and approved, the boolean result of the taught regular-expression check on TRIM(fee_text). Keep all rows, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
