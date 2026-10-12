WITH ranked AS (SELECT event_id,ingest_id,member_id,kind,
       ROW_NUMBER() OVER (PARTITION BY event_id
ORDER BY received_at DESC,ingest_id DESC) AS position
FROM events) SELECT event_id,ingest_id,member_id,kind
FROM ranked
WHERE position=1
ORDER BY event_id;
