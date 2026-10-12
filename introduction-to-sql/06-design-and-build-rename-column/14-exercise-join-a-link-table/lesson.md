---
title: 'Exercise: Report a many-to-many relationship'
slug: exercise-join-a-link-table
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Follow a link table to display both sides of a relationship.
seo_title: 'Exercise: Report a many-to-many relationship | Introduction to SQL'
seo_description: Follow a link table to display both sides of a relationship.
seo_keywords:
  - SQL
  - PostgreSQL
  - Report a many-to-many relationship
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - title
  expected_row_count: 3
  expected_rows:
    - - Ada
      - Weaving
    - - Ada
      - Repair
    - - Ravi
      - Repair
hints:
  - Use one ON condition for each hop through enrollments.
---

# Exercise: Report a many-to-many relationship

The workshop keeps participants, sessions and enrollments separately. Assemble the attendance list from that link table.

## Your Task

1. Return participant name and session title by joining participants, enrollments and sessions. Order by participant_id then session_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
