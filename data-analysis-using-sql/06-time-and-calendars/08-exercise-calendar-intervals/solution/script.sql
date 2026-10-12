SELECT period_id,(starts_on + INTERVAL '1 month')::date::text AS ends_on
FROM report_periods
ORDER BY period_id;
