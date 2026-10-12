---
title: 'Daily briefing 1: a complete daily layer'
slug: project-daily-briefing-stage-1
order: 13
language: sql
runtime: sql
lesson_type: coding
summary: Prepare a five-day operations briefing that will not mistake a gap in the calendar for a shorter trend window.
seo_title: 'Daily briefing 1: a complete daily layer | Data Analysis Using SQL'
seo_description: Prepare a five-day operations briefing that will not mistake a gap in the calendar for a shorter trend window.
seo_keywords:
- SQL analysis
- project daily briefing stage 1
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - day
  - gross
  expected_rows:
  - - '2025-03-01'
    - '100.00'
  - - '2025-03-02'
    - '110.00'
  - - '2025-03-03'
    - '50.00'
  - - '2025-03-04'
    - '0'
  - - '2025-03-05'
    - '10.00'
  expected_row_count: 5
hints:
- Aggregate the orders first; join them onto the five-date calendar.
---

# Daily briefing 1: a complete daily layer

Prepare a five-day operations briefing that will not mistake a gap in the calendar for a shorter trend window.

## Project continuity

This starts a new report. The seed contains the source snapshot only.

Prerequisites: time-zone conversion, date spine, preaggregation, left joins and views.

Use March 1–5, 2025 in UTC. The feed is complete, so days without paid orders are valid zeros. Preserve day as a date in the view; convert it to text only in the final displayed result.

## Your Task

1. Create or replace `march_daily` with date `day` and paid `gross` for every day from March 1 through March 5. Return `day` as ISO text and `gross`, ordered by day.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

This daily layer is the common input to both the running and rolling calculations in the next stage.
