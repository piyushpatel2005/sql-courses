---
title: 'Exercise: Create an empty reporting table'
slug: exercise-create-report-tables
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Declare an empty reporting table with purposeful column types.
seo_title: 'Exercise: Create an empty reporting table | Data Analysis Using SQL'
seo_description: Declare an empty reporting table with purposeful column types.
seo_keywords:
  - SQL
  - PostgreSQL
  - Create an empty reporting table
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - gross
  expected_row_count: 0
  expected_rows: []
hints:
  - CREATE TABLE defines the destination but does not load source rows.
---

# Exercise: Create an empty reporting table

Create the empty destination for an order-grain report. Data will be loaded in a later lesson.

## Your Task

1. Create report_orders with order_id integer,gross numeric(10,2). Finish by selecting order_id,gross in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
