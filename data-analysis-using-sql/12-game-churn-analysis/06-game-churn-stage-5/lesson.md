---
title: 'Stage 5: reconcile eligibility and boundary cases'
slug: game-churn-stage-5
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Reconcile every observed account with its status and cohort totals.
seo_title: 'Stage 5: reconcile eligibility and boundary cases | Data Analysis Using SQL'
seo_description: Reconcile every observed account with its status and cohort totals.
seo_keywords:
- SQL
- game churn
- player activity
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - observed_accounts
  - excluded_accounts
  - eligible_players
  - inactive_players
  - retained_players
  - cohort_gap
  expected_rows:
  - - 11
    - 4
    - 7
    - 4
    - 3
    - '0'
  expected_row_count: 1
hints:
- Eligible accounts must equal inactive plus retained; excluded accounts stay separate.
---

# Stage 5: reconcile eligibility and boundary cases

Check population accounting before presenting the segment ranking. Every registration before cutoff should have exactly one status. Eligible players should equal retained plus inactive, and summing eligible counts from disjoint cohort cells should reproduce that total. The excluded population still matters: it includes recent accounts, never-players, and players outside the baseline. A zero reconciliation gap proves arithmetic agreement, not that instrumentation or business policy is correct.

Continue Lantern Trail with the same April 1, 2025 UTC exclusive cutoff, March 4–18 baseline, and March 18–April 1 follow-up. The first stage defines every field and validity rule. This lesson independently restores all earlier views; its starter includes the complete previous-stage script. Keep those definitions and add the new checkpoint after the previous final SELECT. The final SELECT is the result that Submit grades.

## Your Task

1. Create `game_reconciliation` returning one row with `observed_accounts`, `excluded_accounts`, `eligible_players`, `inactive_players`, `retained_players`, and `cohort_gap`. The gap is eligible_players minus SUM(eligible_players) from game_cohorts. Keep that column order. Use the status table as the account-level source, not the raw events.

Edit `script.sql`, Run to inspect the result, then Submit. Grading checks the complete ordered result, not whether a view was created or which equivalent SQL you used. Run and Submit reset the supplied snapshot.

Trace the edge cases too: player 3 has a play exactly at follow-up start; player 4 has a play exactly at the excluded cutoff; player 9 has an otherwise recent play arriving after the cutoff. Player 5 is new, player 6 has no valid play, and player 8 signed up at the eligibility boundary but lacks baseline activity. These cases explain why a single last-seen filter on all registrations is not this report.
