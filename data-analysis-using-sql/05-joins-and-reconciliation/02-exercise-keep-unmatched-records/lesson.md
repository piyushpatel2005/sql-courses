---
title: 'Exercise: make unmatched records visible'
slug: exercise-keep-unmatched-records
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Attach region labels without losing paid orders whose member is missing.
seo_title: 'Exercise: make unmatched records visible | Data Analysis Using SQL'
seo_description: Attach region labels without losing paid orders whose member is missing.
seo_keywords:
- SQL analysis
- exercise keep unmatched records
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - member_id
  - region
  expected_rows:
  - - 101
    - 1
    - North
  - - 102
    - 2
    - South
  - - 103
    - 1
    - North
  - - 104
    - 3
    - North
  - - 106
    - 4
    - West
  - - 107
    - 1
    - North
  - - 108
    - 3
    - North
  - - 109
    - 5
    - South
  - - 110
    - 99
    - unmatched
  - - 112
    - 2
    - South
  - - 113
    - 1
    - North
  expected_row_count: 11
hints:
- Keep orders on the left and filter their status, not the optional member row.
---

# Exercise: make unmatched records visible

Attach region labels to paid orders while retaining missing members.

Use all paid orders. Member 99 is absent from `members`, but the paid order still belongs in this source report.

## Your Task

1. Return `order_id`, `member_id` from orders, and `region` with missing matches labeled `unmatched`; order by `order_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Check that the unmatched paid order remains. An inner join would change the paid-order population.
