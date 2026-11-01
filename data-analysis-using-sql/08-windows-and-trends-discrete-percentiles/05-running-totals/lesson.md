---
title: Accumulate a running total with an explicit frame
slug: running-totals
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Accumulate paid amounts from the start of each member's history.
seo_title: Accumulate a running total with an explicit frame | Data Analysis Using SQL
seo_description: Accumulate paid amounts from the start of each member's history.
seo_keywords:
- SQL
- PostgreSQL
- Accumulate a running total with an explicit frame
sql:
  seed: seed.sql
---

# Accumulate a running total with an explicit frame

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `daily_refills`

One row represents one prepared daily refill count.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | Calendar date of the refill count; every displayed date is present in this sample. | Nullable; `NULL` means the calendar date is unrecorded. |
| `refills` · `integer` | Number of refills on this date; a stored zero is observed inactivity. | Nullable; `NULL` means the refills measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

Dates are unique in the fixture but not constrained. A row frame spans days only while this one-row-per-day input is maintained.

ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW includes every row from the partition start through the current row. A partition defines related rows; the frame defines which contribute at the current position. An explicit ROWS frame and stable ordering avoid unexpected jumps across tied ordering values.

A neighbor comparison uses one other row. A running total needs every row so far. In this separate `daily_refills` fixture, each row is one calendar day's count: `day` is a date and `refills` is an integer count. All four dates are present, including a known zero on February 2. The final running total includes that zero day without treating it as missing.

```sql run
SELECT day::text AS day, refills,
       SUM(refills) OVER (
         ORDER BY day
         ROWS BETWEEN UNBOUNDED PRECEDING
                  AND CURRENT ROW
       ) AS total
FROM daily_refills
ORDER BY day;
```
