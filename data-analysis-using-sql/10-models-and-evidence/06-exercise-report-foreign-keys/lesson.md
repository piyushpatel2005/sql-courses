---
title: 'Exercise: Protect a reporting relationship with REFERENCES'
slug: exercise-report-foreign-keys
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Require known reporting relationships to match their parent key.
seo_title: 'Exercise: Protect a reporting relationship with REFERENCES | Data Analysis Using SQL'
seo_description: Require known reporting relationships to match their parent key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Protect a reporting relationship with REFERENCES
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
  expected_row_count: 0
  expected_rows: []
hints:
  - REFERENCES protects a relationship; it does not populate or join the table.
---

# Exercise: Protect a reporting relationship with REFERENCES

The members table is the supplied parent. An order row should reference a known member when its member_id is present.

## Your Task

1. Create report_orders(order_id integer PRIMARY KEY,member_id integer REFERENCES members(member_id)). Select order_id, member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
