SELECT rental_id,
       CAST(borrowed_on AS text) AS borrowed_on
FROM rentals
WHERE borrowed_on >= DATE '2025-04-01' AND borrowed_on < DATE '2025-05-01'
ORDER BY rental_id;
