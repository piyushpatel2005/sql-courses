---
title: 'Stage 2: preserve each player and last-seen history'
slug: game-churn-stage-2
order: 3
language: sql
runtime: sql
lesson_type: coding
summary: Keep every observed account beside its valid play history and window counts.
seo_title: 'Stage 2: preserve each player and last-seen history | Data Analysis Using SQL'
seo_description: Keep every observed account beside its valid play history and window counts.
seo_keywords:
- SQL
- game churn
- player activity
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - player_id
  - last_play_date
  - baseline_plays
  - recent_plays
  - account_mature
  expected_rows:
  - - 1
    - '2025-03-20'
    - 1
    - 1
    - 1
  - - 2
    - '2025-03-12'
    - 1
    - 0
    - 1
  - - 3
    - '2025-03-18'
    - 1
    - 1
    - 1
  - - 4
    - '2025-03-04'
    - 1
    - 0
    - 1
  - - 5
    - '2025-03-25'
    - 0
    - 1
    - 0
  - - 6
    - null
    - 0
    - 0
    - 1
  - - 7
    - '2025-03-01'
    - 0
    - 0
    - 1
  - - 8
    - '2025-03-18'
    - 0
    - 1
    - 1
  - - 9
    - '2025-03-08'
    - 1
    - 0
    - 1
  - - 10
    - '2025-03-31'
    - 1
    - 1
    - 1
  - - 11
    - '2025-03-12'
    - 1
    - 0
    - 1
  expected_row_count: 11
hints:
- Count event keys, not the null-extended row of a never-player.
---

# Stage 2: preserve each player and last-seen history

An inner join would erase accounts with no valid play, including the account with only a heartbeat and an invalid pre-signup event. Start from registrations before the cutoff and left join the cleaned stream. Aggregate once at player grain. `last_seen` is the maximum known valid occurrence time, not the latest arrival timestamp. Leave it null for a never-player. A mature account alone is not enough for baseline eligibility; retain the two conditions separately so the next stage can explain exclusions.

Continue Lantern Trail with the same April 1, 2025 UTC exclusive cutoff, March 4–18 baseline, and March 18–April 1 follow-up. The first stage defines every field and validity rule. This lesson independently restores all earlier views; its starter includes the complete previous-stage script. Keep those definitions and add the new checkpoint after the previous final SELECT. The final SELECT is the result that Submit grades.

## Your Task

1. Create `game_player_history` with player_id, signed_up_at, channel, last_seen, baseline_plays, recent_plays, and account_mature. Count baseline and follow-up plays with their specified half-open windows; set account_mature to 1 for signup at or before March 18, else 0. Return `player_id`, `last_seen::date::text AS last_play_date`, `baseline_plays`, `recent_plays`, `account_mature`, ordered by player_id.

Edit `script.sql`, Run to inspect the result, then Submit. Grading checks the complete ordered result, not whether a view was created or which equivalent SQL you used. Run and Submit reset the supplied snapshot.
