CREATE OR REPLACE VIEW intake_clean AS
SELECT import_id, member_key,
       NULLIF(LOWER(TRIM(region_text)), '') AS region,
       CASE WHEN TRIM(fee_text) ~ '^[0-9]+([.][0-9]+)?$'
            THEN TRIM(fee_text)::numeric ELSE NULL END AS fee
FROM raw_intake;
SELECT import_id, member_key, region, fee
FROM intake_clean ORDER BY import_id;

-- TODO: Step 1: Replace the following preview: Define intake_by_region without dropping unknown regions.
SELECT * FROM intake_clean ORDER BY import_id;
