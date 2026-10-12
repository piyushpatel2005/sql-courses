---
title: 'Exercise: use existence when you do not need child rows'
slug: exercise-test-existence
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Find registered members with no paid activity.
seo_title: 'Exercise: use existence when you do not need child rows | Data Analysis Using SQL'
seo_description: Find registered members with no paid activity.
seo_keywords:
- SQL analysis
- exercise test existence
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - member_id
  - region
  expected_rows:
  - - 6
    - West
  expected_row_count: 1
hints:
- Start from members and correlate the paid-order existence test.
---

# Exercise: use existence when you do not need child rows

Find registered members without any paid order.

Use all dates in the snapshot. A pending or cancelled order is not paid activity, and the orphan order cannot create a registered member.

## Your Task

1. Return `member_id` and `region` for members with no matching paid order, ordered by `member_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Use a member table as the population. Starting from orders cannot discover a member with no orders at all.
