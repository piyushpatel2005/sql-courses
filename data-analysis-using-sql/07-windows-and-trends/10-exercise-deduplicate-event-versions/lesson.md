---
title: 'Exercise: Retain one source version per event'
slug: exercise-deduplicate-event-versions
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Keep the latest received version of each logical event.
seo_title: 'Exercise: Retain one source version per event | Data Analysis Using SQL'
seo_description: Keep the latest received version of each logical event.
seo_keywords:
  - SQL
  - PostgreSQL
  - Retain one source version per event
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - event_id
    - ingest_id
    - member_id
    - kind
  expected_row_count: 16
  expected_rows:
    - - e1
      - 1
      - 1
      - visit
    - - e10
      - 11
      - 4
      - visit
    - - e11
      - 12
      - 4
      - book
    - - e12
      - 13
      - 4
      - pay
    - - e13
      - 14
      - 5
      - visit
    - - e14
      - 15
      - 5
      - book
    - - e15
      - 16
      - 5
      - pay
    - - e16
      - 17
      - 6
      - visit
    - - e2
      - 2
      - 1
      - book
    - - e3
      - 4
      - 1
      - pay
    - - e4
      - 5
      - 2
      - pay
    - - e5
      - 6
      - 2
      - visit
    - - e6
      - 7
      - 2
      - book
    - - e7
      - 8
      - 3
      - visit
    - - e8
      - 9
      - 3
      - book
    - - e9
      - 10
      - 3
      - pay
hints:
  - Partition by event_id and sort receipt time and ingest_id descending.
---

# Exercise: Retain one source version per event

The event feed contains retries. Retain the latest received version per event_id, using highest ingest_id for an arrival-time tie.

## Your Task

1. Return event_id, ingest_id, member_id, kind for retained events, ordered lexically by event_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
