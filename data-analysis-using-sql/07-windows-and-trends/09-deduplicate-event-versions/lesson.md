---
title: Retain one source version per event
slug: deduplicate-event-versions
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Keep the latest received version of each logical event.
seo_title: Retain one source version per event | Data Analysis Using SQL
seo_description: Keep the latest received version of each logical event.
seo_keywords:
- SQL
- PostgreSQL
- Retain one source version per event
sql:
  seed: seed.sql
---

# Retain one source version per event

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `deliveries`

One row represents one received version of an event label.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `load_id` · `integer` | Receipt identifier and arrival-order tie-breaker; not a declared key. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `event_ref` · `text` | Repeating text logical-event reference, not the receipt identity. | Nullable; `NULL` means the logical business identity is unrecorded; this is not a new known identity. |
| `arrived` · `integer` | Integer arrival-order marker, not a timestamp or elapsed duration. | Nullable; `NULL` means no arrived value is recorded. |
| `label` · `text` | Text carried by this version of the event. | Nullable; `NULL` means no label value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

The sample supplies distinct load IDs and known arrival markers without enforcing either property. Latest-version retention does not turn event_ref into a physical primary key.

### Named intermediate results

These dictionaries describe the columns exposed by the named query steps. They are not extra preloaded tables or a complete answer query.

#### `ranked`

One row represents one received label version.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `load_id` · `integer` | Receipt identifier and arrival-order tie-breaker; not a declared key. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `event_ref` · `text` | Repeating text logical-event reference, not the receipt identity. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `arrived` · `integer` | Integer arrival-order marker, not a timestamp or elapsed duration. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `label` · `text` | Text carried by this version of the event. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `position` · `bigint` | Computed version position within event identity. | Non-NULL by query lineage, not a declared NOT NULL constraint. Non-NULL window result; no physical key or CHECK is created. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

All exposed columns are listed, including fields retained by SELECT *. This statement-local result does not create table constraints.

A ranking gives every row a position; deduplication makes a further decision about which position to keep. In this separate `deliveries` demo, one row is one received version: `load_id` identifies the receipt, `event_ref` is the repeating text identity, `arrived` is an integer arrival-order marker (not a timestamp), and `label` shows the version's text.

Deduplication needs both an identity key and a retention rule. Use the previously taught ROW_NUMBER in a partition for each logical event, ordered by latest arrival and then highest ingest ID.

Calculate the position in a CTE, then filter position = 1 outside it. WHERE cannot filter a window result at the same query level. The example retains one received version, not one arbitrary row. This policy may differ from keeping the first arrival, so state it before querying.

```sql run
WITH ranked AS (SELECT *,
       ROW_NUMBER() OVER (PARTITION BY event_ref
ORDER BY arrived DESC,load_id DESC) AS position
FROM deliveries) SELECT event_ref,label
FROM ranked
WHERE position=1
ORDER BY event_ref;
```
