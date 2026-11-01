---
title: Define both sides of a rate
slug: rate-denominators
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate a paid-order share from an explicit numerator and denominator.
seo_title: Define both sides of a rate | Data Analysis Using SQL
seo_description: Calculate a paid-order share from an explicit numerator and denominator.
seo_keywords:
- SQL
- PostgreSQL
- Define both sides of a rate
sql:
  seed: seed.sql
---

# Define both sides of a rate

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `requests`

One row represents one submitted request.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `desk` · `text` | Submitting desk label; several requests can share it. | Nullable; `NULL` means no desk value is recorded. |
| `fulfilled` · `boolean` | Whether this request was fulfilled: true for success, false for failure. | Nullable; `NULL` means the fulfillment outcome is unknown, not false. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

The denominator counts request rows, including failures. A missing fulfillment flag would be unknown, not false; FILTER counts only true flags.

A percentage needs a named numerator and denominator. Use the FILTER counts you just practiced to keep fulfilled requests and all submitted requests in the same population. Multiplying by 100.0 preserves fractional arithmetic.

NULLIF(denominator, 0), taught during cleaning, makes a zero denominator NULL instead of causing division by zero. No attempts is an undefined rate; zero successes out of several attempts is 0%. This grouped example has only desks with requests, so its denominators are positive. Representing a desk with no requests would first require a desk list and a left join, or an explicitly supplied zero count.

To combine groups, divide summed numerators by summed denominators rather than averaging percentages.

```sql run
SELECT desk,
       COUNT(*) AS requests,
       COUNT(*) FILTER (WHERE fulfilled) AS fulfilled,
       ROUND(
         100.0 * COUNT(*) FILTER (WHERE fulfilled)
         / NULLIF(COUNT(*), 0), 2
       ) AS fulfilled_pct
FROM requests
GROUP BY desk
ORDER BY desk;
```

Here is the same denominator rule applied to intake coverage: four usable fee records out of six imports. These are illustrative import counts, not the request totals above.

![Compute the ratio from summed counts, not the mean of region percentages.](weighted-coverage-rate.svg)
