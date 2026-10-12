SELECT import_id,
       TRIM(fee_text) ~ '^[0-9]+([.][0-9]+)?$' AS approved
FROM raw_intake
ORDER BY import_id;
