---
title: 'Exercise: Name a result column with AS'
slug: exercise-column-aliases
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Give a result column a useful heading with AS.
seo_title: 'Exercise: Name a result column with AS | Introduction to SQL'
seo_description: Give a result column a useful heading with AS.
seo_keywords:
- SQL
- PostgreSQL
- Name a result column with AS
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - daily_fee
  expected_row_count: 5
  expected_rows:
  - - Hand drill
    - '4.00'
  - - Tent
    - '12.00'
  - - Saw
    - '6.00'
  - - Camp stove
    - '6.00'
  - - Brush kit
    - '3.00'
hints:
- Place AS and the new heading immediately after the selected source column.
---

# Exercise: Name a result column with AS

The lending desk wants its daily fee labeled clearly on a price sheet. Leave every stored value alone.

## Your Task

1. Return name and fee AS daily_fee from gear, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
