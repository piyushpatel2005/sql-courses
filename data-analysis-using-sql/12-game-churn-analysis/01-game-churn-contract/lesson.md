---
title: Define activity churn before counting players
slug: game-churn-contract
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Define an eligible baseline before measuring follow-up inactivity.
seo_title: Define activity churn before counting players | Data Analysis Using SQL
seo_description: Define an eligible baseline before measuring follow-up inactivity.
seo_keywords:
- SQL
- game churn
- player activity
sql:
  seed: seed.sql
---

# Define activity churn before counting players

A quiet player is not automatically a lost customer. Before building Lantern Trail's report, separate an observed absence from a permanent decision to leave. This example uses a different game, Pebble Paths, and a shorter window so the denominator is easy to inspect.

The supplied player-level table already contains clean counts. At a fixed June 15 cutoff, its baseline covers June 1–7 and follow-up covers June 8–14, in UTC. Players 21 and 22 played in the baseline and have full follow-up; player 23 joined during follow-up. Player 24 has a mature account but never played in the baseline. Filter the eligible population before computing the rate.

```sql run
SELECT COUNT(*) AS eligible_players,
       COUNT(*) FILTER (WHERE followup_plays = 0) AS inactive_players,
       COUNT(*) FILTER (WHERE followup_plays > 0) AS retained_players,
       ROUND(100.0 * COUNT(*) FILTER (WHERE followup_plays = 0)
             / NULLIF(COUNT(*), 0), 2) AS inactivity_pct
FROM pebble_snapshot
WHERE mature = 1 AND baseline_plays > 0;
```

The result contains two eligible players and splits them evenly. Counting all four registrations would dilute the rate; calling player 23 churned would also mistake an incomplete observation window for a completed outcome. Exact day-seven retention asks a different question and need not equal one minus this inactivity rate.

Predict whether adding another follow-up play for player 21 would change this player-based rate. It changes activity volume but not the binary outcome. The next lesson starts a six-stage report from raw event versions, rather than this already summarized table.

## The game snapshot

You are reviewing the fictional cooperative puzzle game **Lantern Trail**. `game_players` has one row per account: integer `player_id`, UTC `signed_up_at`, and nullable acquisition `channel`. `game_events` has one row per received event version: unique integer `ingest_id`, repeatable text `event_id`, `player_id`, `kind`, UTC occurrence `happened_at`, and arrival `received_at`. A `play` is a completed puzzle attempt; a heartbeat is not play. These synthetic records describe no real players.

Use the fixed cutoff **April 1, 2025 at 00:00 UTC**, exclusively. Keep only events that both happened and arrived before that instant, retain the latest known version per event ID (arrival descending, then ingest ID descending), then keep plays matched to an account and occurring on or after signup. Assume this toy export covers all accounts from signup onward; in a real export verify tracking coverage and identity quality before interpreting silence.

The baseline is **March 4 inclusive to March 18 exclusive**. Follow-up is **March 18 inclusive to April 1 exclusive**. The eligible denominator contains accounts signed up by March 18 at 00:00 UTC with at least one valid baseline play. A member of that baseline cohort with no follow-up play is **activity-churned for this report**; any follow-up play means retained. This is an observed transition into a 14-day inactive window, not subscription cancellation, permanent departure, or a prediction. New accounts, never-players, and accounts absent from the baseline are reported separately, not added to that denominator.

The full follow-up window is observed for the eligible baseline cohort. Recent signups are right-censored for a comparable account-age follow-up: the export ends before they receive the same opportunity. Excluding them avoids labeling incomplete observation as churn. Signup-month cohorts below are descriptive strata of the fixed baseline population, not day-N retention curves. Retention and inactivity sum to 100% only because this report uses the same eligible cohort and complementary follow-up conditions.
