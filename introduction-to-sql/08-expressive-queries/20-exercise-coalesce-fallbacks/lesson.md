---
title: 'Exercise: Display a fallback with COALESCE'
slug: exercise-coalesce-fallbacks
order: 20
language: sql
lesson_type: coding
runtime: sql
summary: Display a label for missing notes without changing the source.
seo_title: 'Exercise: Display a fallback with COALESCE | Introduction to SQL'
seo_description: Display a label for missing notes without changing the source.
seo_keywords:
  - SQL
  - PostgreSQL
  - Display a fallback with COALESCE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - display_note
  expected_row_count: 5
  expected_rows:
    - - Hand drill
      - No note
    - - Tent
      - Dry before return
    - - Saw
      - New blade
    - - Camp stove
      - No note
    - - Brush kit
      - Wash bristles
hints:
  - COALESCE reads left to right and stops at the first non-NULL argument.
---

# Exercise: Display a fallback with COALESCE

The lending display should distinguish an absent note from a blank space in the report.

## Your Task

1. Return name and COALESCE(note, 'No note') AS display_note, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
