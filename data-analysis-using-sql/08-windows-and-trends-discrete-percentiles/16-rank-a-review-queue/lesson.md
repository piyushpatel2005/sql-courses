---
title: Rank a review queue without erasing ties
slug: rank-a-review-queue
order: 16
language: sql
runtime: sql
lesson_type: interactive
summary: Keep every order at the two highest distinct amount levels.
seo_title: Rank a review queue without erasing ties | Data Analysis Using SQL
seo_description: Keep every order at the two highest distinct amount levels.
seo_keywords:
- SQL analysis
- rank a review queue
- PostgreSQL
sql:
  seed: seed.sql
---

# Rank a review queue without erasing ties

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `baskets`

One row represents one harvest basket.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `basket` · `integer` | Basket identifier, distinct in the sample without a key declaration. | Nullable; `NULL` means no basket value is recorded. |
| `kg` · `integer` | Basket mass in kilograms; equal masses are legitimate ties. | Nullable; `NULL` means the kg measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

### Named intermediate results

These dictionaries describe the columns exposed by the named query steps. They are not extra preloaded tables or a complete answer query.

#### `ranked`

One row represents one harvest basket.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `basket` · `integer` | Basket identifier, distinct in the sample without a key declaration. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `kg` · `integer` | Basket mass in kilograms; equal masses are legitimate ties. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `level` · `bigint` | Computed distinct descending value level. | Non-NULL by query lineage, not a declared NOT NULL constraint. Non-NULL window result; no physical key or CHECK is created. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

All exposed columns are listed, including fields retained by SELECT *. This statement-local result does not create table constraints.

A review queue may include every row at its two highest value levels. This is a rank-filtering task, not a request for exactly two rows.

You already practiced the three rank functions separately. DENSE_RANK fits this queue because tied values should share a level without gaps. Compute that rank in a CTE before filtering it.

A top-two-ranks filter may return more than two rows when there are ties. If exactly two rows are required, use row numbers with an explicit tie policy and acknowledge that a tied row was excluded.

## Read and run

A garden ranks harvest baskets by weight and then keeps the two highest distinct weight levels.

```sql run
WITH ranked AS (
  SELECT basket, kg,
         DENSE_RANK() OVER (ORDER BY kg DESC) AS level
  FROM baskets
)
SELECT basket, kg, level FROM ranked
WHERE level <= 2 ORDER BY kg DESC, basket;
```

Three baskets remain because two baskets tie at the highest weight. A row-number filter of at most two would answer a different question.

Exactly two rows would be a different queue policy. The tied baskets explain why this report keeps more rows than value levels.
