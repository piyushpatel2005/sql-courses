SELECT import_id,
       CASE WHEN TRIM(fee_text) ~ '^[0-9]+([.][0-9]+)?$' THEN 'approved' ELSE 'review' END AS status
FROM raw_intake
ORDER BY import_id;
