---
title: 'Exercise: Advance a calendar boundary with INTERVAL'
slug: exercise-calendar-intervals
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Find the next calendar-month boundary without assuming thirty days.
seo_title: 'Exercise: Advance a calendar boundary with INTERVAL | Data Analysis Using SQL'
seo_description: Find the next calendar-month boundary without assuming thirty days.
seo_keywords:
  - SQL
  - PostgreSQL
  - Advance a calendar boundary with INTERVAL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - period_id
    - ends_on
  expected_row_count: 2
  expected_rows:
    - - 1
      - '2024-12-01'
    - - 2
      - '2025-02-01'
hints:
  - Add INTERVAL '1 month' to the first-of-month date.
---

# Exercise: Advance a calendar boundary with INTERVAL

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `report_periods`

One row represents one supplied reporting month.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `period_id` · `integer` | Period record identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `starts_on` · `date` | Inclusive first-of-month calendar date; a calendar-month interval gives the next boundary. | Nullable; `NULL` means the calendar date is unrecorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

First-of-month values are a fixture convention, not an enforced CHECK.

Build the exclusive end date for each supplied reporting month. `report_periods` is a separate two-row exercise fixture, not the repair-order snapshot: one row is one reporting month, with integer identifier `period_id` and date `starts_on`. Both starts are first-of-month dates; no primary-key constraint is declared in this small fixture.

## Your Task

1. Return period_id and starts_on + INTERVAL '1 month' cast through date to text AS ends_on, ordered by period_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
