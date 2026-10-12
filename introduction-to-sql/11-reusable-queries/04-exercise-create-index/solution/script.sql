CREATE INDEX gear_category_idx ON gear(category);
SELECT name
FROM gear
WHERE category = 'repair'
ORDER BY gear_id;
