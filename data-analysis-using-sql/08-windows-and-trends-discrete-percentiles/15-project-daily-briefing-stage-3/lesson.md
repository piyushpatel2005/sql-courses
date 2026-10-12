---
title: 'Daily briefing 3: changes with honest baselines'
slug: project-daily-briefing-stage-3
order: 15
language: sql
runtime: sql
lesson_type: coding
summary: Finish the briefing by adding a daily change column without pretending the first day has a known previous-day baseline.
seo_title: 'Daily briefing 3: changes with honest baselines | Data Analysis Using SQL'
seo_description: Finish the briefing by adding a daily change column without pretending the first day has a known previous-day baseline.
seo_keywords:
- SQL analysis
- project daily briefing stage 3
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - day
  - gross
  - running_gross
  - trailing_three_days
  - change_amount
  - change_pct
  expected_rows:
  - - '2025-03-01'
    - '100.00'
    - '100.00'
    - '100.00'
    - null
    - null
  - - '2025-03-02'
    - '110.00'
    - '210.00'
    - '210.00'
    - '10.00'
    - '10.00'
  - - '2025-03-03'
    - '50.00'
    - '260.00'
    - '260.00'
    - '-60.00'
    - '-54.55'
  - - '2025-03-04'
    - '0'
    - '260.00'
    - '160.00'
    - '-50.00'
    - '-100.00'
  - - '2025-03-05'
    - '10.00'
    - '270.00'
    - '60.00'
    - '10.00'
    - null
  expected_row_count: 5
hints:
- Use a CTE to name LAG(gross), then divide the difference by NULLIF(previous_gross,0).
---

# Daily briefing 3: changes with honest baselines

Finish the briefing by adding a daily change column without pretending the first day has a known previous-day baseline.

## Project continuity

This is stage 3 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Daily briefing 1–2; LAG, CTEs, NULLIF and numeric rates.

Calculate previous gross from the complete daily view. A missing prior day produces null change. A zero prior day also produces an undefined percentage change, even when the absolute difference is known.

## Your Task

1. Return `day` as ISO text, `gross`, `running_gross`, `trailing_three_days`, `change_amount`, and two-decimal `change_pct`, using the previous calendar day as baseline; order by day.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The briefing is complete. Describe the partial first windows and the undefined zero-baseline percentage when sharing it. Do not interpret a missing percentage as no change.
