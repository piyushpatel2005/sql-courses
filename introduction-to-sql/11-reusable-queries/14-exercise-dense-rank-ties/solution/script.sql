SELECT category,name,DENSE_RANK() OVER (PARTITION BY category
ORDER BY fee DESC) AS fee_rank
FROM gear
ORDER BY category,fee DESC,gear_id;
