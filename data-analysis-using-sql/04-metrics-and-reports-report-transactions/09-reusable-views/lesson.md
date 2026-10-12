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
