SELECT category, name,
       ROW_NUMBER() OVER (
         PARTITION BY category
         ORDER BY fee DESC, gear_id
       ) AS position
FROM gear
ORDER BY category, position;
