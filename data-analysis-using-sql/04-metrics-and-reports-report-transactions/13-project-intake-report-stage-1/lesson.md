---
title: 'Intake project 1: a reviewable clean layer'
slug: project-intake-report-stage-1
order: 13
language: sql
runtime: sql
lesson_type: coding
summary: Build an intake-quality report that the membership desk can rerun after each import.
seo_title: 'Intake project 1: a reviewable clean layer | Data Analysis Using SQL'
seo_description: Build an intake-quality report that the membership desk can rerun after each import.
seo_keywords:
- SQL analysis
- project intake report stage 1
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - import_id
  - member_key
  - region
  - fee
  expected_rows:
  - - 1
    - A7
    - north
    - '12.50'
  - - 2
    - B8
    - south
    - null
  - - 3
    - A7
    - north
    - '12.50'
  - - 4
    - C9
    - null
    - null
  - - 5
    - D2
    - null
    - '0'
  - - 6
    - E3
    - west
    - '18.00'
  expected_row_count: 6
hints:
- Reuse the two cleaning expressions, while retaining import_id.
---

# Intake project 1: a reviewable clean layer

Build an intake-quality report that the membership desk can rerun after each import.

## Project continuity

This starts a new report. The seed contains the source snapshot only.

Prerequisites: text normalization, guarded casts, CASE, views and transactions.

Keep the import grain in this layer. The repeated A7 key must remain visible; this project measures import quality rather than unique people. A missing region or rejected fee is a review item, not an automatic deletion.

## Your Task

1. Create or replace `intake_clean` with `import_id`, `member_key`, cleaned `region`, and numeric `fee` under the taught nonnegative-decimal policy. Return all four columns ordered by `import_id`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The layer separates policy from presentation. If the desk later accepts signed fees, change that policy here and review its downstream effect.
