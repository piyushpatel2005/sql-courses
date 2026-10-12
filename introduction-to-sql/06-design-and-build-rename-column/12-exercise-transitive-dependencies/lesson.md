---
title: 'Exercise: Separate indirectly dependent facts'
slug: exercise-transitive-dependencies
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Keep room details separate from workshops that use the room.
seo_title: 'Exercise: Separate indirectly dependent facts | Introduction to SQL'
seo_description: Keep room details separate from workshops that use the room.
seo_keywords:
  - SQL
  - PostgreSQL
  - Separate indirectly dependent facts
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - title
    - building
  expected_row_count: 2
  expected_rows:
    - - Repair
      - North hall
    - - Printing
      - North hall
hints:
  - The room identifier connects a workshop to the building description.
---

# Exercise: Separate indirectly dependent facts

Several workshops use the same room. Read each room's building through its key so a building correction needs only one stored change.

## Your Task

1. Return title and building by joining workshops to rooms on room_id, ordered by workshop_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
