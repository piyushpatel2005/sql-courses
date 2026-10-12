---
title: 'Stage 1: establish the observed play stream'
slug: exercise-game-churn-contract
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Separate raw event receipts from valid plays known at the cutoff.
seo_title: 'Stage 1: establish the observed play stream | Data Analysis Using SQL'
seo_description: Separate raw event receipts from valid plays known at the cutoff.
seo_keywords:
- SQL
- game churn
- player activity
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - raw_receipts
  - known_events
  - valid_plays
  - playing_accounts
  expected_rows:
  - - 19
    - 16
    - 13
    - 10
  expected_row_count: 1
hints:
- Filter both timestamps before choosing the latest version of each event.
---

# Stage 1: establish the observed play stream

The export contains duplicate deliveries, an orphan player, a heartbeat, a play before signup, a cutoff event, and a late arrival. Begin with a source-quality checkpoint instead of treating every row as a session. Filtering arrival time before deduplication prevents a later version from rewriting what the team could know at the cutoff. Both event timestamps must be earlier than the cutoff. Do not discard older valid history: the later never-played check needs it.

## The game snapshot

You are reviewing the fictional cooperative puzzle game **Lantern Trail**. `game_players` has one row per account: integer `player_id`, UTC `signed_up_at`, and nullable acquisition `channel`. `game_events` has one row per received event version: unique integer `ingest_id`, repeatable text `event_id`, `player_id`, `kind`, UTC occurrence `happened_at`, and arrival `received_at`. A `play` is a completed puzzle attempt; a heartbeat is not play. These synthetic records describe no real players.

Use the fixed cutoff **April 1, 2025 at 00:00 UTC**, exclusively. Keep only events that both happened and arrived before that instant, retain the latest known version per event ID (arrival descending, then ingest ID descending), then keep plays matched to an account and occurring on or after signup. Assume this toy export covers all accounts from signup onward; in a real export verify tracking coverage and identity quality before interpreting silence.

The baseline is **March 4 inclusive to March 18 exclusive**. Follow-up is **March 18 inclusive to April 1 exclusive**. The eligible denominator contains accounts signed up by March 18 at 00:00 UTC with at least one valid baseline play. A member of that baseline cohort with no follow-up play is **activity-churned for this report**; any follow-up play means retained. This is an observed transition into a 14-day inactive window, not subscription cancellation, permanent departure, or a prediction. New accounts, never-players, and accounts absent from the baseline are reported separately, not added to that denominator.

The full follow-up window is observed for the eligible baseline cohort. Recent signups are right-censored for a comparable account-age follow-up: the export ends before they receive the same opportunity. Excluding them avoids labeling incomplete observation as churn. Signup-month cohorts below are descriptive strata of the fixed baseline population, not day-N retention curves. Retention and inactivity sum to 100% only because this report uses the same eligible cohort and complementary follow-up conditions.


## Your Task

1. Create `game_observed` with the latest known event version, then `game_activity` with only valid matched plays. Return one row containing `raw_receipts` (the whole input table), `known_events` (game_observed), `valid_plays` (game_activity), and `playing_accounts` (distinct valid player IDs). Keep these column names and order.

Edit `script.sql`, Run to inspect the result, then Submit. Grading checks the complete ordered result, not whether a view was created or which equivalent SQL you used. Run and Submit reset the supplied snapshot.
