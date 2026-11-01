---
title: Publish a query definition as a view
slug: reusable-views
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Publish a reusable paid-order query without freezing its source.
seo_title: Publish a query definition as a view | Data Analysis Using SQL
seo_description: Publish a reusable paid-order query without freezing its source.
seo_keywords:
- SQL
- PostgreSQL
- Publish a query definition as a view
sql:
  seed: seed.sql
---

# Publish a query definition as a view

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `stock_labels`

One row represents one stock-bin label.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `bin_id` · `integer` | Bin record identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `label` · `text` | Raw bin label with original spaces and letter case; a spaces-only label is stored text. | Nullable; `NULL` means no label value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `clean_bins`

One row represents one source bin-label record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `bin_id` · `integer` | Bin identifier inherited from stock_labels; no unique source key is declared. | May be `NULL` under its source or expression policy. |
| `label` · `text` | Trimmed, lowercase bin label; a blank cleaned label becomes NULL. | May be `NULL` under its source or expression policy. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

This view is created by the example, not preloaded. It keeps source-bin row grain and reads current labels rather than freezing their values.

CREATE OR REPLACE VIEW name AS SELECT ... stores a reusable query definition. Selecting the view reads current source data; the view is not a frozen snapshot. Keep its column names and row grain stable when replacing the definition.

The craft shop publishes cleaned labels without overwriting raw labels. Run the definition and its final SELECT. Repeating this compatible definition is safe. Unlike a CTE, the view remains available after this statement, though a lesson reset restores the supplied seed.

```sql run
CREATE OR REPLACE VIEW clean_bins AS SELECT bin_id,
       NULLIF(LOWER(TRIM(label)),
       '') AS label
FROM stock_labels;
SELECT bin_id,
       label
FROM clean_bins
ORDER BY bin_id;
```
