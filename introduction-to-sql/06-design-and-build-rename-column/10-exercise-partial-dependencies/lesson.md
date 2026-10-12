---
title: 'Exercise: Separate facts that depend on part of a key'
slug: exercise-partial-dependencies
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Store a person's description separately from their repeated assignments.
seo_title: 'Exercise: Separate facts that depend on part of a key | Introduction to SQL'
seo_description: Store a person's description separately from their repeated assignments.
seo_keywords:
  - SQL
  - PostgreSQL
  - Separate facts that depend on part of a key
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - shift
  expected_row_count: 3
  expected_rows:
    - - Inez
      - early
    - - Inez
      - late
    - - Jules
      - late
hints:
  - Join the descriptive person row to each matching duty.
---

# Exercise: Separate facts that depend on part of a key

A person can work several shifts, but their name is stored once. Join that name onto the duties rather than copying it into every assignment.

## Your Task

1. Return name and shift by joining people to duties on person_id; order by person_id then shift.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
