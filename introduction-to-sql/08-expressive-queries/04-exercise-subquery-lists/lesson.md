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

## Your Task

1. Return name and category where category occurs in a subquery selecting categories with fee >= 10; order by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
