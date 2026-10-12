CREATE OR REPLACE VIEW intake_clean AS
SELECT import_id, member_key,
       NULLIF(LOWER(TRIM(region_text)), '') AS region,
       CASE WHEN TRIM(fee_text) ~ '^[0-9]+([.][0-9]+)?$'
            THEN TRIM(fee_text)::numeric ELSE NULL END AS fee
FROM raw_intake;
SELECT import_id, member_key, region, fee
FROM intake_clean ORDER BY import_id;

CREATE OR REPLACE VIEW intake_by_region AS
SELECT COALESCE(region, 'unknown') AS region,
       COUNT(*) AS imports, COUNT(fee) AS usable_fees
FROM intake_clean GROUP BY COALESCE(region, 'unknown');
SELECT region, imports, usable_fees
FROM intake_by_region ORDER BY region;
