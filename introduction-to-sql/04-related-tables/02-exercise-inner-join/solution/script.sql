SELECT m.name, b.session
FROM makers AS m
JOIN bookings AS b ON b.maker_id = m.maker_id
ORDER BY b.booking_id;
