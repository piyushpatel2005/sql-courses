---
title: 'Exercise: Count rows and known values with COUNT'
slug: exercise-count-values
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Distinguish the number of rows from the number of known notes.
seo_title: 'Exercise: Count rows and known values with COUNT | Introduction to SQL'
seo_description: Distinguish the number of rows from the number of known notes.
seo_keywords:
- SQL
- PostgreSQL
- Count rows and known values with COUNT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - item_count
  - recorded_notes
  expected_row_count: 1
  expected_rows:
  - - 5
    - 3
hints:
- COUNT(*) includes every row; COUNT(note) skips missing notes.
---

# Exercise: Count rows and known values with COUNT

Before adding up fees, count the catalog entries and how many have a recorded note. A missing note must not make the item disappear from the catalog count.

## Your Task

1. Return COUNT(*) AS item_count and COUNT(note) AS recorded_notes for all gear.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
