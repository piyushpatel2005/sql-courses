SELECT s.person_id AS signed_id,
       a.person_id AS arrived_id
FROM signup AS s
FULL JOIN arrival AS a ON s.person_id = a.person_id
ORDER BY s.person_id NULLS LAST, a.person_id;
