SELECT import_id,
       NULLIF(LOWER(TRIM(region_text)),
       '') AS region
FROM raw_intake
ORDER BY import_id;
