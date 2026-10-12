SELECT import_id,
       LOWER(TRIM(region_text)) AS normalized_region
FROM raw_intake
ORDER BY import_id;
