WITH ranked AS (
 SELECT *, ROW_NUMBER() OVER (PARTITION BY event_id
   ORDER BY received_at DESC, ingest_id DESC) AS position
 FROM events WHERE received_at < TIMESTAMPTZ '2025-04-01 00:00+00'
), clean AS (
 SELECT * FROM ranked WHERE position = 1
), entry AS (
 SELECT member_id, MIN(happened_at) AS entered
 FROM clean WHERE kind = 'visit'
  AND happened_at >= TIMESTAMPTZ '2025-01-01 00:00+00'
  AND happened_at < TIMESTAMPTZ '2025-03-18 00:00+00'
 GROUP BY member_id
), booked AS (
 SELECT v.member_id, v.entered, MIN(e.happened_at) AS booked_at
 FROM entry v LEFT JOIN clean e ON e.member_id = v.member_id
  AND e.kind = 'book' AND e.happened_at > v.entered
  AND e.happened_at <= v.entered + INTERVAL '14 days'
 GROUP BY v.member_id, v.entered
), paths AS (
 SELECT b.member_id, b.booked_at, MIN(e.happened_at) AS paid_at
 FROM booked b LEFT JOIN clean e ON e.member_id = b.member_id
  AND e.kind = 'pay' AND e.happened_at > b.booked_at
  AND e.happened_at <= b.entered + INTERVAL '14 days'
 GROUP BY b.member_id, b.booked_at
)
SELECT COUNT(*) AS visited, COUNT(booked_at) AS booked,
       COUNT(paid_at) AS paid,
       ROUND(100.0 * COUNT(paid_at) / NULLIF(COUNT(*), 0), 2) AS conversion_pct
FROM paths;
