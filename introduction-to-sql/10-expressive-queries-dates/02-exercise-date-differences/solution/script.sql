SELECT rental_id,
       returned_on - borrowed_on AS days_out
FROM rentals
ORDER BY rental_id;
