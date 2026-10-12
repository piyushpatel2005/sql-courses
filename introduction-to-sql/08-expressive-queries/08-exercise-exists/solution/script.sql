SELECT m.name
FROM makers AS m
WHERE EXISTS (
  SELECT 1 FROM bookings AS b
  WHERE b.maker_id = m.maker_id
)
ORDER BY m.maker_id;
