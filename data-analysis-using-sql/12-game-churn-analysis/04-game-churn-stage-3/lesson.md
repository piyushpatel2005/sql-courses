---
title: 'Stage 3: classify inactivity without losing exclusions'
slug: game-churn-stage-3
order: 4
language: sql
runtime: sql
lesson_type: coding
summary: Distinguish incomplete observation, no activation and baseline inactivity.
seo_title: 'Stage 3: classify inactivity without losing exclusions | Data Analysis Using SQL'
seo_description: Distinguish incomplete observation, no activation and baseline inactivity.
seo_keywords:
- SQL
- game churn
- player activity
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - player_id
  - activity_status
  expected_rows:
  - - 1
    - retained
  - - 2
    - inactive
  - - 3
    - retained
  - - 4
    - inactive
  - - 5
    - new_unobserved
  - - 6
    - never_played
  - - 7
    - outside_baseline
  - - 8
    - outside_baseline
  - - 9
    - inactive
  - - 10
    - retained
  - - 11
    - inactive
  expected_row_count: 11
hints:
- Apply the new-account and never-played exclusions before the inactivity rule.
---

# Stage 3: classify inactivity without losing exclusions

Create a status for every observed account before calculating a rate. Apply the exclusion rules first: a recent signup is `new_unobserved`; a mature account with no valid history is `never_played`; a mature player with history but no baseline play is `outside_baseline`. Only then split the eligible population into `inactive` and `retained`. This order keeps account age, activation failure, and the requested baseline transition separate. A last play just before March 18 is inactive without a later play, while a play exactly at March 18 belongs to follow-up.

Continue Lantern Trail with the same April 1, 2025 UTC exclusive cutoff, March 4–18 baseline, and March 18–April 1 follow-up. The first stage defines every field and validity rule. This lesson independently restores all earlier views; its starter includes the complete previous-stage script. Keep those definitions and add the new checkpoint after the previous final SELECT. The final SELECT is the result that Submit grades.

## Your Task

1. Create `game_status` retaining all history columns and adding `activity_status` with the five labels and precedence described above. For eligible players, recent_plays = 0 means inactive; otherwise retained. Return `player_id`, `activity_status`, ordered by player_id. Do not convert a null last_seen to signup time.

Edit `script.sql`, Run to inspect the result, then Submit. Grading checks the complete ordered result, not whether a view was created or which equivalent SQL you used. Run and Submit reset the supplied snapshot.
