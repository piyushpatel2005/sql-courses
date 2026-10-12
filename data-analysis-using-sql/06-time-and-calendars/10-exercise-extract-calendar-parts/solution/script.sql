SELECT period_id,EXTRACT(YEAR
FROM starts_on) AS year,EXTRACT(MONTH
FROM starts_on) AS month_number
FROM report_periods
ORDER BY period_id;
