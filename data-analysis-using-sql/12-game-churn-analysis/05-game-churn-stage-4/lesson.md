---
title: 'Stage 4: compare cohort and channel denominators'
slug: game-churn-stage-4
order: 5
language: sql
runtime: sql
lesson_type: coding
summary: Compare inactivity within eligible signup-month and channel groups.
seo_title: 'Stage 4: compare cohort and channel denominators | Data Analysis Using SQL'
seo_description: Compare inactivity within eligible signup-month and channel groups.
seo_keywords:
- SQL
- game churn
- player activity
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - signup_month
  - channel
  - eligible_players
  - inactive_players
  - retained_players
  - inactivity_pct
  expected_rows:
  - - '2025-01-01'
    - organic
    - 2
    - 1
    - 1
    - '50.00'
  - - '2025-02-01'
    - invite
    - 1
    - 0
    - 1
    - '0.00'
  - - '2025-02-01'
    - organic
    - 2
    - 2
    - 0
    - '100.00'
  - - '2025-03-01'
    - invite
    - 1
    - 0
    - 1
    - '0.00'
  - - '2025-03-01'
    - unknown
    - 1
    - 1
    - 0
    - '100.00'
  expected_row_count: 5
hints:
- Each cell needs its own eligible-player denominator, not all registrations.
---

# Stage 4: compare cohort and channel denominators

The team wants to know where the observed losses occur. Group eligible accounts by signup month and acquisition channel, preserving unknown channel as its own labeled bucket. The denominator is eligible accounts in that same cell, not all signups in the month and not event rows. These cohorts differ in account age; they are not an age-standardized comparison. A cell with one player can show 100% without supporting a broad conclusion. Always publish counts beside percentages.

Continue Lantern Trail with the same April 1, 2025 UTC exclusive cutoff, March 4–18 baseline, and March 18–April 1 follow-up. The first stage defines every field and validity rule. This lesson independently restores all earlier views; its starter includes the complete previous-stage script. Keep those definitions and add the new checkpoint after the previous final SELECT. The final SELECT is the result that Submit grades.

## Your Task

1. Create `game_cohorts` at signup-month/channel grain for inactive and retained accounts only. Use COALESCE(channel, 'unknown'). Return `signup_month` formatted as YYYY-MM-DD text (cast the date to text in the final SELECT), `channel`, `eligible_players`, `inactive_players`, `retained_players`, and `inactivity_pct` rounded to two decimals. Order by signup_month, then channel. The percentage is 100.0 times inactive divided by eligible, guarded with NULLIF.

Edit `script.sql`, Run to inspect the result, then Submit. Grading checks the complete ordered result, not whether a view was created or which equivalent SQL you used. Run and Submit reset the supplied snapshot.
