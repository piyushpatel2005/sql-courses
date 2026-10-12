SELECT import_id,
       COALESCE(NULLIF(LOWER(TRIM(region_text)),
       ''),
       'unknown') AS region
FROM raw_intake
ORDER BY import_id;
