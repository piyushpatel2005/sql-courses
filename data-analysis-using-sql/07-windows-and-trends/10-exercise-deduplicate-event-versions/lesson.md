---
title: 'Exercise: Retain one source version per event'
slug: exercise-deduplicate-event-versions
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Keep the latest received version of each logical event.
seo_title: 'Exercise: Retain one source version per event | Data Analysis Using SQL'
seo_description: Keep the latest received version of each logical event.
seo_keywords:
  - SQL
  - PostgreSQL
  - Retain one source version per event
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - event_id
    - ingest_id
    - member_id
    - kind
  expected_row_count: 16
  expected_rows:
    - - e1
      - 1
      - 1
      - visit
    - - e10
      - 11
      - 4
      - visit
    - - e11
      - 12
      - 4
      - book
    - - e12
      - 13
      - 4
      - pay
    - - e13
      - 14
      - 5
      - visit
    - - e14
      - 15
      - 5
      - book
    - - e15
      - 16
      - 5
      - pay
    - - e16
      - 17
      - 6
      - visit
    - - e2
      - 2
      - 1
      - book
    - - e3
      - 4
      - 1
      - pay
    - - e4
      - 5
      - 2
      - pay
    - - e5
      - 6
      - 2
      - visit
    - - e6
      - 7
      - 2
      - book
    - - e7
      - 8
      - 3
      - visit
    - - e8
      - 9
      - 3
      - book
    - - e9
      - 10
      - 3
      - pay
hints:
  - Partition by event_id and sort receipt time and ingest_id descending.
---

# Exercise: Retain one source version per event

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `events`

One row represents one received version of a logical member event.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `ingest_id` · `integer` | Unique receipt identifier; use it to distinguish deliveries and break arrival-time ties. | Primary key; unique. Required; cannot be `NULL`. |
| `event_id` · `text` | Text logical-event identity; several receipts can share it. | Nullable; `NULL` means the logical business identity is unrecorded; this is not a new known identity. |
| `member_id` · `integer` | Logical member identifier; no member foreign key is declared. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `kind` · `text` | Event label: visit, book or pay in this feed; not a table-enforced vocabulary. | Nullable; `NULL` means no kind value is recorded. |
| `happened_at` · `timestamp with time zone` | Event occurrence instant; use this for behavior order and UTC entry windows. | Nullable; `NULL` means occurrence time is unrecorded. |
| `received_at` · `timestamp with time zone` | Receipt/arrival instant; use this for knowledge cutoffs and version precedence, not occurrence sequence. | Nullable; `NULL` means receipt time is unrecorded. |

Only ingest_id is required by the physical schema. The supplied identities and timestamps are known, but that is not a NOT NULL guarantee. Event pay records and order payments are separate sources, without a declared one-to-one relationship. Apply a knowledge cutoff before choosing the latest known version when the task asks for an as-of funnel.

### Named intermediate results

These dictionaries describe the columns exposed by the named query steps. They are not extra preloaded tables or a complete answer query.

#### `ranked`

One row represents one received member-event version.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `event_id` · `text` | Text logical-event identity; several receipts can share it. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `ingest_id` · `integer` | Unique receipt identifier; use it to distinguish deliveries and break arrival-time ties. | Non-NULL by query lineage, not a declared NOT NULL constraint. Inherited source value; source nullability is unchanged. |
| `member_id` · `integer` | Logical member identifier; no member foreign key is declared. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `kind` · `text` | Event label: visit, book or pay in this feed; not a table-enforced vocabulary. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `position` · `bigint` | Computed version position within event identity. | Non-NULL by query lineage, not a declared NOT NULL constraint. Non-NULL window result; no physical key or CHECK is created. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

All exposed columns are listed, including fields retained by SELECT *. This statement-local result does not create table constraints.

The feed contains retries. Retain the latest received version per `event_id`, using highest `ingest_id` for an arrival-time tie. The supplied identifiers and timestamps are known. In a real feed, define a policy for missing identities or receipt times before treating this ordering as reliable.

## Your Task

1. Return event_id, ingest_id, member_id, kind for retained events, ordered lexically by event_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
