---
title: 'Daily briefing 2: cumulative and trailing totals'
slug: project-daily-briefing-stage-2
order: 14
language: sql
runtime: sql
lesson_type: coding
summary: Extend the daily layer with two trend measures that answer different operations questions.
seo_title: 'Daily briefing 2: cumulative and trailing totals | Data Analysis Using SQL'
seo_description: Extend the daily layer with two trend measures that answer different operations questions.
seo_keywords:
- SQL analysis
- project daily briefing stage 2
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - day
  - gross
  - running_gross
  - trailing_three_days
  expected_rows:
  - - '2025-03-01'
    - '100.00'
    - '100.00'
    - '100.00'
  - - '2025-03-02'
    - '110.00'
    - '210.00'
    - '210.00'
  - - '2025-03-03'
    - '50.00'
    - '260.00'
    - '260.00'
  - - '2025-03-04'
    - '0'
    - '260.00'
    - '160.00'
  - - '2025-03-05'
    - '10.00'
    - '270.00'
    - '60.00'
  expected_row_count: 5
hints:
- The complete daily input makes 2 PRECEDING equivalent to the prior two calendar days.
---

# Daily briefing 2: cumulative and trailing totals

Extend the daily layer with two trend measures that answer different operations questions.

## Project continuity

This is stage 2 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Daily briefing 1; running and rolling ROWS frames.

Running gross measures the total since the report start. Trailing-three-day gross measures only the current and two preceding calendar rows. The first two trailing windows are partial because the report starts March 1.

## Your Task

1. Create or replace `march_trend` with `day`, `gross`, `running_gross`, and `trailing_three_days`; return all columns with day as ISO text, ordered by day.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

A manager can use running gross to track the five-day total and trailing gross to inspect recent activity. Neither measure by itself explains why orders changed.
