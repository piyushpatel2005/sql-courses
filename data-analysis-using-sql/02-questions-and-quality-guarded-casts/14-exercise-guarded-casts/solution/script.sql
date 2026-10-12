SELECT import_id,
       CASE WHEN TRIM(fee_text) ~ '^[0-9]+([.][0-9]+)?$' THEN TRIM(fee_text)::numeric ELSE NULL END AS fee
FROM raw_intake
ORDER BY import_id;
