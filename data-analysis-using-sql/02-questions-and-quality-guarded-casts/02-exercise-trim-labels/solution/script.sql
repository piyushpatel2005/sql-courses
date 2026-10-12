SELECT import_id,
       TRIM(region_text) AS trimmed_region
FROM raw_intake
ORDER BY import_id;
