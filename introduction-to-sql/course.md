---
slug: introduction-to-sql
title: Introduction to SQL
description: Learn SQL through runnable examples, focused exercises, and staged database projects.
language: sql
level: beginner
format: interactive
summary: Read, model, and safely change relational data with PostgreSQL queries.
seo_title: Introduction to SQL
seo_description: A practical beginner SQL course with SELECT, joins, schema design, transactions, and staged projects.
seo_keywords:
- SQL
- PostgreSQL
- relational databases
modules:
- slug: first-queries
  title: Read a table and ask a question
  sort_order: 1
- slug: careful-filters
  title: Handle missing values and choose result rows
  sort_order: 2
- slug: summaries
  title: Summarize rows without losing their meaning
  sort_order: 3
- slug: related-tables
  title: Combine tables and reason about row counts
  sort_order: 4
- slug: design-and-build
  title: Define tables and protect their rows
  sort_order: 5
- slug: design-and-build-rename-column
  title: Evolve a schema and build the workshop register
  sort_order: 6
- slug: safe-changes
  title: Change data safely and complete an allocation project
  sort_order: 7
- slug: expressive-queries
  title: Compose queries and choose result values
  sort_order: 8
- slug: expressive-queries-text-math
  title: Transform text and numbers
  sort_order: 9
- slug: expressive-queries-dates
  title: Calculate and filter calendar dates
  sort_order: 10
- slug: reusable-queries
  title: Reuse queries and prepare for larger databases
  sort_order: 11
---

# Introduction to SQL

Learn to read, design, and change relational data. No programming or database experience is required. You will query a lending desk's gear catalog, connect workshop records, and build two staged projects: a normalized workshop register and a transactional supply-allocation workflow.

## How to work through the course

Run each worked example, read its output, then use the following coding exercise to solve a different problem. Edit `script.sql`, choose Run to inspect the result, and Submit to compare it with the requested output. The examples use PostgreSQL syntax. Notes point out a few places where another database may differ.

Every coding attempt starts from its own supplied tables. Project stages restore the completed earlier stages in their setup; you do not need to keep a database alive between lessons. The output panel shows the final SQL statement, so change statements are usually followed by a SELECT that makes their effect visible.

Submit compares result columns, row counts, and values where those expectations are supplied. It cannot prove that a schema constraint exists, that a transaction was used, or that one particular query technique produced the result. Write the requested technique and review your SQL, especially in table-design and transaction lessons. Passing output is a checkpoint, not a substitute for reasoning about the database.

## What you will build toward

Start with SELECT, expressions, filters, and stable ordering. Summaries and joins lead into keys, constraints, normalization, and the workshop-register project. Then practice inserts, targeted changes, transactions, and savepoints in the supply-allocation project. The final sections introduce subqueries, value transformations, views, indexes, query plans, common table expressions, and window functions.

Each section ends with a quiz. The final readings separate application security, privileges and database recovery from the SQL you can honestly practice here. Backups, concurrent-session testing, roles, and production operations need a separate server environment.
