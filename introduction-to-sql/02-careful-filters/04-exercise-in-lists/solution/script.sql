SELECT name,
       category
FROM gear
WHERE category IN ('repair',
       'art')
ORDER BY gear_id;
