---
title: Share tied positions with RANK
slug: competition-rank
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Give tied amounts a shared rank with gaps after ties.
seo_title: Share tied positions with RANK | Data Analysis Using SQL
seo_description: Give tied amounts a shared rank with gaps after ties.
seo_keywords:
- SQL
- PostgreSQL
- Share tied positions with RANK
sql:
  seed: seed.sql
---

# Share tied positions with RANK

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `votes`

One row represents one booth vote-count summary.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `booth` · `text` | Booth label; unique in the sample but not a declared key. | Nullable; `NULL` means no booth value is recorded. |
| `votes` · `integer` | Number of votes recorded for this booth. | Nullable; `NULL` means the votes measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

RANK gives equal ordering values the same rank and leaves a gap after ties. Values 9, 9, 5 rank 1, 1, 3 in descending order. Do not add an ID inside this window: that would make the tied amounts different ordering values.

The tied booths share their rank. Inspect the next booth to see the gap left by the tie.

```sql run
SELECT booth,
       votes,
       RANK() OVER (ORDER BY votes DESC) AS position
FROM votes
ORDER BY votes DESC,
       booth;
```
