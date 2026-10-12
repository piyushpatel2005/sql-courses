---
title: 'Stage 6: prioritize investigation with honest evidence'
slug: game-churn-stage-6
order: 7
language: sql
runtime: sql
lesson_type: coding
summary: Rank a channel investigation queue while displaying counts and evidence limits.
seo_title: 'Stage 6: prioritize investigation with honest evidence | Data Analysis Using SQL'
seo_description: Rank a channel investigation queue while displaying counts and evidence limits.
seo_keywords:
- SQL
- game churn
- player activity
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - priority
  - channel
  - eligible_players
  - inactive_players
  - inactivity_pct
  - evidence_flag
  - cohort_gap
  expected_rows:
  - - 1
    - organic
    - '4'
    - '3'
    - '75.00'
    - review
    - '0'
  - - 2
    - unknown
    - '1'
    - '1'
    - '100.00'
    - small_sample
    - '0'
  - - 3
    - invite
    - '2'
    - '0'
    - '0.00'
    - small_sample
    - '0'
  expected_row_count: 3
hints:
- Sum cohort numerators and denominators before recomputing a channel rate.
---

# Stage 6: prioritize investigation with honest evidence

A 100% rate in a one-player unknown-channel cell should not automatically outrank three inactive players elsewhere. Combine cohort counts by channel, then rank by inactive count descending, inactivity rate descending, and channel ascending for deterministic ties. Recompute the channel percentage from summed counts rather than averaging cell percentages. Label fewer than three eligible accounts `small_sample`; label other cells `review`. These are investigation labels, not intervention recommendations or estimates of players you can recover.

Continue Lantern Trail with the same April 1, 2025 UTC exclusive cutoff, March 4–18 baseline, and March 18–April 1 follow-up. The first stage defines every field and validity rule. This lesson independently restores all earlier views; its starter includes the complete previous-stage script. Keep those definitions and add the new checkpoint after the previous final SELECT. The final SELECT is the result that Submit grades.

## Your Task

1. Return `priority`, `channel`, `eligible_players`, `inactive_players`, `inactivity_pct`, `evidence_flag`, and `cohort_gap` for every eligible channel. Use ROW_NUMBER with the ranking policy above, recompute the percentage to two decimals, and attach the verified scalar cohort_gap. Order by priority. Append this final evidence query after the carried-forward report definitions.

Edit `script.sql`, Run to inspect the result, then Submit. Grading checks the complete ordered result, not whether a view was created or which equivalent SQL you used. Run and Submit reset the supplied snapshot.

## Write the finding

The largest inactive count belongs to organic acquisition in this small snapshot. Report its numerator and denominator from your table, together with the baseline, cutoff, and exclusion rules. Unknown-channel evidence needs identity and attribution checks, not a confident campaign recommendation. First verify event completeness, then inspect gameplay histories and ask a focused follow-up question. Differences between channels may reflect age, player intent, or selection; this report establishes no causal effect of acquisition source. It also says nothing about contractual churn, lifetime loss, or the impact of an untested retention campaign. A later return would change a later snapshot without making this historical one incorrect.
