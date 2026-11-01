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

## Data model

### Exercise data

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `report_orders`

One row represents one stored order-report row.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identifier; key enforcement depends on this lesson's declaration. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `gross` · `numeric(10,2)` | Whole-order gross USD before refunds, copied from orders.amount when loaded. | Nullable; `NULL` means the gross measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

A report table stores rows; creating it does not load them. This target is independent of the unconstrained source orders.member_id logical link.

Create the empty destination for an order-grain report. Data will be loaded in a later lesson.

## Your Task

1. Create report_orders with order_id integer,gross numeric(10,2). Finish by selecting order_id,gross in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
