---
title: 'Exercise: Commit a reporting change as one transaction'
slug: exercise-report-transactions
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Commit a reporting definition inside an explicit transaction.
seo_title: 'Exercise: Commit a reporting change as one transaction | Data Analysis Using SQL'
seo_description: Commit a reporting definition inside an explicit transaction.
seo_keywords:
  - SQL
  - PostgreSQL
  - Commit a reporting change as one transaction
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - gross
  expected_row_count: 11
  expected_rows:
    - - 101
      - 1
      - '40.00'
    - - 102
      - 2
      - '60.00'
    - - 103
      - 1
      - '40.00'
    - - 104
      - 3
      - '80.00'
    - - 106
      - 4
      - '20.00'
    - - 107
      - 1
      - '100.00'
    - - 108
      - 3
      - '80.00'
    - - 109
      - 5
      - '30.00'
    - - 110
      - 99
      - '50.00'
    - - 112
      - 2
      - '70.00'
    - - 113
      - 1
      - '10.00'
hints:
  - Place the view definition between BEGIN and COMMIT.
---

# Exercise: Commit a reporting change as one transaction

Practice publishing the paid-order view inside a committed transaction. Its row definition is unchanged from the preceding exercise.

## Your Task

1. Begin a transaction, create or replace paid_order_view with order_id, member_id, gross for paid orders, and commit. Select those columns ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
