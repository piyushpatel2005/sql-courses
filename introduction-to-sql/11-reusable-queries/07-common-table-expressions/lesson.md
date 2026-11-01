---
title: Give a query stage a name with WITH
slug: common-table-expressions
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Name a summary for the duration of one statement.
seo_title: Give a query stage a name with WITH | Introduction to SQL
seo_description: Name a summary for the duration of one statement.
seo_keywords:
- SQL
- PostgreSQL
- common table expressions
sql:
  seed: seed.sql
---

# Give a query stage a name with WITH

A common table expression, or CTE, gives a query result a name for one statement. `WITH stall_totals AS (...)` computes an aggregate stage that the following SELECT can read. This is useful when a question is easier to understand in steps.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `sales`

One row represents one recorded market sale.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `sale_id` · `integer` | Identifier of the sale. | Primary key. Required; cannot be `NULL`. |
| `stall` · `text` | Stall label used to group the sales. | Nullable; `NULL` means no stall value is recorded. |
| `amount` · `numeric(8,2)` | Value of this sale in currency units, stored to two decimal places. | Nullable; `NULL` means the sale amount is unrecorded. |
| `voucher` · `text` | Optional voucher code recorded with the sale. | Nullable; `NULL` means no voucher code is recorded. |

`NULL` in `voucher` means no voucher code is recorded; it is not a missing sale. Missing `amount` means an unrecorded amount, not zero. Stall names and voucher codes are not unique keys; no currency code or nonnegative-amount constraint is declared.

### Named query result

#### `stall_totals`

One row represents one stall group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `stall` · `text` | Grouping label from `sales.stall`. | Logical group key, not a physical primary key. A NULL stall forms one group. |
| `total` · `numeric` | Sum of `sales.amount` in this group, in currency units. | Computed value; no fixed precision or scale. NULL when a group has no known amounts. |

The CTE is a named result within one statement, not a preloaded table or persistent view. Its grouped label is logically unique, with NULL grouping handled as one group where allowed.

You previously put a summary inside FROM as a derived table. Here we give that intermediate result a name before the main SELECT, so the query reads from a named stage instead of nesting the whole definition at the point of use. Unlike the view introduced earlier in this section, that name lasts only for this statement. The example returns to the market `sales` data: one source row is one sale, and one `stall_totals` row is one stall's combined amount in currency units.

The cafe-market example first makes one row per stall, then filters that small summary. We could write the same aggregate condition with HAVING. The CTE separates 'calculate the totals' from 'choose which totals to report', which becomes helpful as reports grow.

Run the example and expect East and West. Notice the closing parenthesis before the outer SELECT, with no semicolon between them. The CTE belongs to that one statement; it is not a persistent view and cannot be selected in a later independent statement.

A CTE is primarily a naming and structuring tool, not a guarantee of faster execution or a physical temporary table. PostgreSQL may inline or materialize it depending on the query and settings. Recursive CTEs solve another class of problems, such as walking a hierarchy; this first example is deliberately nonrecursive.

```sql run
WITH stall_totals AS (
  SELECT stall, SUM(amount) AS total
  FROM sales GROUP BY stall
)
SELECT stall, total FROM stall_totals
WHERE total >= 15 ORDER BY stall;
```
