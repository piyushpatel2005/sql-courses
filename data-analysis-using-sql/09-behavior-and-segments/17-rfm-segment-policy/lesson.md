---
title: Apply a segment policy to prepared RFM measures
slug: rfm-segment-policy
order: 17
language: sql
lesson_type: interactive
runtime: sql
summary: Apply a stated segment rule to recency, frequency and monetary measures.
seo_title: Apply a segment policy to prepared RFM measures | Data Analysis Using SQL
seo_description: Apply a stated segment rule to recency, frequency and monetary measures.
seo_keywords:
- SQL
- PostgreSQL
- Apply a segment policy to prepared RFM measures
sql:
  seed: seed.sql
---

# Apply a segment policy to prepared RFM measures

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `prepared_rfm`

One row represents one prepared person-level RFM summary.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `person` · `integer` | Person identifier, not declared as a key. | Nullable; `NULL` means no person value is recorded. |
| `recency` · `integer` | Calendar days since the last eligible purchase under the prepared snapshot; NULL means no purchase recency is known. | Nullable; `NULL` means purchase recency is not known. |
| `frequency` · `integer` | Number of eligible purchases, not line items or event receipts. | Nullable; `NULL` means the frequency measure is unrecorded, not zero. |
| `monetary` · `numeric` | Gross paid purchase value in USD before refunds for the prepared observation window. | Nullable; `NULL` means the monetary measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

These are already prepared measures; the fixture does not expose the source purchase history or a date column proving its as-of cutoff. The segment is a reporting policy, not a prediction.

The preceding lessons defined recency, frequency and monetary value separately. A segment now applies a business rule to those measures. Use CASE to give never-buyers their own state before considering recency thresholds.

The prepared demonstration table already has RFM values. A repeat buyer is recent only under the stated cutoff and threshold. These operational labels summarize observed behavior; they do not predict loyalty or establish why someone bought.

```sql run
SELECT person,
       CASE WHEN frequency = 0 THEN 'never_bought'
            WHEN frequency >= 2 AND recency <= 30
              THEN 'recent_repeat'
            ELSE 'other' END AS segment
FROM prepared_rfm
ORDER BY person;
```
