---
title: Commit a unit of work or roll it back
slug: transactions
order: 5
language: sql
runtime: sql
lesson_type: interactive
summary: Cancel an uncommitted change with ROLLBACK.
seo_title: Commit a unit of work or roll it back | Introduction to SQL
seo_description: Cancel an uncommitted change with ROLLBACK.
seo_keywords:
- SQL
- PostgreSQL
- transactions
sql:
  seed: seed.sql
---

# Commit a unit of work or roll it back

Two related updates should succeed together. BEGIN starts a transaction block. COMMIT accepts its changes; ROLLBACK cancels them. Outside an explicit block, each successful statement normally commits on its own unless a client library manages transactions for you.

## Data model

### Example data

Each block creates its own disposable table. The first uses chair counts; the second uses a separate trial quantity. Neither table is preloaded.

### First example: chair counts

#### `chairs`

One row represents one room's chair count.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `room_id` · `integer` | Identifier of the room in this disposable fixture. | Primary key. Required; cannot be `NULL`. |
| `quantity` · `integer` | Whole-number count of chairs recorded in the room. | Nullable; `NULL` means the quantity is unrecorded, not zero. |

No separate rooms table or foreign key is declared, and no nonnegative-count check is present.

### Second example: trial quantity

#### `trial`

One row represents one disposable quantity record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `id` · `integer` | Identifier of the trial record. | Primary key. Required; cannot be `NULL`. |
| `quantity` · `integer` | Whole-number trial quantity, restored by the rollback. | Nullable; `NULL` means the quantity is unrecorded, not zero. |

This fixture exists only to demonstrate rollback; it has no declared unit or nonnegative-count check.

The first example moves two chairs from one room to another and commits. The second tries a change but rolls it back. Each block recreates its own disposable fixture so the comparison is repeatable. Look at the final counts rather than expecting the output panel to show every intermediate statement.

Atomicity means a transaction's changes are accepted together or discarded together. Isolation concerns how concurrent work interacts, and durability concerns committed data surviving failures in a normally configured persistent database. Our practice database is disposable: COMMIT does not promise that your lesson edits survive a reset.

A transaction does not decide whether a business action is correct. Your predicates, constraints, and application checks still matter. Nor does a rollback automatically handle external effects such as an email already sent. Keep that distinction in mind when designing a multi-step workflow.

```sql run
DROP TABLE IF EXISTS chairs;
CREATE TABLE chairs (room_id integer PRIMARY KEY, quantity integer);
INSERT INTO chairs VALUES (1,8),(2,3);
BEGIN;
UPDATE chairs SET quantity = quantity - 2 WHERE room_id = 1;
UPDATE chairs SET quantity = quantity + 2 WHERE room_id = 2;
COMMIT;
SELECT room_id, quantity FROM chairs ORDER BY room_id;
```

```sql run
DROP TABLE IF EXISTS trial;
CREATE TABLE trial (id integer PRIMARY KEY, quantity integer);
INSERT INTO trial VALUES (1,8);
BEGIN;
UPDATE trial SET quantity = 0 WHERE id = 1;
ROLLBACK;
SELECT id, quantity FROM trial;
```
