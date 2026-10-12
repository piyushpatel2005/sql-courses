SELECT m.name
FROM makers AS m
LEFT JOIN bookings AS b ON b.maker_id = m.maker_id
WHERE b.booking_id IS NULL
ORDER BY m.maker_id;
