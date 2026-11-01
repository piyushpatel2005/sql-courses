---
title: 'Exercise: Read a date component with EXTRACT'
slug: exercise-extract-calendar-parts
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Read the year and month components of a period key.
seo_title: 'Exercise: Read a date component with EXTRACT | Data Analysis Using SQL'
seo_description: Read the year and month components of a period key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Read a date component with EXTRACT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - period_id
    - year
    - month_number
  expected_row_count: 2
  expected_rows:
    - - 1
      - '2024'
      - '11'
    - - 2
      - '2025'
      - '1'
hints:
  - EXTRACT names the component before FROM and the date afterward.
---

# Exercise: Read a date component with EXTRACT

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

Expose each period key for a reporting check without merging years.

## Your Task

1. Return period_id, EXTRACT(YEAR FROM starts_on) AS year and EXTRACT(MONTH FROM starts_on) AS month_number, ordered by period_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
